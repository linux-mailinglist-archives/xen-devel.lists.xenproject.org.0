Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9720139D4D7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 08:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137661.255033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8aH-0006aE-Jl; Mon, 07 Jun 2021 06:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137661.255033; Mon, 07 Jun 2021 06:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8aH-0006YN-GS; Mon, 07 Jun 2021 06:18:01 +0000
Received: by outflank-mailman (input) for mailman id 137661;
 Mon, 07 Jun 2021 06:17:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lq8aF-0006YG-EN
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 06:17:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d971cb5-a999-4a62-93ac-4c0a1334cbe0;
 Mon, 07 Jun 2021 06:17:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-Bdexnen8PdCDaMaDAxB7cw-1; Mon, 07 Jun 2021 08:17:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 06:17:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 06:17:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0042.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 06:17:52 +0000
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
X-Inumbo-ID: 3d971cb5-a999-4a62-93ac-4c0a1334cbe0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623046676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9oC9unxu9tlwtPL6j1KQlPbv2ZU1cSjWlXybErNtYs=;
	b=ZVbN1URjl3nW12lwL1CtxC7ZlHME5yCz9ECS6S9F8ljwJjamK8FFws3H5wRWayAph4XY+M
	IJYS78M4vyWxahbVqXhr0RBbSe+8z2xKSTL16OpOEi3ywBbEsDZPJbrkwgCM1UhtYH4P6j
	b1BqmcYZj3MDNTzM1hHpB/hjxEtlSg4=
X-MC-Unique: Bdexnen8PdCDaMaDAxB7cw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdB/YAiaulp9sKuBfj99XUk53pICCTJUQ5/PhBqv5a+vBprbBTHbK2BHwUktjYrD5/60hX9asL+ozLTjDO1f1aeUcffa0wciM2w7G+TUql4Ui2kVVZakPdBgOysY4VZiLSblBIx+9qvXx3qbiNf2Cv0altyUOr6qBJtWc6iLudn+SbYOlIaKTwRqftWdTU61SZ07vFpfU7aK2chHqbrlrfG4DtOPWonLS+vczozCl34NuvA8+f5dLzD6tf50Di0qwarQKasVicam+GqaiIEnAtRWYZ06xTaTdfO2LQMgusLOmQ/0fJNwfauOFUydXdgqtAna6PpeZkbtY61ZiKDFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9oC9unxu9tlwtPL6j1KQlPbv2ZU1cSjWlXybErNtYs=;
 b=gd/AFkjavJtPTPO73GMR9V39BzrvHNy5PPWgqNMwPsNcdLiIupqtwj103JOGiSWoLLZBiqnZ66MzyxWIwp9Hu7ogsaLhBwpVeygmHdXtm64LiRMNoW4ej06oSugVQ9m/jnHaiazOCF0KVOeXyRxGh1hk3fH3Cfs+gOxyMujphNUjgupY6kfiDSlbMrjMxu+0F7Bbwco/SYSpwtnVBEMlHUMmYMcJ+SZYmPlqhrNvsDdwePAzlhpMSriTG7UMyOn2ta/EizpcCbfFY6WIraYUtvPC1nQ1yWY0Xh2bC9OwJf5mlcNSkgylP2X3r86/a/4eaUm2u4OB0TRb29oV7dHsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 3/9] xen/arm: introduce CONFIG_STATIC_ALLOCATION
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-4-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6c2e72d-e53d-db68-6e54-4c3a5f4d50ce@suse.com>
Date: Mon, 7 Jun 2021 08:17:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607024318.3988467-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0042.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbca9617-7c90-447d-9ab0-08d9297bfb58
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6382C88C1660B4E8AE5A8D22B3389@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ul1/TKGygi5FsLEAlgyVhxVrJu5p0aInVK6KGw2s9Vtrac26hNXl3E4zvoxiN2IpYOj/4la0iG/O6PqqVEYW5FgcgBtCla4kB45b44s/M8nzgi8WjIFXF+NMo67UwiAEE+MTOmEDSa1rUX+ODghaD1C65rdhPq/KZetzMtC/R2QvjijKSJsuxmw98aFc/BaEmqfr7iDRT8P/5c43fiBxInbsHNHWV+EPXuKAqyqGkFH5f6hTGtjHo+nwKURPfZpUwFsUqJqO9ijeSXTFM4upG2/rR8cRK13r0IYyYz8IYtWQJk3DFhPznyHK6E+FEFIoBLVfwz6+J8HgvDBSSc+W7zsxZjmxVZDMNfitH165RoDowJxrOjWaBmJ4X+FLifey1DOsXwTjkktV1gWAlZNC7CXqWnm/CZweu5nERnnoE9l12t8sakn/hgU3aZIjTO2j+q+lLU9ZgQU5hEI+tEeZUL1MNxZDjq9qD3AqvOl4T2DRafyU295FPyOLZG9qdLjIrcMflW5jYtlzGAYQrFKfr/HBbKaa9iSmoIMTkKjpcdNq3PQffCHpXbsVsyvqKtQ6zqCRK+2Q6pdt0AxhGa6gV3YdDvwitVzCp3dea8a4iXq2atGIQccYe4LDibMX+ad+GZKu7SINK9k6ZixgDoFLGURJuQ/zMfliV4k6R62EOWPHbEnsTtdrg3O9CJAqaqMt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(346002)(376002)(396003)(136003)(366004)(8676002)(2616005)(66556008)(956004)(4744005)(66476007)(86362001)(8936002)(4326008)(6486002)(316002)(31696002)(36756003)(2906002)(26005)(31686004)(66946007)(16576012)(5660300002)(6916009)(478600001)(38100700002)(186003)(16526019)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?U1dBRmdyc2tNRE13em9qd2ZiVG53dTM2SndLODJGeWZ3YmNYSkE2MVpNYWNx?=
 =?utf-8?B?RC9DdUE0R0dOTG1mYXZvVGZTUnNsWGZPVTB4TS9yZ3ptM295bUtIRlBYdVFW?=
 =?utf-8?B?VUp5RXdnUDJ1N3hCWEpnem90N0ZKVjJNalU5dVl5djA2MWE1dGEyL0lrRzdF?=
 =?utf-8?B?eklvaWp5YnJJUmlDTzkxMVU5T1JLdFNjVGZVTzRCV2FYSmVFaU5Ic1owYlVr?=
 =?utf-8?B?M3VqL2VMWi9EU3d0eGhDaFlrWTZKd1BNNHJJYytRTklWQVBnd2xFd0grSGdh?=
 =?utf-8?B?M2lhVjdsbmtvWmx3ZUh0ZVFJc0ljVXdGejNpb09oYnQwb2lrdmVXZDFRTDhG?=
 =?utf-8?B?YVBRSzNpL1JZMit0RENxMHRLU0Vick01WWFSUVRKQUpsVDdUTTdTZlBnTlRv?=
 =?utf-8?B?OEJ3ZW5XZE1VakZIWURjelhJUWFKNGxSRnFUOHlOOVpubk42Njl5aHRJMzBF?=
 =?utf-8?B?emlzV1RJbGJMeXZHSWpKNFJ0TTBYbnBnSS9PdGRnMWVWUFBYaEdpcXhVSEdx?=
 =?utf-8?B?TUl3dmNvZU42TU5KSi91KzB1SExrY0tNKzhOdmxHUWoxL3VpLzVsWXJZTVhJ?=
 =?utf-8?B?ZHNjR21xNjBTRSs5SHNKY1lOdnZWUDcyODVUZC9mNnZwR1ZtdlBNNmZicGg4?=
 =?utf-8?B?dm9YR0x5eFNUeDY5TDFyUG90bXJZSnhnU1B4b2l5aTdFSno4WWNHK0Y4Q2lO?=
 =?utf-8?B?UTJ4aWg0T3REdXhyN2FYdjQwa2U4c0grUHhLd1gzblVNMUFEanc2UFhlQjQr?=
 =?utf-8?B?eVprNDNYWHBkOHNtakVMTjVjRHljeXc1T3ZURXNLVkVSNUk5UG4wWTdFRFIw?=
 =?utf-8?B?dUcrMmY2VEtOMmhFTEpXcXlFUXJxMDRuM1ZENUphcHhMd29BNHkwQnU1M0Mw?=
 =?utf-8?B?K0IxS1hUMG1hQUxIbmYwMDRGL1lwVER3TGdvaTFzaG82N0hQNGdZZjJmUGhI?=
 =?utf-8?B?MmNTWDlIYVFYejI4bEd5TldsalpSajRCbGRnR1l0c3p6RlRjT1lJamN4eE5s?=
 =?utf-8?B?Z3NNTzlCcjEzZk1ycnMrS0QxTDB5b0xidGZsNHlDcFU2cmE3bnFHNnNWM2Zh?=
 =?utf-8?B?MStLNlUveFF5Mlo2b01KRHN4WFJleVB2Mi9wWFZFaXF4VnhPZGo2Z1VxSCtD?=
 =?utf-8?B?eENEczZBN2IwdTJnTU1uYkxjSnlsS0d1bnJnNnFBMzhZMGcxRU1jQSt3MUFa?=
 =?utf-8?B?N0wrem9Pajk5M3VkNHpkWVhmWkZlL0tNcS9SSXFGSm02YjZnczM2YnpEWEU0?=
 =?utf-8?B?QUxkZTBRd0tsVUgvYVhNYXBSUTNYWW45dmNMSlJoK3hkdFZhYTdlYnZwZXky?=
 =?utf-8?B?YWtaODhqTVgvV2pIVGRITXhuTlNNOTZlN0djVkxKNE9nL2RlMFZEc0ErKy9i?=
 =?utf-8?B?U1RYR1JJQndLUGNjTUloV2tCR2ZiWUhjMVE5bjN6djFFa0hkb2VMOXpRRnBX?=
 =?utf-8?B?bkkvVzdDRUlBaXoyYytvODQxSUFLVnZEN1FjV2NzMDQ3VGJrYmRmNzVDYWt6?=
 =?utf-8?B?ZDA2SUVNTEhWSjA3cHpJOU5wMFEzUnhCd0o0WnFnbjhLU0JaN1BYdEp3c3dL?=
 =?utf-8?B?cW9EdEFCdWlOUXE0VTZXOXdmSjZLYUl4UVl6OURHWHJkTFR5VHJBRzYyZmdE?=
 =?utf-8?B?SkNYdDE4VDBhWXBiakRSNXM3MDkrQXlHMzR0NmxlZE9mVTA0ZVBKejZ0M1li?=
 =?utf-8?B?Q3VjNUFLZ3MxMU9pYkRIZTZQNlFoMzJIMTArcXlEK05MUXBWTFEvNDBmc2tH?=
 =?utf-8?Q?FX+m6N+LLdtRIFE5tN2A6RoknDWO1kkDddOlWph?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbca9617-7c90-447d-9ab0-08d9297bfb58
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 06:17:52.5219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JeEe1mjnoL+MjFrZC22h7cuRRVNkG04bLeF1kBD5qxGk6HZL6OaZRw4mpP8t5fi9/YOqGAJWKqAaK7jlu08Afw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

On 07.06.2021 04:43, Penny Zheng wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -278,6 +278,9 @@ config ARM64_ERRATUM_1286807
>  
>  	  If unsure, say Y.
>  
> +config STATIC_ALLOCATION
> +    def_bool y
> +
>  endmenu
>  
>  config ARM64_HARDEN_BRANCH_PREDICTOR

Nit: While this and the following option exhibit bad indentation,
everything up from here looks to be fine, and that's what you want
to take as reference when adding a new option.

Jan


