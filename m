Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F3581474
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 15:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375327.607642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGKvf-0000ZP-SA; Tue, 26 Jul 2022 13:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375327.607642; Tue, 26 Jul 2022 13:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGKvf-0000XQ-PG; Tue, 26 Jul 2022 13:48:55 +0000
Received: by outflank-mailman (input) for mailman id 375327;
 Tue, 26 Jul 2022 13:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGKve-0008S7-ES
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 13:48:54 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00072.outbound.protection.outlook.com [40.107.0.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af651224-0ce9-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 15:48:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 13:48:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 13:48:51 +0000
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
X-Inumbo-ID: af651224-0ce9-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGHVNSz/z+p6MLmyfbpjOC6zbM0yk8RXe+rtMtJ3PyjpXMScXYKbXU7F6coyJJSieifBJlvhmz24Df921iKEtWNKeZzhOgCStoFrOzMwyXY1Vm9I/zTLWqTh8uqLG3owQglZE08f0d62oMIbrbuJ/JGFO9c3BvXs/98TZ7pACaClcbO/3wu3rrZs38JGKAaDW5jHRuBHEzBMX6VxfFUX1/z1t7zyAP7GKT9zlVgnP+6GnMRkDWfLbMrpO3KczF8t9k2y/8IrHhTb0lrNa/CvSmON1v2l5EvLHmOeWt0W1PLHFgqrdVtKSz/50QEn81/ikLsNFhynP4WIufclrDlktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK5J5IzrYvn7bVXSB1rdr68VYrfB8cOrDPtRDJ56ziY=;
 b=JDAHLQWcrtjYsysl6+6RZSqi/vkYc1d4QAGLh1vNjguUKUgopFcfdnjO2zzAWM+v4NMB+4VPjqyQAwy8ASzWQv+dpgIzf66dT6VDiusSq83CwUyLvSZbvoIlh0iY8VqY+1nxNslje+stX4nnmld8P6WN7SZllOhTjMBo2Y5Ji2zlEJslA/vxnpqEk30RtviMwgxthEEObaYOTQNYamiqI2UB43MrHp8S9HjPoQM5pzX7zh2GO8IN98shxpdXiEjyOy2e7U3xmcVdL5Y7ZEX7xCRMyqRGT2t4IXsytcjPvmJQJpXfLzQ5PAKSwMiX415KiOGpv0G1WJItBaOLCkI/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK5J5IzrYvn7bVXSB1rdr68VYrfB8cOrDPtRDJ56ziY=;
 b=jjVqGHrjFcO2vOqI7PXYee0xKOesJUVKNhYCbd6HhqytHhgC8lLggMewZU9DrqIomQkVPb6CwyUWsIJtdXReGfEBjpfMk/KZaNwwwEh4vj+UFP3nWLNbFPUax1+YmCXHjcXh0F8jXgPhrrP0NTPMC5UR//rssqAnNBINY1Hif8FKbd5QZUWZCTcx9brAEAAWU1z6Dw5YadqOMa8KX3JO16rYhyJmEKubARYziGcRkNi6q39kl1EWhKk8C6MyYcQv3BX4z3aEBfSberrCwwWC3bvFDErHmTvyh8n3qIbAPYY2H8AXd8XKDDfxhItOe705cEA/jo8D/GrgG2GpviIFDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9ea4b5a-cc54-1256-5351-c4dac2a6c495@suse.com>
Date: Tue, 26 Jul 2022 15:48:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/vpmu: Fix build following vmfork addition
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220726131357.13722-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220726131357.13722-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20766e12-f758-4824-b173-08da6f0d92a0
X-MS-TrafficTypeDiagnostic: DU2PR04MB8709:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W8tEb926Y+MERDcHqRywQTMfwi12962s4wNAGPkB3+QkVgdGvj+UfHW4WtJxeArvQQqkvJnCybkBr8324xu2Jbvf5ECs3UKLV4SmzesjbYSowVviXk8rYnHp64VPyl4hHPCLbg8QLxgV1evhPjUoH5BoFD15SS6aayxUeZVBtM66Y3raI4pL5s/eL0skfh5r8lmn1OVBgYNw7C4tnVI7yRGQx3Qv0Sz7At9SMWx+mrFktuc8UK+j8njc46CuAN45EpP8IrEzMumqt31Jowjkj/FIy1h5Ls9lSZGohgbrZcLTHVbxIiQ2ojPMaRZ7fs1SYqFtFPGnTgvfJYg66Eb1SL+sQcUxAwRIFRqFUOIFRG35bZfV4la4WHGe1DoKPC1CMdkYsVaa0bnA6Tz4BjfuEuriFZtXXNYv8XfHH1sn2Ao/3ZLd6H5ONT0dal5FpKuGNgnMuJxxwKdlfD/LETorJS7gwpoptEU7DvJpYfV8HsjWGkXAErIWlFkR5p1nwHlNIxw+9v6ndmomaYwtLRc+Nvapl5zZSRI0xzrZJYfxBNUDiIpRmN7T8DIgAVRMatU94xIwo4OF1n0VfXVp/GytF1OPcBWk7eQM45dC0yNZ0DOFuRGAVHxL8zl1TDPmC/Z5qNdgtj6VI6663HUwsH4mdAL4YNGdIURgwzsUpkzId9u8ArEan6wLU+prBEjZpdc7J5uYdVOI85kfAwXeUJj1S3MVpK4TKUBm4Ng5X3rWXKZ/10A+5vAjUvpnpbf3qHzgu949E4OFZGgw/dCknFWnua1xKCDVLKf/wiW0DWmcewDR7F13Ab5EP3D7LxOIkgGQCHLTUl/fCuBwF+h/r0LAcQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(346002)(366004)(39860400002)(38100700002)(53546011)(6916009)(4744005)(2616005)(26005)(6512007)(6666004)(6506007)(8936002)(2906002)(36756003)(41300700001)(5660300002)(86362001)(54906003)(6486002)(478600001)(186003)(31696002)(4326008)(66556008)(8676002)(66476007)(66946007)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3gzYVZJOTFOUEdXbzlKS0ZVYkJTMEcrYkxUOWwrNDlIQVpMMzJNeXppNXZE?=
 =?utf-8?B?NFZOTWtmVlQwMHJyeHQ3TDB5Yi9XSFY5UWxadFl0aStLODRHQ2ZBdjhUMFpw?=
 =?utf-8?B?ajRUMGxVbTVYZEJSaURGQTFMM3J3QjlnRDlNcEgwcjUyV0txeDZDVzBNTnBa?=
 =?utf-8?B?dFJ1Q0JRZW00ZGhGUUVUYzVlc0ZlbWE4Q01yZGFzWWVtUmdiOUlkQ2Y0Qmlr?=
 =?utf-8?B?VEpGV2pOOXdVOXFGVUJkSTN1S2Q3eFl5YjF1cWhwWUZNRzd3SFFGOXlDeEdM?=
 =?utf-8?B?cVVGalUrUGcraTJKdmNmS2FWUzVhVHl1VG5GUHBqN1dnRTVXREtaZGs5eUhZ?=
 =?utf-8?B?emd5aUg2SDFGVkk1cGU1Y09WQTY0VU0yNTRvb2NtcThkWXRaZUNmYTc2YTk3?=
 =?utf-8?B?NVA1T1lkUVQ0RHg2V01DK2ZyckxmTVJRVXpOZyswR1BqQVZQeFdPUkhNalFK?=
 =?utf-8?B?ODUvMTJuOXlMb1NFZC90ZTRDMDRvNjNXS1g2aGMreUN3VWhkZVRvSHFTc0ps?=
 =?utf-8?B?eDFZS0FYbmpaT3NsUXoxK1psVVl0RDdrdTBtRnlSWlJqQUMvNGozU3htN3Rw?=
 =?utf-8?B?d3U3elJYcHFNSTZiWTVScnFXK1pVZnh1VnlTdGYzSUV1TkVqTWgyRWplOGJ1?=
 =?utf-8?B?b1BmZ0pSa3pPUWtPclRISVdObFdKUDRiV3huamdNSE1WOHUvR1h2TkF1NTNk?=
 =?utf-8?B?cXJlR1RRVHlLWjNyZEdIa3IwUUh4QnJkQXRFandCYUNTU1gvWmgvdmxwQjc0?=
 =?utf-8?B?d1NWeWp0V1VoK01PM0JLcTcvNEllNURKY0V5TkVMRjA1RkcxODRKMnloNENk?=
 =?utf-8?B?UEVHV2I2MXZtMFBpNUxoRkpLdDVvUDRtT3dLWXBidlRYYmdIZmdWSlRjVlJK?=
 =?utf-8?B?QlMxTjdPNlM4aU1QQmhsREtmamZZQnd4WTJWclJBQ1JnWFhYaFYyOXRFRG0v?=
 =?utf-8?B?bVBXbHQ2VnJRTVVjWmtZeHBhUkJjcFhDTCsxZmxsODk5QUJLRmROSm1MdkUx?=
 =?utf-8?B?ZVdwYXlqaTFEM3NKS1psRXRJcEhSTERyRXNBS2xTY2gyOEZvTzBTWG1WcEhj?=
 =?utf-8?B?Y0I3eUJHc1pNMXNHem5oQmZVUEFVcjBUY3k2ZGRQZmdSdmhwUGh2NkROOU1O?=
 =?utf-8?B?QjFnc244M0lzT1pEWUNucjlHOUZteXNYalF2MFBFb3dqV2lEUnR4ZHI4R0JO?=
 =?utf-8?B?NmtreUlRN00vME9EbGY0L2hUMDFtWi9kejI0VW5SWFk5T3ZLUy9VZFltZFRB?=
 =?utf-8?B?cSt6U1VwdGE2aW1hcGx3MUpiUzBZcGVRNGpMVW1LWHBEdzFPSUpnNFJZOXlL?=
 =?utf-8?B?TXVQSlRtK1FEaHo5L2JYb1Byb3Ywd3JqVTNiRmYrSzkyb01GaHdhWVAxeExt?=
 =?utf-8?B?YnErNExhM3QyZWRNc0hCL0VuVXFOKzdScXRkYXFSdkVtNWx5eE91Y3hqaVl2?=
 =?utf-8?B?S2NXdGd0SWVzR3h3Yy9tSWF5Z0gwMUJVNDdJYmZvSmJSVmV0STJVbXVYYko0?=
 =?utf-8?B?V1luTGRkQUlHR2JMZGhoTW5SVUp1MENWVmVSWEEya0dob2ZCVytTYXRwaGRh?=
 =?utf-8?B?WGYxZ1pMTFFuQ1JJdlQvNVhkd1hXdEdPNExLTUJEUHFXeno2ZGwwYWNLTkZj?=
 =?utf-8?B?dDdrZkNiZVNBTGNqNmJFQytGMjNsU3RxcnZELytDS2J1aGVnY3hiUmtEQTVI?=
 =?utf-8?B?V0w2RlpoTHdldEN4cllNbVhLTGdka1lKVzROU2haOWhFK3BEVnZRbDE5RzBx?=
 =?utf-8?B?VU1KRmxZanlWeE0rMTFLRWlhYzhUMnFGcExTL09wSlltYkJPempadTY0cElT?=
 =?utf-8?B?eGdQdzZFbkhoeTRtZnhoRDdMM2U2amQ1QmliT1k2bXVRZlp4cnFNZXZEclFh?=
 =?utf-8?B?RmxDbDNsdnJpVi9rcnY0V0VpMlJzZDI5UWNJVWZJMmhXY25BR3F3bU1nb3lp?=
 =?utf-8?B?eWJaTWdUS2hPRFNCa0xZVkJVUnJoTkNtOVBOdng0eVpqSEw0MlJubEdkUW0r?=
 =?utf-8?B?ZHVEanZIaHpySHNiZXdSWDVDUjg4WExFUTBLY0xCRWpLQ2pDa1oraVpzaVRY?=
 =?utf-8?B?QmhYbENRZStEc1JVaGpoVHhIOWZVS2FrMy9oZWRJOVduUzBsQjk3dUk3UVVY?=
 =?utf-8?Q?zc5WbKo79tq74HMwVom3AFDq2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20766e12-f758-4824-b173-08da6f0d92a0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 13:48:51.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBkyDhCxfxQf1C7a2vPFYjXWYzcdjuyX0XYntpF0+Bk5Zw+5KddYUfGoVAX9pWBmRgfGMcb6qqKYCnlpiFeYSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709

On 26.07.2022 15:13, Andrew Cooper wrote:
> GCC complains:
> 
>   arch/x86/cpu/vpmu.c:351:15: error: conflicting types for 'vpmu_save_force'; have 'void(void *)' with implied 'nocf_check' attribute
>     351 | void cf_check vpmu_save_force(void *arg)
>         |               ^~~~~~~~~~~~~~~
>   In file included from ./arch/x86/include/asm/domain.h:10,
>                    from ./include/xen/domain.h:8,
>                    from ./include/xen/sched.h:11,
>                    from ./include/xen/event.h:12,
>                    from arch/x86/cpu/vpmu.c:23:
>   ./arch/x86/include/asm/vpmu.h:117:6: note: previous declaration of 'vpmu_save_force' with type 'void(void *)'
>     117 | void vpmu_save_force(void *arg);
>         |      ^~~~~~~~~~~~~~~
> 
> Adjust the declaraion.
> 
> Fixes: 755087eb9b10 ("xen/mem_sharing: support forks with active vPMU state")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Maybe worth mentioning that is is a non-default gcc?

Jan

