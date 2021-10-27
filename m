Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD2E43CA6C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 15:17:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216924.376711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfio5-0002dl-55; Wed, 27 Oct 2021 13:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216924.376711; Wed, 27 Oct 2021 13:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfio5-0002an-28; Wed, 27 Oct 2021 13:17:29 +0000
Received: by outflank-mailman (input) for mailman id 216924;
 Wed, 27 Oct 2021 13:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jCJ=PP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mfio4-0002ah-EB
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 13:17:28 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12bd4d21-7a46-40c9-a544-f45233a15492;
 Wed, 27 Oct 2021 13:17:26 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RCTXdT023707; 
 Wed, 27 Oct 2021 13:17:25 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj3gye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:17:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RDBwhE027370;
 Wed, 27 Oct 2021 13:17:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3020.oracle.com with ESMTP id 3bx4gr28bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:17:19 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4029.namprd10.prod.outlook.com (2603:10b6:208:186::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 13:17:17 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 13:17:17 +0000
Received: from [10.74.107.92] (138.3.200.28) by
 SA9PR13CA0105.namprd13.prod.outlook.com (2603:10b6:806:24::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.13 via Frontend Transport; Wed, 27 Oct 2021 13:17:16 +0000
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
X-Inumbo-ID: 12bd4d21-7a46-40c9-a544-f45233a15492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=eKryvM9DrpnRHaNG5FgK2wqEwMeD6lIALav02VvtXik=;
 b=P6zMv1KjmxFSsCseTL2+W3H/fYwsMlxq3H7Cc2hjn3Tb8mVd5VfirykrhKxb4WxqNfj8
 pveIamyZCOdl1bmnRIr0EK89a1J3Mv0cOWNPEMSnmUWvx7GP+KxOdPLsgN8l/opltVG9
 acjojYUDcD1a0Ge/JJ/398feJPtlj8ARPvwzDj4ZSePNkyX8nagekcALfAlnleChPx9U
 yvh6aMs5hye5RRQmuzWQIiNcFZ6SR8svC7K/f5nfKbUAJldYhE0ulwFwW7CCVZ8Z2kJ3
 Pqs6llxTnql3iXg5xA60OhOIQt0dUG9BTBpP7PcXPetVhadEJthgEREEhd9jpRdrJQcu 7g== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ml8PDl91brzso0vTLH3bWUhEN8PpFT41O/ITYGxzHel7zoz7At/CjerKe932Jhbm+tECfCvqbuzHW1z4oHvm3OahcjRA7nO0xqAVRQdVCgniX4hT1+fZfzO7ME7D52G5bdubs0ma1clqG0I1pdpgXd8A2vQOU5msFG7WrsJ9000OgwZlup12rbFg+CXYN+Q01L6CzR+xDRAExKGUW40RwjwJJezE7ALcC1i2hDkL2DNpFOmYldnRwg4ndlJX4rHEKT8DuL7TgLwmshOle9uNhpdi9ruXISzn+AFHuqJ+0+pUtLZZT3DGuaRTTACN10ffbbL2IukWjKv+QWr9OMNSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKryvM9DrpnRHaNG5FgK2wqEwMeD6lIALav02VvtXik=;
 b=joSB9/S0r4ZzIo1wlEpDkJ76Jsct2+xjFldQ8T+VygyZlmxJ7DxQ4mY3wV3PG1ZEQsYe1LxlKcCLH/45W3bY9//vCREzTMq3nTPHcqSv9Z2RL3kLwtzFpGL1DGPtzf8NC45DKRhmAZrx+tafhUfAA0pbVF/KDDXeXTIT/JhoK4NWbbGQcntHX1ZD0eolGY1B7KrKCLLoPfBO4MNpW7qGD3fbQTbbKXJk8gOyikWxV5g+W7pwYp3NBIM5sF4Dr+dOahYUo8ZEL+FLtWm/hVGNDtLcD9jKoIWOgTlL35g8dTA9SipED5xuwVZiw6mFTO5HbUnuEHnHxcmot8W6JNR/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKryvM9DrpnRHaNG5FgK2wqEwMeD6lIALav02VvtXik=;
 b=TiLuORGEVzEJbxeQ/gyUu7jOwXAIkoR/Zu5VJkadi2pU8pOXI96xP8UBtQSC/8cq0B7CkHGGykh6/s3HhghgghXj3Q/gaxxn/9CHJuO7JpK5IpuuVsF9/bFtVfLNFh8OQuuDwd07jfnDuqjkgEkmYKzTg2xhGz3rkCZWZwXC2Lk=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <0fca8243-0106-8091-9635-53251c97149a@oracle.com>
Date: Wed, 27 Oct 2021 09:17:12 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH 0/6] xen/x86: PV boot speedup
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:806:24::20) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14717415-b223-4b82-e8ec-08d9994c1980
X-MS-TrafficTypeDiagnostic: MN2PR10MB4029:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4029531CE21C710B6A59A35F8A859@MN2PR10MB4029.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OQAJhsEdVuFrk5m1rg2kYBNsX6vsV5AzZo2RpjZq5rcBwYoYgXm2ATgub80RmpHnkAIP2e09CDpn9BZ8djhmnw6WGzBgVhefWYSeo2pjmxzkE40FNYQXXmQffM+ydl0PvYZ2BlLUjmbMRFSOTgpfYpgNsT2QRKEQUaIfM1mQ7m2HH/PhN7POFIzALV0ipu/98mZemSGpvidT97Z4mGHrQbiNMjdOo1VGft0sf9aq6N9cr9ZmLf9p5W75ITe9jqy1Ml49rxlOA/72HoxU3GNUT9hqLJuKqlOKEjb37jf1iKEq0HHd9+e8rWxaZ2uHAE5CeAlCHbQaBrkECHwy1HsPqcrIKedYS1Fv0+qtwxe0YcHPJM4Cy9l7VmxS/ai8ZfyrW3bNCgT52AoEcNA4M1FsRdvofogrToBlQodYuNiqL6+VXVY2vSsnVaL7/ayWNFbbcGL3/ppfHAQNfQxwew8TxPH0o875O+MXv6OoxVDS9OcwRs6qt488QQibINiJLYlib6FsYv/zs4I2rQQjyxVP1u7vgg147g0VZbtTbbI70lOA3vv79ZrCJ/D3fQjrJmeJYZ+9rWfQ/vWT4xp0KtkTihic8tyZvTCohsLW2IKJ2k9tkirktX/84ua78TlIoPu2H79Z9dOCl1t4oFFLR9IOhDAXT8z1xb0bzNgNXkWqM1CUSsvOgn4y9KmDkCht0RaYjwibbfl8EgUFpx6/hts0KvkWH2qd9CzObucMgxTKo9U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(36756003)(6666004)(4744005)(16576012)(6486002)(66556008)(66946007)(66476007)(956004)(53546011)(186003)(5660300002)(26005)(38100700002)(83380400001)(44832011)(508600001)(86362001)(4326008)(31696002)(8936002)(2616005)(8676002)(54906003)(2906002)(316002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUR3RjFYUE5wMlJuVnQrQW4xK1BKYzJQUEFNN3F0eVVkWWxkZ0lLYUorTEFx?=
 =?utf-8?B?ZXBRR0I1OUE2M0prY2Z0Nis4dGR2MG8zSTh1dnRBeE13bnYrWkNYNUVNeWJQ?=
 =?utf-8?B?WWZxYmhDdFY4MXViZm1UTkUyclhxK01QLzU5d1BRd3JhRzRCa21KaTFhNnk4?=
 =?utf-8?B?Z3cvVFJmNEZKZUhlL2kwZGo0NGYzS3dNL1cxTjJWNjIxVzRTaGVFM215akp6?=
 =?utf-8?B?MzU0ZllNaUorenVCN3pzeUx2a3VRMjlNSnlXM0ttSy94NHlmT0t0bUs1anlF?=
 =?utf-8?B?Y0VKNng3VHJMbDFScHB2UFFoY1RrZDZkNWNKRzVJTU9WSFFSLys3bHhmUmo1?=
 =?utf-8?B?UFk1anc5VExPUEN1L0paY1pvb2xNQ3V4TmZ2ZnNwa01JTnVpM2Q3bmU2V3Vu?=
 =?utf-8?B?WVZud3dnMndPbzVRWFZBM0padXE3b2xBU3FtTjdaQVN3dzNFWkhNU1c4MHRV?=
 =?utf-8?B?V2ZqZWNaWEI3VkRTbkZNLzg2SnQyYmpiUnc1WWhJTTRobHY5SjE3Q2xxVzNX?=
 =?utf-8?B?Z2FQU2VHU2tGOHpKNWRQUDdlb1ptcEpSS1YwcS9DTHhRR3hhNmFSUGRaZjYr?=
 =?utf-8?B?cFY1NmdXUzExang4OENhQWY0K0M0Tk9UL0MvaFNuTmY3Z2tieFc1a1BmMnZI?=
 =?utf-8?B?NnNuNkMzMmZrL3VHdXpIMjFqTmhYQzIwRTNQeEJQdW5WaFFqdWFYN0Z0R2Fr?=
 =?utf-8?B?SmR6RkxrZEtiOUZIN05oVVRDSUdZelJUMmJtNmFRMXlMTkdVQ3JvWThURDly?=
 =?utf-8?B?amRabmRhd3p4YXpxYXFaUmxlVDQ4OWdDNllWdm0rN1J2c09UbUt2Ny9OdjVU?=
 =?utf-8?B?S3BpcDR4MGRobjNiNXV5SUhTSkdLWVlpY2NERmw1WngvVE5uSVJEc3JOd1Zj?=
 =?utf-8?B?UXpCWU43bHcwNHFhRUpBSC94bUhLNXdjRC9mYWhyQWJyMVRjdEJmbG9aNjk5?=
 =?utf-8?B?bWwyNHB6OFFURS9lVHRINTVqZEJnZHMwZHFOOHhHc1FLME56Z3QwenhqTWFz?=
 =?utf-8?B?akZrLzh1aUQ5aG9JNm42Tm1ZUFhHREhDdWxlMmNtSjZSWElCZXVVWWlvYXBI?=
 =?utf-8?B?NW05c0RIdFZvZGE1NmVmRDBXUHlvVGFmTTVQclVwT2ROM1hiMjJEU2d1aXha?=
 =?utf-8?B?ZjBPQUphdGI2a2ZFZjJvVEYzZTNJQjJCZWluT1F5eVVudE1DRVoyVzByYmlU?=
 =?utf-8?B?RUlNcFVwQTV0QjZ2VnZ2WUtRc05MRnhMbEhDb2hMMTRlaGJYU0JJZEozZGdD?=
 =?utf-8?B?b3ZkcGxaRnptU2hJclkyOEYrRk0xQndLOFFZUlRpNFlIeG04a2J1MFdFYzdV?=
 =?utf-8?B?UTF6MnZ0UXBQV0hEcHZXSVA4dlZpa3JwdlZBQjB1OUIyRklMc2FFY0RNQU54?=
 =?utf-8?B?OFhxNWlvQTEvZjVmcCtOVG02SkhuLzgzK3ZMRzg0TFArYmNqWVJ5SFR2N0p6?=
 =?utf-8?B?OS9CUHJiMnlzdEJ3WThIRG13ekZjOUFGamlmUjRtV1pLNTJmbW1IUDE2ZlJi?=
 =?utf-8?B?akg2RUFWUTlhWm54UU0xWFlNdGx6TnN1WndGWTJoNnRMT2htdWRLMFFWT09s?=
 =?utf-8?B?b1hXeGluZmNWL1AxSk01QjZKUFdKSnlvR0F0M2x3U290dFhrZ3NmSGdKcDlT?=
 =?utf-8?B?bC9mQWRNRXA0MGMvM3ozSUVvSjRaRDB6Ukl0U2xSVnBNaksvbkowZ2lNUWdy?=
 =?utf-8?B?UGtTK3lUK2NqeUprak1CNzhFbitzbW03Wk9RUEVnWFB3b3lSNytPTW1QWnEw?=
 =?utf-8?B?ZzJyR3Erd2ZJVE5jcmlVSDdKTmxtRWlFTUVNemFQWXZueXZhM2M0VGFLYU9x?=
 =?utf-8?B?d01uY0kwU0xuYWZ2czQ2Z21EQlBXNWlPY2pBQjVZY2JzTHlGSFowZm5peHJS?=
 =?utf-8?B?ekpPRjgvVDJ4MkNUQ2Q5NXVSR2pwdEJsdUxkWG0rWEpPUmN0ZWdtY2ZCa3BJ?=
 =?utf-8?B?c2lWTWpkaWVrRDBrNHZUUFNSM1h2MGhURnRvZDNvQXJpOWthZWhTRVllTnkr?=
 =?utf-8?B?TmRVS0I2TXo1MG1IeVUyZ2t0VHBtS3JJcjk3aUhoVit3YmZCSDM4Nm9FckZ6?=
 =?utf-8?B?cTBZdjJZK083WDVabUpkdFZVbDRVRnA5OFBQeUcxYk04ZmcvN0c5U2RtL2c1?=
 =?utf-8?B?TVN2QTBSR0pOK1c2OHJqZ0k3TENxaFpUWTJIcE5VeFcrbTczQ05TN3c5NjBV?=
 =?utf-8?B?MVd6NFlGRlM4R3pTUVMwSFd2NjhEU1B1WnliVDFhMmp2UGZ3R1pnSUhDUEs4?=
 =?utf-8?B?UWtrNU45cUpDUWFkdFJ4Z2FVQ3pnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14717415-b223-4b82-e8ec-08d9994c1980
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 13:17:17.6448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0AiZT1boac9VOL6ePHA2yblIgl5mnOb2RGYuvajIYvMnAC/6FFRPw2fc72VzW8aQB5x9urApDq4AANJJaDTv0WDvhzKNrIKkDNtJNLRcH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4029
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270081
X-Proofpoint-ORIG-GUID: SthDEoaTXnYSC6InyF03KM7WKXPFgABg
X-Proofpoint-GUID: SthDEoaTXnYSC6InyF03KM7WKXPFgABg


On 9/30/21 8:33 AM, Jan Beulich wrote:
> The observed (by the human eye) performance difference of early boot
> between native and PV-on-Xen was just too large to not look into. As
> it turns out, gaining performance back wasn't all that difficult.
>
> While the series (re)introduces a small number of PTWR emulations on
> the boot path (from phys_pte_init()), there has been a much larger
> number of them post-boot. Hence I think if this was of concern, the
> post-boot instances would want eliminating first.
>
> Some of the later changes aren'r directly related to the main goal of
> the series; these address aspects noticed while doing the investigation.
>
> 1: streamline set_pte_mfn()
> 2: restore (fix) xen_set_pte_init() behavior
> 3: adjust xen_set_fixmap()
> 4: adjust handling of the L3 user vsyscall special page table
> 5: there's no highmem anymore in PV mode
> 6: restrict PV Dom0 identity mapping



Applied to for-linus-5.16


-boris


