Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB4769BA3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 18:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573174.897641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVJP-0003Lr-4b; Mon, 31 Jul 2023 15:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573174.897641; Mon, 31 Jul 2023 15:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVJP-0003JZ-0Y; Mon, 31 Jul 2023 15:59:59 +0000
Received: by outflank-mailman (input) for mailman id 573174;
 Mon, 31 Jul 2023 15:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQVJO-0003H9-7k
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 15:59:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b56455f-2fbb-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 17:59:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8679.eurprd04.prod.outlook.com (2603:10a6:10:2de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.39; Mon, 31 Jul
 2023 15:59:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 15:59:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4b56455f-2fbb-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/phix4jvlbYuObw78wHrZBSVLIixVTBoSfAAxfBDUB2CaumHVy4tFIMX1vEqdUT1i8o0rQtzbSWJ7A8eSfa8GzZOMUFlim2P08gBkhYELky58KTdH1dFUEzDR7E/YDsdZL6d3uJ9tm5Bc/tJ7KukC1XVeTPtqbi9ciGUi6hEmz2VrM8oKNzJgzH5ULLGBH1RWzfjxUPZ5I2AUBuwfKBa3MHGyqA37j5IyZIfg9+5d5IYy2Dc31p78aM89g0ZnyIKpAp3x+a7K22vzJr4VodiD1DhWxpG3+0mIn/gXaWXuRCYLT6YIxRDOjylVGDZiYCk7N68US9tQY+wg5h/zTQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQm+nDN0b/7fW2wRESzG+Qv9WCFLSoOodgcl2Ucvfvk=;
 b=Qb97KVaWnG1lj3wBUag0eYpiFmCP2sNzGVyYwuWakXvVgdOWUx9YlWQFEgQ71kqaMmXveYnCghiN7j3yXMRCq23dVtrlWBDpe5URWQMEqF3w8bTMXTtNUn7JlKaSzUO757LEL6W3cy8CG+XTfLkgKi6J0hVqvbO890WKCpXJlV/TEoSiEdwS/CrfH55Fjpj7mJ3m8zuAdUbJUNqpw4jQGti9op2NZxtWkEB4T/lsxLdljplK0FLflPdY3DB37uiTbrBqoA8XMeckbNj6897WNUm8s4CRW6Gx1v/xDccKeWtFzOFo1eIZgHsUbTe0gFzf3ly8Z0l7M4Z0NoDAkqr3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQm+nDN0b/7fW2wRESzG+Qv9WCFLSoOodgcl2Ucvfvk=;
 b=H8uaMyZSSD2v7ccJltSSxOTA0o106huinhm+WJm16JC3h17jUcjajU8ae7nN8UodaPmGvYdy4kLP7fqwUe+KRozbqVwE5tb5GF0h4L72z7zTAWMfYZK7sYJTolY7u3+ZtOFq5dL5tuskJJwF+FVLTdRQvFqpwnxy8Rvxx8SeNZpTCDSkDhAknQoZiDqfC0uLjbvup1P/fOfeacf/tPt8UOQYBJ+UlssgXiRld1LoRXvaI2kNNLSKl9NYEw/UV/3ryuqEnx8FHS2ZGc49fNPrjfU9FFbJeR5cjrpM5R4Re6wi8DEDDUVeHfpSKnyzHQFII7PH/6nH+xVP2OtgQclz7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7206fb11-a34e-4c47-3f15-83f5410db37a@suse.com>
Date: Mon, 31 Jul 2023 17:59:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 3/5] xen/ppc: Add OPAL API definition header file
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <7feead05db9baa310feaddd24415774582e88344.1690579561.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7feead05db9baa310feaddd24415774582e88344.1690579561.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7ed068-1119-4c1a-3c7e-08db91df2e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rtHTG69dSlea8FEU6dGaJfUJ81UFhJtXj3P56dfSykHh0upWZ0H82EEX+Cu9zPm0TxVFMjIYrcTii5hgL8j/W6gg0/0BKMoZ4m9r18h8XUw7HgYzvNrBQ4fs/4a4J4LnjMh3Aj2axq+5jMJTZ29s7nU5D9VbRTmka1qfhVEfg6/9flogYIxGS/JOa1sBotoF0c0zp07kqhN+8ZeeOjsP2gEViFn5tNB9B0Cx+c7TJ0v9Hf9WPVPbw1JLlqSp+Q+9pVJZaYEQQDnJ+HuW+0ESGSNsZrMlFrqLuyPD3e19h/oMV0UcgYwqwOgmhR2UAtS7YkaKp8l+/YNpQOFciPqpFpZP9DVsX3/hsbgzQEwwnMMnvxY6MwaaerSXnMVlMZyxaKe8f19v/Pfk3gCphU2anUecFcSLOyjtfrVSynUvJOBkcUuZkt6f7N4q/cAUxlVRGeMUp3OuGBTNea5agPsl29ywjA50P1S+yG5CQnQkrVqpBAn2FKBfV6dCX2mdk8oMoS/JKlaejwIgjOyDahG32AxK51aQiAU8TQ2/LVbMyj8nbdwdnCQI1l8SPxVHZB9SXfOiCaOSbAzk81DiTySSXqWUFANXfQC27iL8DU9NZThi/t5dHZXQb5EawY8BZ6iQONwmnlcsy5//9PRdQVhMWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(6512007)(6486002)(186003)(36756003)(2616005)(31696002)(86362001)(38100700002)(6506007)(26005)(53546011)(5660300002)(8936002)(4326008)(41300700001)(8676002)(31686004)(6916009)(66946007)(4744005)(2906002)(316002)(478600001)(54906003)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnZVVjk3MGxqa3RZUEY4cG5NNHFvYW8xVWt4REsvTGFGc2h4RDdiTFZIenJC?=
 =?utf-8?B?SW53NENpWnJ0UjZESXlHNmp4ZUdGaDlOaGE4N0xibDl5OGRwVWN3TmNJdmdO?=
 =?utf-8?B?YXkzZGtBM2M3WkNYbUp2d0dMNWp5ZXJGc0djNkFnc2V3SU44U0ZXVDdoeVJS?=
 =?utf-8?B?YXpuK0FOVzh0bmt6elViS1NxS3dzOXJ5ZmtpN2lhN21LRkNpR1FUbVE4ZjRD?=
 =?utf-8?B?eDZwT0V1eHc0Zjk5RVdnQyt0NWoxZUNXWlM0VEtJNS8yRW0vQkJoWmRYUTVu?=
 =?utf-8?B?aDJCN2JDVlZGalhWME80WWFIV3VISlk3a2tyYzlLRVJoOXJwak1hNUdnQ2E0?=
 =?utf-8?B?cXlldVZ3MndEYnVETkZIeWNJRnpVblhPeTVkYnFuVXBVY1BGNjlHSVdtLzRE?=
 =?utf-8?B?OFRaemZST3FJOS9rR2V5cnZpTWF0RE4veTJlbGRYcWhQT2RGZG1CalEvU3ZC?=
 =?utf-8?B?K21sZUV6SnhhcXhiRjZhYjdaS0VSejdKT0syQWhwQktNVHVrMEZ1VklUbjl1?=
 =?utf-8?B?OVE1UXZTY3g2ZmR0UStBcDdoOTZsc3BDQTNyYmlseVNOeUM0UG13amg0K3Rw?=
 =?utf-8?B?YTQzTUM2Q1QxdDA3aVBtR3AyeGQ4dHZONzRKNHFSQU92bWxhdW1XL09FRHdv?=
 =?utf-8?B?T281ZjBOSGg0WElGbDhHOURkSE9nckRvcEF2eXZOOElUQ1ZoeThtM292dHh0?=
 =?utf-8?B?bXBXcXIxMG8rSnhLQ2RhZ2pBc1l2czJMNENidjJWMWJTbFVHdkNFcHMxNGVO?=
 =?utf-8?B?UXFqc0ZQc21USVViS2Q0NG9JUHRRK25DcFVHbFQ0R0hEZnpKV2VJTHB4OGtn?=
 =?utf-8?B?TElseXVNWXl6NGw4MHpYTU9xVmJNdFYxaWI1Y0ZiWHFiUlBlZ1hVV0htbFBi?=
 =?utf-8?B?QWZCSy9VclBoMUhHcFZEZkxhV29uZTdXUUtmSk43WWh5emdUYzNKL0JMVTlE?=
 =?utf-8?B?Z1pCWWY1ZnJ5YmlkVDNjcWFSKy9uT0psUHFrVjVROVdYb2hXcXBGbTdtSnVC?=
 =?utf-8?B?eS92REF5NTR6UGZrRlF2WCtoVjRzU05xMHE4TnJ0VEg3aXJXdmFEVFVianpU?=
 =?utf-8?B?bHhWZzhROXpDWlVSMHA3MWYvQ21lSUVuRHlXSm9xdUkxMjZ2cU45M0pubzRu?=
 =?utf-8?B?NUVhekdmRStLNEtKWXdweEY4UnV6bGR1aEdQYzBZNzRSK0FPUGhsbWhqOGcy?=
 =?utf-8?B?aXdyNlZEUTJtZjRpSFQrZmU2QXcyTEdIUFlycElSWXdDQlA0Q3lGWEIzUXMx?=
 =?utf-8?B?SWViTjIxTXp6eVRYdTBwQlRVK1ZoQTZNK1c1YXVWL1RGbENuUVhHSmFDS0ty?=
 =?utf-8?B?YkFkQjFZTnoySDVCSDZvaTFaM0xjdTNTOWIyazUvNkx6SDI3cm1FeExkZWVH?=
 =?utf-8?B?QVZkMWxFT0JtMXdTaVRRSjNCZ3NOSVV2emtpdGlaSExnUXBuOFhCeHNadUJY?=
 =?utf-8?B?TVdlTGRvVHhaT3N1UDh2djU4eDJOSUNxUGxWWXZSM291bjc5ZkVzTXp1SmxI?=
 =?utf-8?B?U3BhOFQvTGxkVmRUYkNqTEUzYW5sQUc5QVhQUkd3ZmpKU0JYM1NKMVRycEh2?=
 =?utf-8?B?THB6NjhoNzRiTUk4bmNZNE5ubDBGMEkxTG8yM0NHbGlRVjVHY3RwdXNESDhT?=
 =?utf-8?B?NDZvb3hkd2tMWElYWVRhMVZsSGJFa1BhN2RGK2F2ZzBoV2tpSEpsMk5zUEZR?=
 =?utf-8?B?cWJBY09HeTlvSWJxRVpQVnZFbjJnYWdtZjNtVEVhcDF1cEQzMi80eVhjU2Rk?=
 =?utf-8?B?aDh5K1YvK1UxdGhhNU5RdkNMdEVFUHBKbWlweG05ejQzeHpXdGdzbVkyRlNj?=
 =?utf-8?B?WnhlNzZ1ZWQra0dseVVmaGlGUkdUYkRYdUZURy9NVy8xVGNPUGNZTHg0Njl2?=
 =?utf-8?B?RXpSZC9xNGdTNUwyWXplSWs3ejFGeXZ6b080eFJuSlJCcVBzVkJtQkVRcHFU?=
 =?utf-8?B?bHUzN0xLL3F0T1p5Vm04UG56OWFXQlBnbGRrRENGbmNpRVlvQldncTljbU9j?=
 =?utf-8?B?cEhiQkI3amZvUWgxVHFWMmNScFRNb1k5em1HSUhXZmk4OXFpUjdoelhva2Nx?=
 =?utf-8?B?djlYY24rQnV5cll3Yjk3QTEvK0s4dWpjL1ZleWZCVXBiMzJIeHFta1NvbFhW?=
 =?utf-8?Q?/HETwXFgrQ7LQSnx3kJFuVFlw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7ed068-1119-4c1a-3c7e-08db91df2e4c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:59:54.5336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oxyrnqj2aFVBeGmDkJZvtPk/tskCwyYOp5dgP/l+c3ecDoQJzIi7B4GAB1Zkz/+8meT5D62aofvyi5qWegcSiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679

On 28.07.2023 23:35, Shawn Anastasio wrote:
> OPAL (OpenPower Abstraction Layer) is the interface exposed by firmware
> on PowerNV (bare metal) systems. Import Linux's header definining the
> API and related information.

To help future updating, mentioning version (or commit) at which this
snapshot was taken would be helpful.

Jan


