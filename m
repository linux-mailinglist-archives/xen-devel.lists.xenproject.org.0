Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFB651D94C
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 15:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323152.544746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyA5-0005DI-2b; Fri, 06 May 2022 13:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323152.544746; Fri, 06 May 2022 13:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyA4-0005AQ-UZ; Fri, 06 May 2022 13:38:24 +0000
Received: by outflank-mailman (input) for mailman id 323152;
 Fri, 06 May 2022 13:38:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmyA3-0004wM-Ji
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 13:38:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc6f518a-cd41-11ec-a406-831a346695d4;
 Fri, 06 May 2022 15:38:23 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-cs_4PFg5Mrenl35e3IAWxQ-1; Fri, 06 May 2022 15:38:20 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3911.eurprd04.prod.outlook.com (2603:10a6:209:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 13:38:18 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 13:38:18 +0000
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
X-Inumbo-ID: cc6f518a-cd41-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651844302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f8GNy0NWX6iFubC+WKy9yx2VYFaxzWyaihBYAh3/6F0=;
	b=OZWidaoum/twGLG/rqXWzINqM5DkeEcxH3XLImqPE4yzMBG1jGQBLT4zpPK00QpV4ynRv9
	KV9j2lJpJTpSC/vU+iSmR/LI2MGpsEdKsMjKnvHDXcHAghjJwKnqZyUZSfH71IoP3Vaq60
	Oxr3xzshjckv7m6e/QttGaK7R1JVZxc=
X-MC-Unique: cs_4PFg5Mrenl35e3IAWxQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLwUsErMnGmApkLGb8SqvxqUEmGM0fhi73v+xETWkCkbf3lexPWT9grTdKKGsjLFPgxaPUXTt2kRUzZmnhA3ApG4D31vIVMpBMxofyoUqPOU0tXncwZBo3jzfixN5wnwrz05LxJVLvpyZkbYZ/q/UXpSx6pvsRM6hyyAs0E7d/OjIG66l4kyvjXk3UhcihXsgIazEHkvYbOOjD1TNnM+tlfqOPFe75D0Aft96VQfUqWnmW6nptxQErjmj8YSZhgGVWKdcwu3df8mfJViQFpo75U/bz4aCqlMEH7XL/rKg4ArxnP+pXRBDfrwqKTvs1+w6tJdJxoRmL48ACk5c1KUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8GNy0NWX6iFubC+WKy9yx2VYFaxzWyaihBYAh3/6F0=;
 b=N2wVBOF+SrwaLkKmD/1hQc80JsMm46mnESls1GhlFtXo+bmFRutpZ1FvcHqPrfnIJZTeo7b9bJw3IGWtTjWhuE8I0L+MzeeONYw9WlQIfTX5aMQXcWC3Xabq3eJGPL3/K8eMqkxDahMy+f0O0GAkxIQ4vlhzgVm0E3snyfUhOVncfQJDm0NS8Q63b8kpcjdAMN9WgV0WBJ2940r5h7TFon7nUmBS1oFIMGyEHLqZNzC/3Nwqpe2UNR4X4HjZkymmxqrZtA6z/jGimh2cBL++TtllKd+ZZx5mW6I8IXSncEXILhJ7RmgsTF2POZD8kgW4bf/3VWKQpKBOFq1HczbdaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1905d86c-6363-c6b0-97b3-beb91aca9055@suse.com>
Date: Fri, 6 May 2022 15:38:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH 2/2] build: silence future GNU ld warning about executable
 stacks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
In-Reply-To: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0108.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4a393a5-b1d2-44db-75f1-08da2f65ae10
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3911:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3911CADC0905476D5836FC25B3C59@AM6PR0402MB3911.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uvBZPavvvCsVKmYIwT7ZcpUJo8ZTAbg1oc/rvFXjB7rJhUgVf25LX/GgFgILW9UjkJvs8oOwsaEhtVlP9c8EmBLzBKcMHUCbpewehLemaIQUBhLir4qpEs1NrR8laKGHH8/8EzXZSehxBNQGs1FAHED6N2oiFHqP6k6gLYTQJJyq6OY186jQ8NinE8ZPZuTu7d4ykkff67RnA9Mg2xpWtdiUPInYYKr4YIbc5p6hvneeowFL3qyEH61TVUbD4GGNlWmSkXUdeX4TWe8Rqdxa4O21AgYcqx8bEp7X52NF4oBE5vQP0Ko3aoQHLohUm9XDDvB0LhlsCytVsB8RJQHgayp+hfI3/mWolVvDs9yoMelvdKf0frtQPwx6odvx2b/sFkvPedy/dtouH8lmfwVxRjXqKmzqfyd8t53ao0OoHFUqiR94oxPG5tkdh6IowMR8rfUQsqTad1t1Z8/tlOJXVc0IEsh2CbV5Gvm7XEU8LMz+D6iENTdSsDouKNZ4qMnHjkIfw+wqYzYN5Hw13ZYdszQXMkEY3cHTrpLIVB5H4zbqD2FOzat2CnomClSKZj+qbQeqb+vN0e1CU7oYlRyawBrrb7eRTeETR7dN+SEec/KPKRfhOfh5U/8mslugzcQXMu4R1qH6jEWSOzAa0vZ39K8+3p+3o0fqNWTP+sbgikWo6b6SXd8OxVobSmjFCJA6z539Ufhd3kHQyBIWbUUoVebdb4JVh27Kw2Z16M7K3v4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(8936002)(66476007)(31696002)(86362001)(4326008)(4744005)(5660300002)(2906002)(38100700002)(26005)(54906003)(6916009)(2616005)(508600001)(6486002)(6506007)(6512007)(316002)(186003)(36756003)(31686004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0N1YzNuQWp6L1h5aitrRk4xWlB2cUx3VlQzdzN1SXB1YnhFekxqMGNxSXpy?=
 =?utf-8?B?VWh0ZzhvMDc3QmxnNEhBRVRXeUxZc0tMckU5eFJmRWF2blNBTEY5NFA3RFV6?=
 =?utf-8?B?R2daOVNkUEFseW1aRjdzK1F3cjZwNGcwZWhaejFZa0pwd2J4YVJuaktneG4r?=
 =?utf-8?B?bkJ4K0MzWjd4K3FVY0RacFg3SWxNRGh3QzN4TTR6L2ZRcTlaSGJHd0I0NElC?=
 =?utf-8?B?dFBaT2U4NnN1dkFwTlNDU3lzN1paMVdiMlhjTWo1dTljUHIxY2pqajZWMlYx?=
 =?utf-8?B?MzFkekx0QlNVRzl5cTA1RjROQWxKYzNNbnVoMnpHR3BzaExSS3hzVnljMHp5?=
 =?utf-8?B?MkVxdkZDLzE5dGowWWp4S0tzL3UrRVlMMlpNZE5JeHp0NkhMZE1uRTdNNzFW?=
 =?utf-8?B?WldwVlNrYWZueHcyUEZrU21EUXd4MUpQdTQzTy93LzI3bXVKRVNmZnBKOHgv?=
 =?utf-8?B?V0tRU0UxUk5PNmw3MU1vbUxNaUN2a1BqdDg4dUtSbXNacm8xa2FHdWhLZktT?=
 =?utf-8?B?ZzRTQStQQUJJcDlrUWVYZFoxcHhHaEZXT2R4LzdpZ0xTUEE1cmZabXNSNW1y?=
 =?utf-8?B?RGQ5Qm11WWVnRmZES2xCcHpHSkh5Q3ZFbWcrOW5ZMnRtMU50Z0dGWjJrb0dh?=
 =?utf-8?B?aHlCSnQ5OWZrM1JpRTl5NUJzbi9ZOVNRNWVTWXU3cllmL1pRdi93THQweitM?=
 =?utf-8?B?dDR6bUVEZE03alVPQ1dTdzlGK2VhQXorcjFOOW1tbnp6QjJoNExnVjBlT2VY?=
 =?utf-8?B?OUlERGlPVTRGdFNJaU5RWGgrenJsWmRJOGF2bmtEc0pZY1pMZHdYb0F0bHV2?=
 =?utf-8?B?d0NQRXN2MUNyUDloZm55QXpHUDd3WUZRZlo3MWdMNnlka1NnODl0emlQbkxi?=
 =?utf-8?B?TE5wZDV6amhHUTNnMTU5U3hiUldtN2hXVStTOXZHUmpUbU92d3NkY2t2MnJP?=
 =?utf-8?B?eG50ZlNJdElrRnpDbzRURWZISzlhdk0rKzYybHd2NGhUWXNlWnZLMm5zejVu?=
 =?utf-8?B?ODNiZWt6QWxlQnRHVGRqb1kxbUhiOERtamRWOGxEWjdKdnA0U1cvcFhzb3dR?=
 =?utf-8?B?UUFYcm1NVXM5MFVwUm43NU5PQ0ZLVlo1VnBEbmZMU2VzbmhNZWd5NmUxdDFh?=
 =?utf-8?B?cHNNdVhSWmNyVXI4Nll6N3lGczVZVzErZFdCaW1VaDJMTHpSYjUvYnZJNk9t?=
 =?utf-8?B?UHdKMkQ3MkJVQnJOYkxXWmlGcXptRDlMSS90MEdpK29SZGRGcy9WRWxKSHBS?=
 =?utf-8?B?RnBFT3dSKzhsSVRVaWt3b1k2MHliRHEwOHJJTTdIT2s5R2FkeGtIb2tiUnkz?=
 =?utf-8?B?UFhSbmNMTVQ1L1B4cE1ZTzJiNWlCQ2RLVm4vVmRuT2tiQWZjYUk2NFRMdVR2?=
 =?utf-8?B?MGRxVVdBMTg2SGZuVm1kc3RONzNHNDFCUzFPM0lxa3ZiK2gwYlZRK3NQc0p6?=
 =?utf-8?B?aVRXZkptM3JiUEY1ZWVJSksvTC9qeVh2aE1Fa3pySjR5Mk5qMWNPUFlWVkxR?=
 =?utf-8?B?amdIbFdBaExUdlkwRGJDckVrS0JQaDV6cE5xT1E1M0xTSXRhSUFmN0ZrNjBC?=
 =?utf-8?B?d05EeGVHVW9PSlRrQXI3cWRSRnJaVVRVWTJ1emRza0pzaWZtZDZreWFZSFEz?=
 =?utf-8?B?azN5bU0yMC9TV2NTaHdRSVlScmIwTHI0UFlodGpCbGh5R1cxS3VaaHA0WXZ0?=
 =?utf-8?B?NzNLWlloVjFpdDFGYVJrN0M4clJHcFRNalR2bnMzYklXbFV0cWhRZHpCT0hq?=
 =?utf-8?B?Tkc2M3ZwanBVRTdmbEY0ZzRZb3dqTUtYOWoxY3MrN3JYVzR6eHpDZXNJbTN5?=
 =?utf-8?B?UkdhYmRWVG5kSUhKUVFtbWJJMDRHQ2RJWlRjTmxEYUNkNHRUNDJTU015TUlO?=
 =?utf-8?B?bHNGa3JYeVprV1EyMGQ0Q1FHbXVmRDFmT3I3N2ZaUFFQeHBCd1lYWlhNN21a?=
 =?utf-8?B?N0dlSGQ4bFV5YlRsQWNWditteDNBQUN6ZlJGOTcvQlR3MzZOcGU2VHFQdjVG?=
 =?utf-8?B?OUZkU2VTNmtxZUJ1SVZEbDRxTUt2bVFJYW9Cc09Sd1p0UG5DMEx0dS9Hck90?=
 =?utf-8?B?VHNCbTdROXRDQ2VJUkpLYnVFVytTL2g3UDAvUVVXaTRRbm90aGxQSkRDay9J?=
 =?utf-8?B?QmNDTUFQN2drRXJ6bHVFQ2g1bHM2WjQrcWtPbGltK1psSFRyRTNsRmRWaWd5?=
 =?utf-8?B?b0U3c2NCRjUyZlpKWWNGeUdHQk53cVBOZURnNjd3bkVzQWY5d0wrSFo3TTVR?=
 =?utf-8?B?bHpkT1dZMktGeFlsci9OUmJBVG0walRtVHlOUnBJbGdmWCtRSldHcFhpM1VQ?=
 =?utf-8?B?eGx6dXlQejB4NVBqTmNaSnk5OVhubnp6all6ZjFIYUR0NEI0cW1RUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a393a5-b1d2-44db-75f1-08da2f65ae10
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:38:18.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dG6UK0bo1gNvTBRj583cGYc6HNBtb1uGZVRQW4zMXbbDv/TNxCLgQyhRszPncPZmyM/QM4B4JS5bHjBPOooD1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3911

While for C files the compiler is supposed to arrange for emitting
respective information, for assembly sources we're responsible ourselves.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -397,6 +397,8 @@ endif
 
 AFLAGS += -D__ASSEMBLY__
 
+$(call cc-option-add,AFLAGS,CC,-Wa$(comma)--noexecstack)
+
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
 
 CFLAGS += $(CFLAGS-y)


