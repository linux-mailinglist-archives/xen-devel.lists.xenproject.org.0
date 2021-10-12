Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24942A8C9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207491.363348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maK3A-0007OS-Ek; Tue, 12 Oct 2021 15:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207491.363348; Tue, 12 Oct 2021 15:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maK3A-0007MN-BX; Tue, 12 Oct 2021 15:50:44 +0000
Received: by outflank-mailman (input) for mailman id 207491;
 Tue, 12 Oct 2021 15:50:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kpIn=PA=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1maK38-0007MG-UJ
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:50:42 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 668a8207-cbc8-4cc6-ba18-9c0c1cdb6828;
 Tue, 12 Oct 2021 15:50:40 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CFdSos007580; 
 Tue, 12 Oct 2021 15:50:26 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmpwn94ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 15:50:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CFijcJ179977;
 Tue, 12 Oct 2021 15:50:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by aserp3020.oracle.com with ESMTP id 3bmady7hmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 15:50:23 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB5802.namprd10.prod.outlook.com (2603:10b6:a03:426::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 15:50:21 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 15:50:21 +0000
Received: from [IPv6:2606:b400:400:7446:8000::222] (2606:b400:8301:1010::16aa)
 by SN7P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 12 Oct 2021 15:50:19 +0000
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
X-Inumbo-ID: 668a8207-cbc8-4cc6-ba18-9c0c1cdb6828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GqoEQgM92S5KZfr+Vi0Py8JU3W6d7rK+lHKptgGwVbc=;
 b=HQMSM6Zq7F/LFDpA6lLflWEBZgXoVdehF8gXW9MKggRdH/mUWlcQCDJkmPCyzSqxutJL
 2hnhT5zvsV900pHZMYkibDC+P7ks/yq+GL3XYYvGvDcRKKfF/gB7B4NWAbXZvFh8uJvL
 FG8lDA1A9Ho0XIVrMlMDJiIHhzlaR9oGcgYpyoFJ47kz0m+VesnlbxrVYDB9ave/Gg3f
 0ZH7+dIMD3hOQVyg70ApUTenpCMKIm9qlABp+uEStAlSPIezfTJLIuF+evgROjr1ENnL
 x7kvrOC2Hc+gtECdCONz9F+yXgx/M4iNUTWMxxMkQs0l54VSnZIQ+zPJy/bIYkCrHHur 5A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GG/e2R1kjq5G1IlTWetIgvSP2aY51Cf/gFXF1CcnruCYDMubGjmFjIY02jS/+xxIN+9cGXf8R2JYhAkbQEuKxbcbIe5PkjRU6W4Awa6QOAUZ67/8rRE7o506JrNNGJ0JXwr9tFfjUh3cUvZ/C/ct6G8/sNmxsZwRC07RArPA1x9C3XA3reJcJswB/vZeJ5xl8e8bPLnJd+q9eP+RyvkoLzWgrIWwqRpOMNc+wuQPzSE+KrMyHwMZiZXi1oKZ0HKtcFfOHNp/1xJ6S8Md1GXeAdUZlebUpaSs8NqxV5gWDXjfWSaJiDyK6SDeuwpqB3FlMihyNt2bPln+hjy7uJCjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqoEQgM92S5KZfr+Vi0Py8JU3W6d7rK+lHKptgGwVbc=;
 b=VSj4QcrNdwCHMPW1nSShZnSWBHqqlCESg5a3T2atRqXb4We2RmXMqwQN2VdmX4h/qnvfNaNGn6zqrMSgZealixV2OdSHrrFkbnGnrAFXY/pGjgcuw2hGJw8Skrngfwl63wUUQ4Gq55APtNjv66rrdFNEiYmv3wZF5aw7xG/4Dqq/FJGjlKUFNFXZTB7Zq9zEgPhX9a8exPY5eEjJLHmqR7ZNv3A9dzmb5HZOgEPf77gBOc503A4893+ECoKq9689ykb2jJT9daFscSixDaXXHtkqAd8HUBGnpe8OyPdC0/4cwHNvw1jBCWeO1eZfccWNL3tFZbk8ee8pVD3IMftXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqoEQgM92S5KZfr+Vi0Py8JU3W6d7rK+lHKptgGwVbc=;
 b=yqkktoAi7kwvnN/GQUJ2zd04z8faUUDLvPubsAm3x19pEXe9681JxfpMZhuWU1rBOz8KG1iqJB3s6lban/J/FFMOYUrRSVtFMcyNZgK0JtKSGBP32wlK8zR3+OaSZx04PL5SqIC12xirEZXS2zpK00nkpMRjkrSSuEqzi8u9of8=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 0/2] Fix the Xen HVM kdump/kexec boot panic issue
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, boris.ostrovsky@oracle.com,
        sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, andrew.cooper3@citrix.com,
        george.dunlap@citrix.com, iwj@xenproject.org, jbeulich@suse.com,
        julien@xen.org, wl@xen.org, joe.jin@oracle.com
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <cb2e1a63-de79-5050-bf2b-bfb302997381@suse.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <2794895b-6417-7164-8417-0f1edc52ae10@oracle.com>
Date: Tue, 12 Oct 2021 08:50:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <cb2e1a63-de79-5050-bf2b-bfb302997381@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::24) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e7cf76-097e-473e-31ab-08d98d97ff46
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5802:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB58020A0532ED55EF31CAB15DF0B69@SJ0PR10MB5802.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YKwHhxg6MZnkr9oPMFIjRTia5rmkmeA5u9xZPdYmcyt0SnVIQd+JNOHEIDH/jPcSJyHXE2iPWgBBMsgZD+mCqFli5SxAXp9SlBdLlIxnGf7XlkVWlFBm/XSLTh8HIky+QraTQ7SMre8xOeicum5dIHBJ9KZE9vc/OyurcxCHk96BLlhC5/1dp1bcXLe7VWpJIPOahNO29jeQ/o97iZOOF7LAb+X7asWoinSoKDpjsXeOZPprXK3j1eNb7yKi0dWSB7dyDG11Hx1pjJWPVSyxcnRlMEu6DrMlWCBaxKgU3Lw40uRGeRHPx6LhGX0jtH19mVj9I60cPRV85kUtc4gcv6IOv0rI5uN7aeDTb8IdP+ehotK1cIRX0lqmZ8hh3mv5SJoCpQMDaFuoYmtZNWaS40yX9ayKNWQbomRr4pG2PGVe5CGkxt7QWZ9rM9Uba9d/k4iIyBXMSiV6qsY4AjPjou7m/EKAhv+PIVk2ScaYaJk7F6wS79aNTJDJK03IdXEXB77TgRsDGjhAf/L+JgzQXnY+90higmFtLroDJNNl4SIbzKJ1aLYTt4ybnz3w7DxU2k5T50tm6mtYfWUhx3dHDOc3q+BJYsXIrPG91ZnmgujOciTc0Xodfoqrdh7uimpYN5YLQK6c5E+FIFultHgY5WjXc4Rld9ewYvyOAZU2E1lFAYkyEcVdRUznGc4pSdHpK2pwbY/fH4BfLrsHbY1YsOC7fkE0uhiT5fBWSzPjKb2TbPJnLOrh+ao1PejsxWed
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(66556008)(2906002)(8676002)(6486002)(31696002)(36756003)(4326008)(38100700002)(31686004)(107886003)(66946007)(508600001)(7416002)(53546011)(44832011)(83380400001)(66476007)(5660300002)(8936002)(86362001)(316002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1NxTkxSYW1iVWJQQnpwNk1YYjNFYlQyWWZIblR0U0tmNFJEMXFPUm5wY2dq?=
 =?utf-8?B?R2l5T1lLYWNhYlA1SXhHait2Z3Bqbk4zakdTakpkUVpXaWJsZ2plOXhxVzlP?=
 =?utf-8?B?bWxaU3AyQ2N5emxXU3ZoMFc3eDBaelJobGFBM0FSVDI1Ly9ob0tSL21ScDR5?=
 =?utf-8?B?NXVuMWtFc0hqczJpcDJzYVhFVUUvVmNQcEdJUUQ2TFBESld0M3FSUGlGeCs4?=
 =?utf-8?B?V0pqak90TWxxUzYwUUJkSmxGZFFyWkQ2SUNDT3lPWE9iY2RoN3B0b2llV0JM?=
 =?utf-8?B?MkFMV28vd0ZVMExtbmprNytqcU1LRWJyUHhIYlhDQWdVZ2pPRUNNNXVCdmxk?=
 =?utf-8?B?NTFYS0lrbngzNCtKUjlZSnl5ZSsvYjRZeE8vbzJKc08xNGxEV0ZPZWtxc1ZD?=
 =?utf-8?B?QWR3ZlNNSkRwSmZnZkFGejViLyt1NkxQcnE4RUlDSHJQRGZzcVhSaXRaRkFS?=
 =?utf-8?B?VUdUeVhxMkZJd0xuM05mK1RrQUsrSnZGeXMrOVNoTlIxYVpXU01GRld0WmFK?=
 =?utf-8?B?c2M2UGRGNW92U2hsa0FkdVQ2eDFHdHBDd05vWGxKV1BCZ09uQjVvb0Zwd21C?=
 =?utf-8?B?Z2gzbktOTWR0UDZrdTIxODdGeDk5SkFIaEdJeWkvSnBvWlMxL3BpQ1dsUi9r?=
 =?utf-8?B?S0hQckZ6eEhQVENvNnZVeTAvQ1ozbmk0cWlEUXJiTVB0OXgyYlhWMkUxcVFE?=
 =?utf-8?B?aXYzWUJaeTc1em9RTlFqQlBUY0hlbXRKQWY5SUhuc1JvNWNqVllVVDE2QnFS?=
 =?utf-8?B?L3NFUmorT3lOTWhobXAxVUpYbUYyUmJpZzZPSFp3VE5GZmt6emozUHU5c0lU?=
 =?utf-8?B?UEFDVlVHWWZRN3B1eXVpaEIxUFZOZUhIK2NBWTBWeWtaUWR4OGZ6ZlRma2xK?=
 =?utf-8?B?cTVkVEhhNkRwenlSSVRPSjM4L01jSWp4UndPc3pUbW5KaDdtdXdJZ2V2L01h?=
 =?utf-8?B?dEtDYXRKaXF6M0FtM09hb3hNTkQ4YXZLVSs5U3k3OG5obVRCRC9uS2RKS3dT?=
 =?utf-8?B?Z3cxWVBLL3M2STJWaUxUN0loTmIxSndMKzBEZ0wvNGFHRk9YcjRFNi8waVAy?=
 =?utf-8?B?QmZnS2hKL1JWb09QYW5PamtkandZcnQvRUNwbUI5UUhVbGt4YkY4ajVDNU5M?=
 =?utf-8?B?clJuTGZTc0dMbnZZTms2LzRxVEFFL0FWY0lsdkMwOGo1WmlzWHFBc083RzQ2?=
 =?utf-8?B?VGUvUSs3OGxPVnZMeUZYbHExOENSZkp6K0Z4NnNsaitLa2Y4Z0l0WmNEbzJ5?=
 =?utf-8?B?MjVrOFZiUk40WXhHR0NmcFN4bG1vdFNLVnRuWjY1Lys0bjJHVFVBOW5mV3hF?=
 =?utf-8?B?N0hpZ3kvU1VMaTdleFl6RXdoZzlaWUFoTFZEODd6VFNBZXQ0eUltYU9XYVRs?=
 =?utf-8?B?cXRxcDBQb0lnVy9qRU5yZEVpUUJXZXRCSDBMSzUvY1FpV3o0M2p6eWpHcDVZ?=
 =?utf-8?B?WlQ0aFM1RUpGZlliQUlEbnlId3FXbk9FR3dIL2dGZWdDRWIvSjdIWDAwUWpu?=
 =?utf-8?B?eVhHMGE2OUEwTXNxN0pGVXZDM0hYcEUzbk8zNVJaUGFScEQybUxTL3Q2ZW1i?=
 =?utf-8?B?Z3Vud2M5VmE2TEJFcnR6SDJwbiswcHpnUU5SOEp2OFI0eGxsZWFGcC9Xbmtt?=
 =?utf-8?B?RFk3TTFWV2Y3NTc0c2pUcWFCZDhUano2WStxSEpocVRQdWJZQ1NtMEROa1F2?=
 =?utf-8?B?VXh3TktkTXdRejU0L1FwTnE2U250dWYrTnp3Z2Y1cmFRNys2L3FLb2I3YTBH?=
 =?utf-8?B?SU5RU3g3eVEvWlhIVTNSTFNFR1FyVEg2dzhEc2dpank2N1ZHeENLUndlY08r?=
 =?utf-8?Q?oLx2X3Iaoe1y+GQc1TzZepnvLeTUErlSPaTEs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e7cf76-097e-473e-31ab-08d98d97ff46
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 15:50:21.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rZwxwpPegd7Em1Yb52/IYzQeeyPOfzULvNsdO/uLXzk/m5xXwRyfPZPshC+Df7iU59B3qAdNJIcds1qe4rtBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5802
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120088
X-Proofpoint-GUID: 9ar5uwnedwp_u-K97u1JLQMijareiRop
X-Proofpoint-ORIG-GUID: 9ar5uwnedwp_u-K97u1JLQMijareiRop

Hi Juergen,

On 10/12/21 1:47 AM, Juergen Gross wrote:
> On 12.10.21 09:24, Dongli Zhang wrote:
>> When the kdump/kexec is enabled at HVM VM side, to panic kernel will trap
>> to xen side with reason=soft_reset. As a result, the xen will reboot the VM
>> with the kdump kernel.
>>
>> Unfortunately, when the VM is panic with below command line ...
>>
>> "taskset -c 33 echo c > /proc/sysrq-trigger"
>>
>> ... the kdump kernel is panic at early stage ...
>>
>> PANIC: early exception 0x0e IP 10:ffffffffa8c66876 error 0 cr2 0x20
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-rc5xen #1
>> [    0.000000] Hardware name: Xen HVM domU
>> [    0.000000] RIP: 0010:pvclock_clocksource_read+0x6/0xb0
>> ... ...
>> [    0.000000] RSP: 0000:ffffffffaa203e20 EFLAGS: 00010082 ORIG_RAX:
>> 0000000000000000
>> [    0.000000] RAX: 0000000000000003 RBX: 0000000000010000 RCX: 00000000ffffdfff
>> [    0.000000] RDX: 0000000000000003 RSI: 00000000ffffdfff RDI: 0000000000000020
>> [    0.000000] RBP: 0000000000011000 R08: 0000000000000000 R09: 0000000000000001
>> [    0.000000] R10: ffffffffaa203e00 R11: ffffffffaa203c70 R12: 0000000040000004
>> [    0.000000] R13: ffffffffaa203e5c R14: ffffffffaa203e58 R15: 0000000000000000
>> [    0.000000] FS:  0000000000000000(0000) GS:ffffffffaa95e000(0000)
>> knlGS:0000000000000000
>> [    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    0.000000] CR2: 0000000000000020 CR3: 00000000ec9e0000 CR4: 00000000000406a0
>> [    0.000000] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> [    0.000000] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> [    0.000000] Call Trace:
>> [    0.000000]  ? xen_init_time_common+0x11/0x55
>> [    0.000000]  ? xen_hvm_init_time_ops+0x23/0x45
>> [    0.000000]  ? xen_hvm_guest_init+0x214/0x251
>> [    0.000000]  ? 0xffffffffa8c00000
>> [    0.000000]  ? setup_arch+0x440/0xbd6
>> [    0.000000]  ? start_kernel+0x6a/0x689
>> [    0.000000]  ? secondary_startup_64_no_verify+0xc2/0xcb
>>
>> This is because Xen HVM supports at most MAX_VIRT_CPUS=32 'vcpu_info'
>> embedded inside 'shared_info' during early stage until xen_vcpu_setup() is
>> used to allocate/relocate 'vcpu_info' for boot cpu at arbitrary address.
>>
>>
>> The 1st patch is to fix the issue at VM kernel side. However, we may
>> observe clock drift at VM side due to the issue at xen hypervisor side.
>> This is because the pv vcpu_time_info is not updated when
>> VCPUOP_register_vcpu_info.
>>
>> The 2nd patch is to force_update_vcpu_system_time() at xen side when
>> VCPUOP_register_vcpu_info, to avoid the VM clock drift during kdump kernel
>> boot.
> 
> Please don't mix patches for multiple projects in one series.
> 
> In cases like this it is fine to mention the other project's patch
> verbally instead.
> 

I will split the patchset in v2 and email to different projects.

The core ideas of this combined patchset are:

1. Fix at HVM domU side (kdump kernel panic)

2. Fix at Xen hypervisor side (clock drift issue in kdump kernel)

3. To report (or seek for help) that soft_reset does not work with mainline-xen
so that I am not able to test my patchset with the most recent mainline xen.

Thank you very much!

Dongli Zhang

