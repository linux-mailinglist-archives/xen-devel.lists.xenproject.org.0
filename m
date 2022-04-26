Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F73A50F993
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313633.531274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njI31-0008L9-GO; Tue, 26 Apr 2022 10:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313633.531274; Tue, 26 Apr 2022 10:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njI31-0008J5-DD; Tue, 26 Apr 2022 10:03:55 +0000
Received: by outflank-mailman (input) for mailman id 313633;
 Tue, 26 Apr 2022 10:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njI2z-0008Iz-42
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:03:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c0bb95e-c548-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:03:51 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-9pNfqGGgP6Gj0_s_zLXjOw-1; Tue, 26 Apr 2022 12:03:50 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB2700.eurprd04.prod.outlook.com (2603:10a6:3:d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:03:48 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:03:48 +0000
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
X-Inumbo-ID: 2c0bb95e-c548-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650967431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yatpKeRHw67LhXWVtbu1bwRRmESxGbKhP7f48u5Z6qI=;
	b=D3bd3s4hDj9C0jRDHEDPzvPhvi2x59aM16y1ZYiYXWLn8AIREP12DEY9E2XAcoA9pKkPHb
	l4YEnPqD81klryv9XJbdSPqMeGm7ldSD2t+5n7RIdKDsjKPGou9xXkr6n426xnzOp2flXo
	xtKe0cVZ5NseMY5jp0934ctAkrhWoIM=
X-MC-Unique: 9pNfqGGgP6Gj0_s_zLXjOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efJ8a8ryHzgy+pEVjsD4svlRRg1CHQw8sleMwVsj71mxscvICN0FYnfNNhWxXt6XGkppOSSdqQqMGvKZ3RhagR46ki1XwbzGLXOl1hOj1TYIwRoIUOOokoAsla/0fcwR/2WobbY4AAcZoetDVGUzh3mKcs9bInJT024uEtgXWSJ0fh8C2MvueNUa57TRE71MERVzGV1fumFik003eL+zLDtrM9xqdcxFI+0+Nwa/+9wE67TJv5ZvAUZ9D9NyxPvls1OxyHs+PXiiSqeXrabxhyt2ee+FV+mzW0sQCZ7MTFuuzWLp5s0/ufi6K2oYvaBn0L3wXjX727xEan+OTQQIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yatpKeRHw67LhXWVtbu1bwRRmESxGbKhP7f48u5Z6qI=;
 b=DXg8PsX81dfWiGFxHitDPIW2c6yXhmQ7Dlt3WdBEvEZ+iX4E0wX+29CErXPPrKsV8NuCcaByJjzzfT7OYaYUtWblrC4kY1WD2ycbT6A1CNkyu6YNYvfPsi2NNPOaatTXsNlBKYdJJYOMEPBtGXETeA2DKvyH2m46lFIsjlWYvGbPpSAh8eiJno2NeCc1Llsfatzwk96dvkXS5vkiV7McF+bdNFvIMdpTyNqknXLnpUwoK5xqOQ8P55OJIfyAOD9xDX7BA9kN0HP3vdJOu5sasQbTPfqA8qWqbQ3Z0J21YImo5ywaou0JY1YckDe0gGn7fFgJ6DSLFPl75h4C55LwNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
Date: Tue, 26 Apr 2022 12:03:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86/mwait-idle: (mostly) SPR support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1c67c0-8e33-4135-e528-08da276c0ecc
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2700:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB270050B26FAC0CB79A233EA4B3FB9@HE1PR0402MB2700.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cEbYRqZwfz33GNSyUBOuNKGzOJPGg/EX/Y+mG8wyq2zeITXgj4Pt059KlK0qDjb+xrKObO3QmDKjktgt/za7zZhFitmLL2aN0TGzJZ/Z1LssLKBlJ7MT2BlSQaeotW/WGbx2p+iUnXdlYyMLSxr7mcLQg/uKPQ3Zae5OpJwlVqmtEWwFWIISVqN7ehxrr1eLXbX9JHVFLMdqyicfpldr2qExZ1ySllG2QmGJ8DhLfELjq4r9x/mnFJW5yNszieHK6eXK4Q6Rv8Tf80DtBI4igspoK5iMZyQ4D9XLkfkBSgPCqIIfkGbxQaGBEkY/co8jxccR/zCGsNS+b2GytW7B0NMXmwUy7QTmKO0ATkbKho/RJtOBorLpqTDJLB7kGYDKLSQWkCwn9BqmsnPw8PVX3j0CY2rF9y6Rzoz4R7vi0STK2r0laDkp7ACwhcNS4aN6QoqaSX3zmGngvKErX886QopTaoZzyvdk3TVwe+tcipFV/dJzTm7IdbBNnnncRe7hUqWPtNFfUz45gpjYeRoTNi+SPM3L4+RXnEDe6cwqZgAOshI/zH834vwhSUd9BNyACfEnl2JZ8bfOu4JzE4aLXfBf9/N8QjJSm1YIitk06aADSVxfnIEk0UOHmbnw/Hx17ApRkpz4K/xSR3eW1qa74mCQdwMhuKC3+HYkq4VzSpGgnccbqb/sr8xWZO1j7j05au+R6jYhfdrprmPKV1jpAbJ7hpPnEtK8fzh2KMuebGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(31696002)(6486002)(38100700002)(2906002)(558084003)(66476007)(8676002)(4326008)(66556008)(66946007)(86362001)(8936002)(316002)(6916009)(5660300002)(54906003)(83380400001)(26005)(31686004)(6512007)(2616005)(36756003)(6506007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWd4VUJpV05iUHlGTXdUNHFIU1JlNFNNNXpBZDJtY0FJUmJLOWwveHcvYTIv?=
 =?utf-8?B?c3dNamYzVVdZNmdpVDBiaTAwb2NWSjJjMzVoQnNNbmIvSXN2WEhoNkVUSTNC?=
 =?utf-8?B?WjFHeHNiRDdlSVNGQWR2T044bU1OSDFZdi8xM0RROE9KbE9ZcmNodzZUd3JO?=
 =?utf-8?B?aWJIRm1pdEZVRkprT2Y2cEpjenZOci9YbUF4NnQ1M2VoKzRYMUwweTlNNlg2?=
 =?utf-8?B?ZXIxZmNVdFgvR2g5TjVCdjlua2hXUlpqTTZUaUhLZVNuMWZucWVoY3I2Sndn?=
 =?utf-8?B?ZXRFQlNXN0trMGg5NWpWYXlsK0J0cUNkZnNoRHN1U1N5OUNKUmhGR0NNMkJl?=
 =?utf-8?B?a0F0bFh6TXhCMGZZdDRwL2xZbjhDL2tOOFVGTHp4SU1YeDNFRGU0SzhPdm9k?=
 =?utf-8?B?SXNIbnRnQWFBRWVzeGJrV2h6VUxEMzFmMm5wTkRTOUg5NVhYZGtId2xRRXc2?=
 =?utf-8?B?V290QndtOTVzeSttc28yaE1Nc2VUNVRiN3BNVkZFN1dNU1lEc2g2cTB3SnI4?=
 =?utf-8?B?T0JjQnNwZ3pISGxVV2xvWnFHOWtqSjlUYS9qWVl6MVk5RFhyWW5SME1WRTZv?=
 =?utf-8?B?ZmFySGN0SExRdzRicDVzazJxNVB0aUgyam5HQlpMV3A2KzNub2g1TVdhbmlK?=
 =?utf-8?B?djE1cGx6ekgyRG9WM3BwNExTN0sxcTZNa3htQ1JBY2x1c2E5VlcyeW44ZDhr?=
 =?utf-8?B?UFFKbjEySFN1Q0I2WjRZc1diUjN6MWpDMm8zTllnaTRrdlozaWp3YlU1RGFw?=
 =?utf-8?B?OEZuK1BnYlpqdVRTNTlNZG9xb1hMK1dtMFR4NG5VVjVBTjFQK3BiNWpXczZK?=
 =?utf-8?B?cWRCdWZYejZFSUI3Wm9IZjhSR0UzZ29uRk83aGhjbEhCTHl5alVlM1J6Smwr?=
 =?utf-8?B?K2pCSS9TQnVMK2lZNWpTUWh3aC8xQ2d2aFVDZi9Ca2srQXhGTHFhZktYWERD?=
 =?utf-8?B?RElHbDdSOXd6b2MzbThmN24xdzFsQUpxVkdnR082bXRMZkFHT3NkSkNqRngx?=
 =?utf-8?B?ditIanJkeWpjdFNqRURMc2RRUnlnMkMwRm9BY0ViK1Q0cCtRaEREbzM0SXZy?=
 =?utf-8?B?ZVRIc3ArQnlhZlE5VVVYMTRqUk94b1hXY29wUGdwdHdCZEl6c01JVTNMcUZK?=
 =?utf-8?B?di96M1I4Q0Q0Q3BYaWtrYkVsNDcvc2txZlhmcVpkQnIvTkNzU1ZMZHlIRjdk?=
 =?utf-8?B?VWdZVStRQVRFeWptbnQzakIwcVpXdnhaK0h1UFpZdncrd2kxM1l1My9OdTVx?=
 =?utf-8?B?NjVOK0JUWHdsRnd1QXNPMW1KeFZyQmJTQUtzNG1jR3M0L0ZUZzNOMURETkZF?=
 =?utf-8?B?Z1BuejlLOWhmc0h6YU9CM054cmNDRkFXemhBakYzNzNKem03SHNMOUErOVFv?=
 =?utf-8?B?VGJsdTBqYXNldkVYTS9jbWNEVkdGK3FkbkpCT2NTYTlqMFNxRWtuVHIyU281?=
 =?utf-8?B?UU12ZjZ5M1plVG83a3Arayt4V1hDeElYejlTRlJjYVFiNFNoWEJFRkJ5bGtT?=
 =?utf-8?B?K2hqL0phbXdrZ0dZS1BId3J5K3pFNmpVbWNpSEpsMEZYMHdMTXE2UFk1ZCtW?=
 =?utf-8?B?V0F3V0tmcldzeGpFVWJXUGZqcXhvUDY5bWJQazlhZHlZV05xanE2U1BZMGdJ?=
 =?utf-8?B?MTRuQVBRSkpqa2tBc0hobHFDWmF6OURKQlNLcVV4VWFyMEZzVk1XNFVodVNz?=
 =?utf-8?B?THFKMGFhcjd4YXYrdUw3Zi8yVHk2OGU1QmlGTjc2MllSL1JJVUlHK1pOZjFl?=
 =?utf-8?B?OFlsZGZ5Vm5mSllKR1QxZkROOHo4cy9qWXZXd3JZdG9RemVzVzQwUWwrc3VH?=
 =?utf-8?B?TkZHTFp5SHpGR1FVSTJpRi9kTXVKRDdzYXJ3SjMyZks3bno4MGVoVnM3d3Uv?=
 =?utf-8?B?ZGNtVURZa3dLcHJveTFtaE8yQ09TZTh6VlJDU2E3M1gyOVdaUXpWQUFDYlh3?=
 =?utf-8?B?angyT3Z0amxIYXVGUEloZWhBOW1NNXo4K0NiZkFpU0NsVDcwQzZhNVZVMHdU?=
 =?utf-8?B?OTRIWjVzYUtwM01MRVdSU2VyWk8vd0E3ZlZwNWE4VE1mVUN0UVkrWEJGRWdT?=
 =?utf-8?B?WDR5NjlNemZxUVBoTUwvTVdTMSt6UE9HM2p5bWNmV0w4L1hOcS84OE1VRmMx?=
 =?utf-8?B?bWxMQmpKS1N6TFdGbGRlOTlrYW0zZ2Rlc211SzIzR3AyZ1ZkbDRITUNibjhT?=
 =?utf-8?B?M2VlNjMvTWh4VVJhQWdkWG1oaGVVUUJGVFRqMytzeXJ1UVY4Zm1qc2VvQ2Qx?=
 =?utf-8?B?eTRXcDA1NG0rbFM1WjNKeENuQzV5QTcrcFQ2MkRKdmpHNnlOTVB5TEZ0WTE3?=
 =?utf-8?B?MmR5SzIybU5qa2ZKT216OEVnT0ZNMjl5RktJZ1NsZVVIUUtrRTZkdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1c67c0-8e33-4135-e528-08da276c0ecc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:03:48.6325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjKj94vOajl0UEr34MZOE74dXjM9sVZ4JwdhyXJAlKNTjMSIZA+qSZ2rBE+ee1iOxEwJDjvmdsY4yNCUzolqjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2700

Fresh from Linux 5.18-rc (and with adjustments to address issues noticed
while porting), except for the 1st patch.

1: switch to asm/intel-family.h naming
2: add SPR support
3: add 'preferred_cstates' module argument
4: add core C6 optimization for SPR

Jan


