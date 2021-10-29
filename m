Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D25643FC43
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 14:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218528.379012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgQuB-000553-P1; Fri, 29 Oct 2021 12:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218528.379012; Fri, 29 Oct 2021 12:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgQuB-00051u-LV; Fri, 29 Oct 2021 12:22:43 +0000
Received: by outflank-mailman (input) for mailman id 218528;
 Fri, 29 Oct 2021 12:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwSe=PR=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mgQuA-0004yu-Cf
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 12:22:42 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5f34a3b-38b2-11ec-8511-12813bfff9fa;
 Fri, 29 Oct 2021 12:22:36 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19T9vQCR020637; 
 Fri, 29 Oct 2021 12:22:31 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byjkf7y42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 12:22:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19TCFOEC139698;
 Fri, 29 Oct 2021 12:22:30 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by aserp3030.oracle.com with ESMTP id 3bx4gd1hn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 12:22:30 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4189.namprd10.prod.outlook.com (2603:10b6:208:1de::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 12:22:28 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 12:22:28 +0000
Received: from [10.74.111.7] (138.3.200.7) by
 SN7PR04CA0233.namprd04.prod.outlook.com (2603:10b6:806:127::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Fri, 29 Oct 2021 12:22:26 +0000
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
X-Inumbo-ID: e5f34a3b-38b2-11ec-8511-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=rTdmQBOgP+ixEXDhCA/I7hkC9GIUeJRNyJC2+9Pu824=;
 b=SPkBrUpX3QwZdXLlyGBhNu9T+BIv7nBMSFZ1tqgPa8piC6q3G3wM8JufoowzDR1PBHYJ
 mSD5x6apaUj1axcx1RD6rj8QWrsHeGhts6U5HagTHFN7wmzwWjrDAMp4XAtZqfY3uwBx
 SmvIYjODWuOD7Y/BZEWtsxoAwW9SZbYoWGyBBoWyAT5b0Kg4L7thq7dLQB9GizonON17
 tRtMhUdnnMoVSAAu1ExByNRWTev+K7B/hg4X4Ii1XIKNetheX8SvL0yFBiYozk/uIQZN
 gNoOGvipsFFOFB4nangi0rEEkwU5gNGRYi5qWsjCmR0D2UGK6UKcOGFMG5Oj2u10mLMO 0A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCACU/KQ2bZYUSXNhn/oGlSg10g8fs0w/QbQimtjzvpyrQxLIF5z/bvXCp1Ula3KmE6162iW8qon/iuZj8riGtezY5+zvu3edx1P0K3RLhh9b4p3jEWtc2sWtkd+Gp5BDrug//r6G70lignDPbzuitkLRR9swIGWwAWJ7xUUSVL8zVyN8FHXsTYn2+BhACwkLW9AC17LOHCvtVM757pojKpuZ53tzB3MnKPiAn54uI6RJqPwwhOSAQt7wracZHjY6TaRCEcwbKVanqScFD8OfIm9z114587Df6DpnK+wBd7owO+TlZb9vwP0UZI3islv3xMjfBDaXEoajpmfj+kdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTdmQBOgP+ixEXDhCA/I7hkC9GIUeJRNyJC2+9Pu824=;
 b=E3drG/qtGQF6lXILloziGFNWrVmpB1Xy/P0Ft/vgT7ygdd13uJwJD8T+MaIHAVe27N21ptdMbS6zP9eusDEC4slNSVsgivnzHzbQrjuREVFnJJY2+3AWVC6YpGIU4VzFhnznKChrZ1aRDSaR4Jz/MkRjjBnpEBJpV8KuoBzPHPhtgSNchsxBTotuF0++J5TpAuHcH43Cq6vZxKyc1Ss6B3I0PXMj6V2XGLPX8/Bbdc7aE9n/ZOVNe2yYoZr1dFGsF4H4RziMbBjVttIU7CBcX9UY4LQZeB4Bt4XRCsryzLgAdCxq5d68x5wMCPX57i8pkzjNWFuaYMHXhQ70kcNTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTdmQBOgP+ixEXDhCA/I7hkC9GIUeJRNyJC2+9Pu824=;
 b=jKCAMvCJVZ3GpiXyhkVawHLp6rNMFWDoPq01mBZktqJIqPf1hn3rbEx0xsfJE4FQKHGwPhp6/XcyHqfn736vtVJyfsAtTMgWcezlQOS/Ecr1PqZp/K8erWZ1axkA7zRGA4v96NG/lA8z/GbMPhikaf7aDxl2dJLW8cUHb3Pi30U=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <a76b424f-79b4-3132-d487-b48da2f5e28e@oracle.com>
Date: Fri, 29 Oct 2021 08:22:22 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [RESEND PATCH v6] xen-pciback: allow compiling on other archs
 than x86
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, julien@xen.org, sstabellini@kernel.org, jbeulich@suse.com,
        Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>,
        Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
References: <20211028143620.144936-1-andr2000@gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211028143620.144936-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0233.namprd04.prod.outlook.com
 (2603:10b6:806:127::28) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80ba7d79-51f1-4e21-c00d-08d99ad6c5ce
X-MS-TrafficTypeDiagnostic: MN2PR10MB4189:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB418985B696DF0CB355A73D858A879@MN2PR10MB4189.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DprBO+gqd9iPGgqkXS9XTveNSUOEsoi7FNvL0AKSdmOKSf8nH+dMXCooAYG6JVRzLzUcbCNL9aemW3q+iptoHuOAa764TKfVQFCaD25tghiHGo4hLBH60Prcmy9F6VAY2rNHRozjUCyxuspJL3D+RzT4xnvfyItsFRsSQWuQaXeY7uzVtKY9gUaMnEtbc1szT6f9oYwlnclceq4c1mbhZxuOuxFw2uXW/b0a6C4gFnhpbK/MNvNQ0+wNUmrCHozoDeexksSvOGCEmxBQ63s8ojKawXtee3WpVcE3lIXdGYAhmrhfLBGePmrkHdyQ4+6B3Qo7wSGTX378MDdstJY/4dhDjLLjz0fgZ0Kr4yhzUy5iPor3tpvmzT/570T3gzAvDjBW8ZqLxJofUFMoQXYz7sh4HvJVH4aoFZJa/XXYv+TiEruOh+EJRV8PPnQ0APrapSTsMoJjlHCQFE5gX86gK5QdWx7o16WbT3gb06pmaCZTRQZSXunZYFdy2R0fj36Fh3Criz6WV98J9EKVH7AYyIAeOFvVn8Q6th8C7m7311Ofw8kx1z+RcYo8d+PpJslhmDXPTiaCPkPXVqlfA0tmjBa6jIP3Vo2aA0pILgSF5AexbSMiT86K5d+UoyolJ2SGMCUFyBR02wod+hkv4JuQz2eMQ2LCVV/KKwnAwMXz+LDmJW9PyeQ4Nv7mW1DmXIKILCAjEMrEPEywPL2jSZsbXNdaqDODkNzNU4x7eur1aU4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66556008)(66476007)(2616005)(956004)(83380400001)(26005)(16576012)(31696002)(5660300002)(44832011)(4326008)(36756003)(8676002)(186003)(508600001)(31686004)(6666004)(53546011)(316002)(54906003)(86362001)(8936002)(2906002)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1RvZlFPd04xMHlabSs2WnBBR3crcVNWTG4wZDl3OEJ2VnNjYllYckNmQVZH?=
 =?utf-8?B?QTIzNTM0dzF5SjlXRjI5Mjl2VVpyaUd4OHpsb2wwSEhGeXprSFd4ZGVYTlEr?=
 =?utf-8?B?R285bGJLQklPTjVWOVdhZ0Zrb1Jaa1dYbnFJODBxUHVxRjN4N1EyUlpBSmZ4?=
 =?utf-8?B?Z0lnVnJ3VkFVQlEyL3E0cnQwd0RWK0hsT3RTN3Jsd0g1NitVd3QvZ2IzcE0r?=
 =?utf-8?B?YmdXSzh2OFBuemtpdXo4MTZKSmdHdjJ2YUVlbUtiRlVWZGVtaDkra0dJYlh6?=
 =?utf-8?B?bUdlLzVOd01jUVhIWXpTcmtSSTVjbWw2UUlWbEN5YklQRDFwcHFVMnFGdWpM?=
 =?utf-8?B?TE1FcEp2eWZmb3pGOWg3c0J1bnU3RE5UOXhVT2dvQklZRmZzb1NDeFlYTVFV?=
 =?utf-8?B?b1Znek5XZmY1RnpBb3QzODI4WjVMZWo5aG5xSGpid1B3YkxSYmc3T3NRQWdV?=
 =?utf-8?B?RGhZOE1Bd0JYUUM4ZFRtVWxNb0ZjL3QzTzRkN0FQRkt2OXJpY0RNWjA5QWN0?=
 =?utf-8?B?cHpaQVBsOTZsdC9rNmtJTE5KMDhVRkRobVlNM2N1UE02L2dkTSt3QXo4aUE2?=
 =?utf-8?B?d1IwM1FEbDdwRTFybDFBcWthK3BuRmdJVk5XVXdvNHJpSGxjK1VDaUxIVWJm?=
 =?utf-8?B?Nmo1ZEtMTzN0Tk1Ob3FZNktnRTRPSGVGMmRLRk9TTGtKcytCR255ZmVsRUIx?=
 =?utf-8?B?MmM3cTY5YjBjZjFJWm9udzVoVzd5QWlmNDJmN2JMNHRkYTBadVFKS1c3Zldl?=
 =?utf-8?B?dUZwUWFCOFFlc1dmNk9PRTZvNXZyM2ovWUs5OVJRSzBuWndtTUlsajQySWFO?=
 =?utf-8?B?TlQ1S3B6eERhWVBQOWZzMlFVWFF4aUVHY2ZCQVp5dGtxVFJCNG91OEZmTjNW?=
 =?utf-8?B?ZlR6WEdicUhaazFkVERqUTN4eHd1U1VEdFVqMkdxVWV4QnlvbExsN2d1Qzlq?=
 =?utf-8?B?Uzd1YUNTeGVaeDVITEF6Lzl0aThJbG5JZ202UlEra1pYd3Y5VGJjZTJjSzRt?=
 =?utf-8?B?K05lQ2pEU1dXWFhIZGN2YUV4U1UwUTI5NTRkYnlZV3lUdzJaNjhza1NBSmRR?=
 =?utf-8?B?NDFicHdSdkpzQUlQMS9Cc25sZU5ZZ0hMNVZFMVJtUWpiWkNITnlveGdhQ3ds?=
 =?utf-8?B?R2EwUCsrMzVGeFFocmxjN0JVczVIK2IzaElTTiswVUFzYTJJRExUNFd4S0wx?=
 =?utf-8?B?Qng2b2c5Vmk1bHAzN0pkRU9KcVdhOXdUK2JwUFNMczJCQ3JhaUJyNnlUTGVJ?=
 =?utf-8?B?eXpOZVpMeEFFMyttNHlUSzFyN1NFNjRZNnJLWHRDbWNnY2t0TUZRNXVmVWxZ?=
 =?utf-8?B?eUlJU1ZrOW1qUDVNcWJQUnhNQjFySm0vSkVZSVU5VXhEeVJjOGY2Tit5NU4z?=
 =?utf-8?B?L1BhSWI4eFJxaVhwRUhNQVc0eDBCV08rVkJObEdiczNIMTZMV0JBMytpYmY4?=
 =?utf-8?B?d1pBT0wvaXcxY0tSV1NCM2E3UmdPdWdJUEFNR0kxKzAyK3dvTHYyVDZIMkda?=
 =?utf-8?B?TkFjVWZ0QXhzTGdNOUN1UFpSaUF5cGRiOVFxUURleWNNYVc3cmRTVkFVc1JT?=
 =?utf-8?B?bFNLemkwb1YxUkV4Y1E5TTlHRUd0MXQ3N1VSUHpmblJsUUVPVEZiTitzcjJ3?=
 =?utf-8?B?NGZiRDZLbHoyRlZLU3hTekFFZW9ydjY0MDJQTU41ZDFPQS9tRlZDUDVMVkx4?=
 =?utf-8?B?U1lEUVRkak1vdUZHTHVvYjdsbnpMTkhPQXdqT1BwZmVkWTJCbUdCQm9ibFNx?=
 =?utf-8?B?a2tITDRQUWs0Q0gzN0JFM040emdaNEVGRVBNTmRFZjkyak9yYzdySEV6aFJ5?=
 =?utf-8?B?UHpHT1ZMMVYwcEx0RjFkQlh4RjBtc05wSkE0dWVJeGw1d3U3U0wvVHhDZWdT?=
 =?utf-8?B?WWFFNGUwNGVJNDNjWVVlSkV0TUdTeGlBUkFoMjB3S1NmbVJmUnpEZktIN1h5?=
 =?utf-8?B?NWxuQTFISk5MUDRuQUorOWtYMzBmckJtcnUrWmIxNVplVlcvMitRaHNhYUJN?=
 =?utf-8?B?QjNOa1p3T3pnSGF4ZVpTcHlHYm16U09DaXpjcW5QUzBWUm1Jb0lSUEtnM1FQ?=
 =?utf-8?B?cDhXNjFJdVRCQy8yb2VhQVdDbnRzdWdnbDUxL0FHcTdhMDhuNmQ3K21SK0hx?=
 =?utf-8?B?RUxaWFdPcXFmaUs2V3BRUkk4aDhVYzljcUMwbVIyZXh5b1ZZeFlrTXAzVk9y?=
 =?utf-8?B?T3dzM0s0dlkxSTdRRFd3V2pGN1dhbUtWZzZ5UE16ZW9qNDBwV3VMY05qNVo2?=
 =?utf-8?B?cHphMUtDWUQ0eWYyVVNQRzRhSmdnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ba7d79-51f1-4e21-c00d-08d99ad6c5ce
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 12:22:28.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFmT3ept0fsVoA1epB4/Jp+TFyeff10xwWAmIsvpQErO1b94z5m8IE9X8meF9Tbkp338/usbfGHPcaXsFE75wBhDkexxKcqxqLfcJB1j0Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4189
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110290073
X-Proofpoint-ORIG-GUID: mO1rUEjYwhGmBzZcU4HINaNjYRAveYCP
X-Proofpoint-GUID: mO1rUEjYwhGmBzZcU4HINaNjYRAveYCP


On 10/28/21 10:36 AM, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> Xen-pciback driver was designed to be built for x86 only. But it
> can also be used by other architectures, e.g. Arm.
>
> Currently PCI backend implements multiple functionalities at a time,
> such as:
> 1. It is used as a database for assignable PCI devices, e.g. xl
>     pci-assignable-{add|remove|list} manipulates that list. So, whenever
>     the toolstack needs to know which PCI devices can be passed through
>     it reads that from the relevant sysfs entries of the pciback.
> 2. It is used to hold the unbound PCI devices list, e.g. when passing
>     through a PCI device it needs to be unbound from the relevant device
>     driver and bound to pciback (strictly speaking it is not required
>     that the device is bound to pciback, but pciback is again used as a
>     database of the passed through PCI devices, so we can re-bind the
>     devices back to their original drivers when guest domain shuts down)
> 3. Device reset for the devices being passed through
> 4. Para-virtualised use-cases support
>
> The para-virtualised part of the driver is not always needed as some
> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
> model for PCI device passthrough.
>
> For such use-cases make the very first step in splitting the
> xen-pciback driver into two parts: Xen PCI stub and PCI PV backend
> drivers.
>
> For that add new configuration options CONFIG_XEN_PCI_STUB and
> CONFIG_XEN_PCIDEV_STUB, so the driver can be limited in its
> functionality, e.g. no support for para-virtualised scenario.
> x86 platform will continue using CONFIG_XEN_PCIDEV_BACKEND for the
> fully featured backend driver.
>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Juergen Gross <jgross@suse.com>



Applied to for-linus-5.16


-boris


