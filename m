Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F1341B112
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 15:46:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198022.351310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVDQv-0006ZK-AQ; Tue, 28 Sep 2021 13:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198022.351310; Tue, 28 Sep 2021 13:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVDQv-0006XC-7A; Tue, 28 Sep 2021 13:46:09 +0000
Received: by outflank-mailman (input) for mailman id 198022;
 Tue, 28 Sep 2021 13:46:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVDQt-0006X5-9P
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 13:46:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d33c7d6-2062-11ec-bc91-12813bfff9fa;
 Tue, 28 Sep 2021 13:46:06 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-4s-QoxVtOh2q_3Ky3zEF_g-1; Tue, 28 Sep 2021 15:46:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 13:46:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 13:46:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Tue, 28 Sep 2021 13:46:02 +0000
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
X-Inumbo-ID: 6d33c7d6-2062-11ec-bc91-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632836765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1e2UxGNhGpbeevwfItRHbrV3DJCtEnSX9HXGLkrSQ9I=;
	b=OoxueNrhBL6PiL9mbYznSgoXru+pS50zUK//ph8ktOo1Hd7g73JqgZwXdZUxad8xyXL56U
	Qazg5bJRlylgbStZPIOV8df/MhVnAL/KLKlSwnrH5kosUZZYfdj5Mj2qVvadcWnLK+rAwH
	JjdXnY8dDqwJodhBrlx23MMxwS8lQkI=
X-MC-Unique: 4s-QoxVtOh2q_3Ky3zEF_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqS3WpDWRSs45zAbeS693Fy1rEAiKB9wL63hP6h/tbxM0OHlsUVhz1XgEh+PJwpAoZ8ls2Hehl2Xim+TlOKRZeKd1xMoBGNfRAKOyvc8qmHWPhe5o5ERPX8vEM+ruLmtxm/ObnzBrh6FvRXXEV75logO2Lv/9jfSos4tZ1801qFkjcghgEATJtSYb1ubddmdVUGdkRVplCoJP+Np6P6Rl0MSh+r2WI5uelNTPOlSYwFfRateSULeE0sGXmlfZn7whhG7SZkLssWKWFFqw7Uy8PRbfqD2iyv2BDWjcYYF9NpGEodFx8stXeLzuRLH3YTSIyvnHQtENFFKvieqJG6AUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1e2UxGNhGpbeevwfItRHbrV3DJCtEnSX9HXGLkrSQ9I=;
 b=eqSih81HK8/FDD/Opcjfa9pACtbXY7EOb7TrHvJB+irtkb+etbG5qWVVBnyuE5iJsAkJu3xB90rhluviOS73K371JOfa/L6sbcIflJZGgWaexGlMRVT+GqX9XxJwx/o3ZrzIZX+zZmvvZwCPu0z0xfjFngBF6+QWc+ipopcJBTdDjf5fXYILrfyl9gpKAA0s1qMrwlaOVuOIPt7gJFitaBDJbt3lIOHTmlIAO51Bt+xpx/Wj2jHgzUG3u3e3TbKafv6H4ddwj7a4BNAoLFxgJMy8574bbD0fjmzfRlPw339fy5lLWWoY6CyK4nqvs2evCpE0VpUodRQ2CAfPU7CIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v4] xen: rework `checkpolicy` detection when using
 "randconfig"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210928083944.780398-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bdd68129-0415-2018-c0bf-98687094dab4@suse.com>
Date: Tue, 28 Sep 2021 15:46:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210928083944.780398-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 772b6d68-1899-4ec5-8360-08d982864fde
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48467DCD56C4EFFBBA92649CB3A89@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m7xoX4XmJzZ5GHwtKCf/bUY/xheh7sowhru8maHwiG9LhYocHDPRHWG3tFHxopFxzBpTpIdHJmm4OnNJcGitS2bQAz84FCNNa0JFYTXJFTl69wqoNpiqbThfP59kXR8UNVojDe7OBIqL+0QCIvAw7OWn64n9XzpseT36waMZqylN05pVw14TxeR928Fsbg7rVleJKDDuIDBS2b6J+946CR6Xq6nLjj5CuFZ+DgXTfXH2ZoBNbd7SfsTlYkiUtAoUPj8uY1TNrVgJyzo5DUTGy0QUnOgNqCQHisQMStslY9VUDtk/C7qsd536Q99zZMn7raCB3vlTi+qEtwVPES6TjDUyvwEHfOAnk3FyLQWMIcW93nKzLwIKW7lvYcsWT0mUUHxYDkDspn7CkfT4pWMRzs8oYWFiDUqFW3DLL12mW4BOA51eNCIhPkd6mA2FE/6+7pF4jGRSsUPthonxDI9brP4j7f/Hy/nolI4t80u6iOoiJsSMIcS1NOIRUdD+YfulJZAh4fI6jg8/ua0ybImtmzsq+MMzVKE5t0/+iUVUvSR+I/DzM9D5+o0e1NpgekxfrjMJoIg1OGrr6z07UKYR1Hc9Gl9NS7Gg3q5bsiWmYQgAfVZydjHJ6kDan3wQHPvImDOdaGxf3BRhIpa/n8Z1QIcN3WAcNcn2P3tVKrxWFCLf692JqbBsxLm2REtSSxqZauc2iAfdxVpEibyCCip2psGNgSOewLwy4hQlUsSqMR2q3T4qZjOvaChxXb6RZnXR9meMTFi+wCfX7MVUzOPpNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(54906003)(316002)(8936002)(2906002)(66946007)(66476007)(53546011)(66556008)(6486002)(16576012)(31686004)(508600001)(36756003)(186003)(2616005)(8676002)(956004)(83380400001)(5660300002)(26005)(4326008)(6916009)(38100700002)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3AxY3dzeVpUOXR2bk10SkZoK3JTWTBqR0U0eU1GYWhMUVZ0bWxPc0hvL1N6?=
 =?utf-8?B?TVdRMW9oTUZwRE95V2E0K1JwOFMyOTNQUHJDaWlkNkdCdlQ5WWo4L2NOelZx?=
 =?utf-8?B?MFYzaHFMcUdTcDR1Tm0wK0lsUGR3dklkSWVMdlpqNldIUnZKdkJTYUQwUnhz?=
 =?utf-8?B?UGl6MHZyenpoYm5Uc0RqMTAyN3VHZm1kQWJUcTV4ckR6cVdPenlaMHJPYWFj?=
 =?utf-8?B?bnU1SEc4MmthTDdmemJKdUJKRVZLMHBZNWRGSkFwRGpvN1ZES04wdTV5elN2?=
 =?utf-8?B?aFdDaWVyWDVyRjZ3blFqNVoyaHQrWHFFb3E0b0VXQ1pqZVUzNTRaWVZuTWRH?=
 =?utf-8?B?WnB3TjFSMnkwa1ZmbE91L1RKY3l6VVlBRis3R1FxTlRFeEJIcGN5NFdxbm8z?=
 =?utf-8?B?Y0loTTIyWkowOXQ0SjBCR0lSK2t2SUs2RFllT2dZNDJrSStPT2EybjhveXB0?=
 =?utf-8?B?Q2ptQ0p4R0V2MENsY1M3ZHY1SjQ4OTBoTmtIQ2JvMVBqWmVtZFRMdVExRVVW?=
 =?utf-8?B?USt5SFF4bjhVck1nMUdyRm5ZNUozYW9yU041UUtTbUt2VmVVdGJvZHNaUUdU?=
 =?utf-8?B?OUFOU1VKTWNtd1l5L0NNTnFCRGxUY1dVTVcweFZiVDB3SzBBbjNJN0dYaFpr?=
 =?utf-8?B?ZEZ0T0Y2bkVPNFk4UEhOSlR2QnljaDd2Z1JCRjdtVzRoeUJaMVY0MndhaU1P?=
 =?utf-8?B?VWQ2bEQxeStpT2VISStOVXBkT1lrcU5SUXlMM2UxWkV5Rk54bTFWY0FCc0x5?=
 =?utf-8?B?a2hicmZZTnh4bmdrZWlWWDQ1WWdPanBFVW14R2VYQm9sMWhManZOYVp5enNM?=
 =?utf-8?B?UEhMbjllNW9PK0FPaGFmcFpKT29zT3loTlhOYnliNnZqZHQ1cThLdm5pNkZa?=
 =?utf-8?B?K1RHYmdFUXF0MHpxUnFSUnZES1hBZ1FCNGF1K083UUNvNG8xKyt5TFVNZzFF?=
 =?utf-8?B?NEFOblZBVFBWNFFOa1R2c2JGSGhqQll2cElVeFFabTR3UHVLUUlQSnUwL1Fu?=
 =?utf-8?B?NkVtWWloS0F5cnBnV3pKRFptRjJqOGVxN0ZIWVVQTVhEQTBGcndsVmRHaGVC?=
 =?utf-8?B?eVJTSkQyZElOWEdvaWJCSVcvQnNqVEtWalE1TGx3S3EvbVUzYXpmZE5JMTd4?=
 =?utf-8?B?cmxkNTBCVXoza3VhTXE5ZzlOMU1JdWVPOWZGazVBZjJDQjRoUmtNOWppZHFi?=
 =?utf-8?B?Ui9Mcm1zZTVLVjQzV2I4SWhDa3k4UWFqZU05MWRnY1RXYTZoUERzNTd5K3pQ?=
 =?utf-8?B?TlNmT0ZlOE42amZGVmJBc2FiWWgzNHlFVW5iNk1YV0grWWgrdW9kRThaTFp3?=
 =?utf-8?B?b1FKMHdJYWVUZitVcVhCU1c2K29jSi95cUFvZVh2WHRXZjJBckRYNTg5QlNF?=
 =?utf-8?B?b0wzWGo3aDcxa2JXOEx2Ky90S1RKWUxwUTJOa0V2eWVvN1BXSFYzbFBKT1Vh?=
 =?utf-8?B?YmROdFU5ckZOdVFQZm5XdUxkT1gzZy9EYXhvUndmbWpqakxJajRRRjB1T0Jv?=
 =?utf-8?B?anRCc2V1MTdRRFZxVGlQQ2REVUFvZXRBZFAzaFhrVzBCZDArWEgzNFR0QnVo?=
 =?utf-8?B?R1pWN29TOEZkOTZ1TWllN1BZb3BaOGJVdkxJMFUzVVZvWjNXUkg4Zzdjem1H?=
 =?utf-8?B?NFN2MklJRDlLMzgzYVVhdHQ3SzJnT1dCWXMzWlA5aFpPb3BxdFdjRGZvZUU5?=
 =?utf-8?B?RlY0QXRBUlNmMkNPOGJkQUNJak5CaW4vcXRtZEFabU5WSUhiQ3hkUzJUT2Yz?=
 =?utf-8?Q?mYSc0eYp7cAO2irC3clRhuqCH9a0RH46kJ9jiB6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772b6d68-1899-4ec5-8360-08d982864fde
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 13:46:02.7776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDQVU6cPCm8+VCjUw4uideAavfU5xtPWPMzpSsq0tsbEHPoaMIbPXEsFgbP4FZIOKcpq6j979UuNc64CYlc+eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 28.09.2021 10:39, Anthony PERARD wrote:
> This will help prevent the CI loop from having build failures when
> `checkpolicy` isn't available when doing "randconfig" jobs.
> 
> To prevent "randconfig" from selecting XSM_FLASK_POLICY when
> `checkpolicy` isn't available, we will actually override the config
> output with the use of KCONFIG_ALLCONFIG.
> 
> Doing this way still allow a user/developer to set XSM_FLASK_POLICY
> even when "checkpolicy" isn't available. It also prevent the build
> system from reset the config when "checkpolicy" isn't available
> anymore. And XSM_FLASK_POLICY is still selected automatically when
> `checkpolicy` is available.
> But this also work well for "randconfig", as it will not select
> XSM_FLASK_POLICY when "checkpolicy" is missing.
> 
> This patch allows to easily add more override which depends on the
> environment.
> 
> Also, move the check out of Config.mk and into xen/ build system.
> Nothing in tools/ is using that information as it's done by
> ./configure.
> 
> We named the new file ".allconfig.tmp" as ".*.tmp" are already ignored
> via .gitignore.
> 
> Remove '= y' in Kconfig as it isn't needed, only a value "y" is true,
> anything else is considered false.

Seeing you say this explicitly makes me wonder - is this actually true?
At least when modules are enabled (which our kconfig is capable of even
if we don't use that part of it), "m" is also "kind of" true, and the
related logic really isn't quite boolean iirc.

Everything else looks goot to me now, thanks.

Jan


