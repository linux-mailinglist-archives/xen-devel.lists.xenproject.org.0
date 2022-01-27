Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAEC49E7C7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261641.453196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7px-0000Ll-N5; Thu, 27 Jan 2022 16:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261641.453196; Thu, 27 Jan 2022 16:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7px-0000Hu-Hy; Thu, 27 Jan 2022 16:41:29 +0000
Received: by outflank-mailman (input) for mailman id 261641;
 Thu, 27 Jan 2022 16:41:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD7pv-0000Hk-Pv
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:41:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f85e3856-7f8f-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 17:41:26 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-7MSTp4kONlecwBSPECqG2A-1; Thu, 27 Jan 2022 17:41:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4948.eurprd04.prod.outlook.com (2603:10a6:208:ca::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 16:41:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 16:41:24 +0000
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
X-Inumbo-ID: f85e3856-7f8f-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643301686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsjF8qmMNZ/GeMPWvbN2KvZGnmEETIHhn2jyTfZw4f8=;
	b=KUAD9RsenhWCwKncJFAEDrSWrO6Szvgod+y3xaneVTB8hGcjtwycn8F9Wa3h9gA3JEm+tV
	13+bkrPPU/3OVidmNgt5dSYECZ8AIduyAZmWAGcN3+/2p9HpRMLrck9OrMPsRRvmRhZz0W
	i6uAefHuPDW/dgx5sxE9Ih7tPZeaxw4=
X-MC-Unique: 7MSTp4kONlecwBSPECqG2A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOwjxsh7Ncs0B3f2ltjWK55FHzoFRdmWSDd7+iCiHKArYF4q6DsNdUgxB2yAXb5awEvfb1lHBoVUJnarM4O3GI9wzGtMZK1CikLufHf9H8AgB+7YJqcOzrC+grtChL0qm03Kymr7/jWRFh1hafxxjlB5IpdTTjD5ywm7TsnvoNML3BOM0JTNN975iuZsat15YQZrngSglNruGx2uakGqoar4Z7rHngeAPDQX6PR8KE4i01udpAx3YXjp2bAuNZIQ2lVWMzlFLm/XKjzYdn3OFqj8Mt99MYBG0wxsHJ69csbe4sIZpy9pMsfZsp0c2qfl4c9VMcaHvmS6wCdH8gqW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsjF8qmMNZ/GeMPWvbN2KvZGnmEETIHhn2jyTfZw4f8=;
 b=k7FeV00spQWTTvz9To3IVLBbFSrPSZCkzKZ1yhIH1OX5FG1gawnoSGmtlzUGp/BQbrByJFuqwICqJGek20WILXyd5UuJS8p0jtwYA/Z95EDXyiG6+xiocwluUdAS2GWKLTaFC25bTpWRPZYHIEADok1M33FMfmOL66PuWW78SwSeCi7KbEDiHamV7uOvDT1WXuweqcN4zBQ6gE7IV0i6MTWAGmuHQHaDPNeoqN/xg1Y1MV/XtRXDKjkSmT6MCnv9Ljrl8Pzz+4CNF/pFJyNhGzucqE+B6FQiS9H/DkJBTYqRgRIFbAdM6TE7x7BrYPZB2h6ArFOl3zO8IKEp6CdhXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d2405bc8-64be-206d-7d79-b06e2fdb6ae9@suse.com>
Date: Thu, 27 Jan 2022 17:41:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] x86/cpuid: Infrastructure for leaf 0x00000007:1.ebx
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220127160940.19469-1-andrew.cooper3@citrix.com>
 <20220127160940.19469-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220127160940.19469-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0066.eurprd07.prod.outlook.com
 (2603:10a6:203:2::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fd86f19-4b56-451d-19a1-08d9e1b3db20
X-MS-TrafficTypeDiagnostic: AM0PR04MB4948:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB49486F9A4FABACDDBB2B782FB3219@AM0PR04MB4948.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FNnnmARnULqDNoFBFyUkYHeQhwiOd5EC9U+DlkSXkldOXYIC5NETAI8y08LlHOq6fHvVTgzdQnHbvjtFe4UVb+Hl/Xuq2iq8zCztweQ96btwBl5vLVEVOtcWb+YOwg5hOsLr2Du6f7Q3WTpYX99t0JLmqXn3/NbkHjEDsLRCUkE5UgXu7sWrckXabsP0mMfx1LTjmHOTJIvX19u9kb3eOUwWW6dqL66ztnDl7EQkWSJGNF4Usq+2P73Lio1Zu0Zs6l0iKV/bzFPGaJ1Oo2ytA2kLqIs7YAAQ4+p8WiEDhq/Qv06DlCR48I/QSmim/4LMPfcOfjGXJk9Xb73NW9Vq1xvUWLOT9eL9tcuAH3PJdLRfIiZPzsQGH76CRjIXtEv1dqGZkRxaJ8UDXL4Tm4pTC+Uu2u+2g5gBvUW1M5CrUobRGw134NGKQhXWQt5VVlrGMtnfTnmEeswWokrRY8OgNv5lO5mfQybZpVyOQLLcl8O1Pyv8/4T4JpGCfSMyh0wkETHKO7Shs5/BGk5EYRd9c6rDXUXkEhWiF0g8ePXdxYZV/pEbKG7gnX4w3yVLtWTxzPZ6sBTSOT6kviimCNxK4uZoe0v/zQqgEahzpW+mxivuk43ZxN10epqG0w3I963+d7UjIBHlpCEjSDUD7RICxAT3vOOHnZrGEfA3UbBnQjYn4oNIaaxwJolINBwOInrb2oAqq3nxrh10q9hmC5hX7XVjrHIX3o/iizqccLr28HMN5aYWg956kndW6Q3f+pfs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(4744005)(66556008)(66476007)(8676002)(36756003)(8936002)(54906003)(5660300002)(2906002)(4326008)(38100700002)(316002)(6916009)(31686004)(2616005)(6512007)(6506007)(186003)(508600001)(26005)(53546011)(6486002)(31696002)(86362001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE80b05RaXlQazJLVEhJb3FwNlB3UldhajBLNTFCaGhpZmt0eHdvbmJ2eDBL?=
 =?utf-8?B?Ym4xMndDeEM4TGhWRjhNV2RWdGFvc21FOFJ6ZzFRQS8yeVZHd1hGZXNvYVJ1?=
 =?utf-8?B?cXFPVDZ4azhtNkIzNXhmYW8rMUZGaWVoOGNHYjFOVjgzT0EyYkFRaWtZSktG?=
 =?utf-8?B?NWNsRDNDWnkyM1F4R0RRQmJjN1R3aGJzWUIveGVSNk1JUWl1RDRwbzRnSjdi?=
 =?utf-8?B?Z3dRZ0JuNUlyOHQvWUJYSk5rMGRnYzlwVS9xcmU1clMrQ1R2OTFrUEcwdDhG?=
 =?utf-8?B?bHBtUE8ycHJEQ0VXTU9IQW5rRThSSUs1WW9RTUR2TmVacDJSWkJVajVFRCt5?=
 =?utf-8?B?dUZNamVkL3UrU0N6MXA5TEZRYytnbFlLNDVFcDNXU2I3QTQwQ1daZ05EQXhs?=
 =?utf-8?B?KzNGL3FZbW84aU5PNWdPRFdxRWxWV3lwOFRtc29mTVRQa0RMVTI4ZjkrZDZL?=
 =?utf-8?B?bWJ5OHQ4T0lpbksrOURCME92bGUyT0hRUW1WRlBjRVFiOTg3OEFEbDdyVHdY?=
 =?utf-8?B?QXNBYUQ0L2loemtTajhyQjlYWFAzdGx3TG1NZk1LY2lhZGhDa00wRThBaGRC?=
 =?utf-8?B?Z1pPbTExNThRSHBzUWZyTkU5UDVUcEpDN2dIRUIrNU1iWEt5cGpMdEZCV296?=
 =?utf-8?B?NnE0eGdHZ1NlZVhJY1dVN0RUTzBxcW5UbWIyVndHejEyd2ZXdjlEdEtPUTk2?=
 =?utf-8?B?RFZDNXVSNkg4SUpoajQwa1BsdWQ3TTYyUWkvUUphcHJYcHlDSDc2bk1SNnJD?=
 =?utf-8?B?R25oLzVZKzd3UDdSWXBoc25Xb0VkR0p4ZFU4R0I4cmtOWHU5M3N6RlV0T3A2?=
 =?utf-8?B?dzNiOFRpdWhEOE55cGZOV2k4T2k3L3lhdnkwN3NLNG16S3pEQUV6ZGtqRE1H?=
 =?utf-8?B?ajloeEY3N0ZINjhoWjdKL3BEYTF0c3c0cTh6RS9BMVkxa0hITGJVTHBxVENT?=
 =?utf-8?B?U0J4K3IvOG1zbi85OXdoV2pwdTlDMlVaWDRtOTdsUEkwUStUMHpGLzN6OWdu?=
 =?utf-8?B?c1BxdGJmVmVYRUVpZ0djcVFMeVdVQ1NTYjZ6a0tRT3lyc2tjbVNwQUdCV3ZL?=
 =?utf-8?B?SjFsYkZQK1UxL2J3YjdxYXRTNTE5TVFxL29pRy9TRnpBNXdlMFVWc0lKamlW?=
 =?utf-8?B?dVdaN1FVUGxMbHZiK0toWjN5eFRrRFRuTjlBWjBtVVJXQy92T0diQXJFUGwr?=
 =?utf-8?B?eXdhMWJPQUJoQjFHSGFTeHhCV0hrbUhIWTVqVnBHcUZvVFNOZGFEWlpIL1N4?=
 =?utf-8?B?ZW9hUDIwNTM4Mmd3RXlHUDdaT2QvQ0hDdHk4dkh5ZGp1OUlDQzIvNlpxZmJB?=
 =?utf-8?B?enV3RTk2elFwT0dZY2p6TTFMRnY5a3VabXRLdVlNMWNTaGRCcTNTMTF0Qks1?=
 =?utf-8?B?Y2FNekFGR21iNUtTQWs4VTFjc3oxS0ZreVFmbG5CSUxrNlJHVk1YWmc3YWFi?=
 =?utf-8?B?U1RJZDlqVXRTa0hFRDNaMGpoNXp1VFIrNjN1VkRrSDhkcXFGdmlRMUpTQjda?=
 =?utf-8?B?MzYxSUJBTXpUQkRmVVVZZlkyak1udUgvMnZHK2lWV1dpY2NHMFI3MW9KREFu?=
 =?utf-8?B?T3dXWTlNdmllU2lsNTd2WEthRktoc3RKaVNsbUxsZFZDM1lvZDJobXJ2Q3pN?=
 =?utf-8?B?dXVMeTVyZUtEV3Rzb0ZPaEo2c2NNSEdtMldaOWdYSGlMWlNhUC9VZ04rZmIx?=
 =?utf-8?B?cjhXTW4rQnhHWHh4QW1uaENzcnhhTUx6Q1FrdnJ4RHhGTHdzdjBpRlJpb1Fm?=
 =?utf-8?B?UHJCK0M4MWxrdGQ4cDlFVFl0c0todlFORDlLN1FGdUVCdytYYUdMQU9TK1Vu?=
 =?utf-8?B?RXNLK25UY0Zzd0M5SDVQcUVkZjVGa2huYmtKWXg3aXNoV1FkZUdQK2Z6QzRu?=
 =?utf-8?B?SDhlRGoyVUJlTjBDd2xmcEJSM1lCSWxkVWs5SDJGRk9jT05XY1doQlVsZVhW?=
 =?utf-8?B?RHZBREh5eTV4ODJjSFJhc2FzRHViVDhJdmd1RkYzRjUrYjFMWmNTTnk1VTRI?=
 =?utf-8?B?RHJuL2xVTXB4NjZldXA5aGFLYUtlRUYrZDRZVE9iTk1NUmFldi9FekJ5ZUpR?=
 =?utf-8?B?Z3IwYlJoZmlpOSt0QlBLVlljRjZJSldMMlpsMzVIbC8xU0lzMU5VS3BlbDRp?=
 =?utf-8?B?d1pNZ0l3blhaR0hRSVRJSmZHWUwzOVdIV3krRUMxVFlLQlVYTlQ3Rm9GTElt?=
 =?utf-8?Q?WmXuZb9hLTU7/UGtSxYRhtk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd86f19-4b56-451d-19a1-08d9e1b3db20
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 16:41:24.3220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKyVp/2J7e1fCyyWJKTIyNhY+uFvm28losNPAv35KG2CgXnfT4K5fpnn7+HuH7hJxjn8TDcblOEAouWYmNDocg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4948

On 27.01.2022 17:09, Andrew Cooper wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Considering what patch 1 does to the code, would you mind dropping
the 0x0000000 number prefix from the subject?

Jan


