Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE83322DD2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 16:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88839.167219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZtj-0002fF-81; Tue, 23 Feb 2021 15:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88839.167219; Tue, 23 Feb 2021 15:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZtj-0002eq-4l; Tue, 23 Feb 2021 15:46:51 +0000
Received: by outflank-mailman (input) for mailman id 88839;
 Tue, 23 Feb 2021 15:46:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUnP=HZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lEZth-0002ek-7h
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 15:46:49 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 541f760f-ed3e-4dd3-9429-50a0c38392a0;
 Tue, 23 Feb 2021 15:46:48 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11NFjE6v123596;
 Tue, 23 Feb 2021 15:46:46 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36tsuqyumx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Feb 2021 15:46:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11NFkaa4029070;
 Tue, 23 Feb 2021 15:46:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by aserp3020.oracle.com with ESMTP id 36ucayhgn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Feb 2021 15:46:45 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4340.namprd10.prod.outlook.com (2603:10b6:a03:210::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 15:46:43 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.031; Tue, 23 Feb 2021
 15:46:43 +0000
Received: from [10.74.102.180] (138.3.200.52) by
 SN4PR0701CA0025.namprd07.prod.outlook.com (2603:10b6:803:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28 via Frontend
 Transport; Tue, 23 Feb 2021 15:46:41 +0000
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
X-Inumbo-ID: 541f760f-ed3e-4dd3-9429-50a0c38392a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=xZQx4Q3z+D4lExqRxh3MkBUnxpYrHmK/UY8Crx6t11o=;
 b=vuB+EsClYLn/MogezzfxVpPbUTg+8PAESlRRQT3cxqbBMXlKgAcs7mRRQXBCpwiHHhNV
 +WJwJBVYd9FD/aBuM6EQv6C2K55VBAcLzZBOP7G20IVlG311BxtKRJ1CFotpUwlMdJV7
 LEdgv4Vy4Bauhrc5spV4MVB4Y/I44UBtww2UX1SO69WgAVZW0dGwx5tRP+z17MACSm6Z
 h3n22lnsPoqaqkvUOP+vu7EgVnuiQ62LD81aK9kuebUgxbMIIgeXlsz1yEFdBtQ+UYj2
 7gj8LikR6wapBamYrs67nfXWskvt9UeqzCyjgdm46N6fAdQCOODAU7rhXU3arrByAERK wQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+MXrT2gsXlgTO9D+YI9zlCxJSIepLampUCC2ZXFHxcZ8+wMP2USstixIE+1fjXvcR0ti7Rxv6Giy7Ssh95OGZD54kpdMW+WsnfNZmCXtv/BNB8c2cScXJubbtTXl309E5LBdvpsoGwbFExZXlpW8YEs3nGjJw0RQMC9Ix2tbXergT1DXITBSlbLA44rsaP3QsFNyScc0A1x9di2bsigr2VSdQKeWqK2mexcKWUADmnuFoWT0dwoXiugyci55eNOtuk0qJFmUSoI2II8/gZotKcW/9lZArkQ0AJ/2OkUV1qCEUvDSBjEh6AH7A6YhNwJiO+s9r1l9LY3khQq6t4mMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZQx4Q3z+D4lExqRxh3MkBUnxpYrHmK/UY8Crx6t11o=;
 b=IdFkUoBmvcgHGlv5aaxSt0hLHYTYejfS9qmkpkQqbPqJ4vRPCi6V6W/HOfDxoX5x3IxlAR2nGkX3+qbEbELeLFOeJV4E5JtzN2g0AYJdl9VzKwQIHZm6o/a72VXFqcNY3PqAiYCrfxTC0SD9lY9vFD1YbNxkJMSJ+8uqoRTj1JUlWwEVVtbPYEF5H+4NEdc1K3893DIZrw4hb73r/a8f4yj28++RzYXmmahBVXrdbLFaW9f+EJdm8XRcMYmhxUKTPsjHhm7h5tQXsIXb2GRE1YCxxsUSB/QSBeVmn9Sm9WuY4B6Q/P4CQNV1EMksyoFuwZqP6KZqjDK1tJptZsfn3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZQx4Q3z+D4lExqRxh3MkBUnxpYrHmK/UY8Crx6t11o=;
 b=KBsKJZA/1hG7GSmGgJfLprlihhWSUdVfqt7pCBWY3agmdRnHQTFOddHDUmkt8EPUb4//fZLAS81t8SW1XEkNNQ6dS/NFxXmMt1z9mivZdBnMfwXSPjqCFNn+X8+1BA6HMOX6NGIE2tePkHDXrApops0arViPDQYnoCgeC/RB3VQ=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH] xen: Replace lkml.org links with lore
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <20210210234618.2734785-1-keescook@chromium.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <6248360f-4be7-cca7-4906-e7919eacaf05@oracle.com>
Date: Tue, 23 Feb 2021 10:46:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <20210210234618.2734785-1-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.52]
X-ClientProxiedBy: SN4PR0701CA0025.namprd07.prod.outlook.com
 (2603:10b6:803:2d::22) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bd561f4-48c5-4bcf-84fd-08d8d8123799
X-MS-TrafficTypeDiagnostic: BY5PR10MB4340:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB434084203223E2CE2F79ABA18A809@BY5PR10MB4340.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:188;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9O46M3p9pV9QInFHbOcq/6RXvQgJYTuOe3HQVlskJHTVkCA7yAHsoaUr7q22c5vZA0Qc5gKsOOulrzepl559IAGvVkJCda18Pe5f6z8SesomN44W3v3XsjbiPKT8ageEpbp8ePPW25Q9z97KyOJ9iJQRfXWcukn0tfX0r9HdKgG7DPm/enldFlqyZIsSLRQIMLQCDrlekEZF8gONbvvgCfzOzD1tq3O5RQwJqFL67P6OFUg6vJSb/YZPaAITRyNO023hFVlnpgst/xNaZXcBgXtwbBJD42XGiOr+KMvJ40C2/rVmntbFkqw5SH88uZm1bn8iLJJHi4OyW1AwLUmyAh2dcD67N6EdCVNsmNie33voU9AyOQABszoF1t55GDDMP1tA1Q5emBPpnDFmdvFeLG1FDqtY087WnlvfJM6ewuC5/DXYib+8qcGUKdpIVXpMSYVeIy/hwbrCPOElocYsyUBN2F2a6BDzBJkVfQ+a6efFqn01ZjUXG5xHCJxyYV29eWPrAvCh5KoYCN91nPGd7nmZjy5E8iJk3KgVWpOzIg6V3AlhHefohZN3l4GeDZkqapKbbo9xJoZqVLBIO1+dfUN4OJst22b/AbbdKvX78Hc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(396003)(376002)(39860400002)(6666004)(16526019)(2616005)(26005)(66476007)(956004)(66946007)(31696002)(478600001)(66556008)(2906002)(5660300002)(6486002)(8676002)(4326008)(86362001)(53546011)(186003)(54906003)(4744005)(36756003)(44832011)(316002)(31686004)(8936002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TC93dlRpcWNPTVBVbG95a1B2bVFGQ3dwd1I2VFEzZTZxdEw3SFJUMmRzNE02?=
 =?utf-8?B?dE9TMWhTOThMMk9WQXJSc3NQTXBCNDJLVllLUUtreUE3UmdFMmZGZFhlYkhG?=
 =?utf-8?B?Z0REUmt0N1VDNm1qVmhRU0tVMllPdFdvNzJCTFhvcHJWTHNYcVUwSTREb3V6?=
 =?utf-8?B?aVlrbnE4dFdzalpDamE3QlFoa0ZtRnFuM1NESVlPQmZZM0JwTGtha2xvUmoz?=
 =?utf-8?B?N2J5QVczNm4ranlwLzhmNnk2bEhCc2NLRi9Ha1NQd3RtMkNrZkM2U2YyaCtj?=
 =?utf-8?B?dkZMd3FCemU2U2RhYklTTTVCMTk0WjI2SmxTeDJabjJPU2dvL2ZJc0xrOE1l?=
 =?utf-8?B?Y0NGYWQ4b1g0NXc3MFVsWUMrbTNrelJvaFd4cHB5bjRtbHkwcEU5ZkpmVmNz?=
 =?utf-8?B?a0tVRUN3dGRlWENsRFFsaXROWFNXbjFSL3dyVGxITUFVbVZySE5UV0pycXBI?=
 =?utf-8?B?dHlId2VidFFjeW13c1Z4U09KYURTWDNmNUVxT0ZNTjYvaE1RNkhzZENCSlFK?=
 =?utf-8?B?eXBLd3hLQWc1anBpR1diZ2VoamtOakFMeU5xQjNkMjBybnBTMXllemhRS09X?=
 =?utf-8?B?OGVjWTJCamNMSnVIWS9sZHlmREZwbFlQRFFGdkY2b3I0RGVkVlk4NEdRUmtK?=
 =?utf-8?B?eVBBam94OGxlNmNkNWMwdHBDNmQzU0lnN1oyVnVMQm5peDN4QXhFaWdUbm9B?=
 =?utf-8?B?d05GL2RDcUtlWWxmNWlqYzJhK3JDS1JrNFVicXNSNE9LOXk4Q1gyN0xqemVL?=
 =?utf-8?B?L2RvdzRvNncyUEVseHlCQ0FnNS81blF2MU94ZVQyQ3BWRVlWcXJvT0ExNXhO?=
 =?utf-8?B?QTBVczhaYUJwSW5XWkN3M0xHbmowKzRRbnp1LytBOURYeGlqNG9iOGcwVnZD?=
 =?utf-8?B?L2hTRzJ2ZEJRUUN3S1BuR2VQdkx6NXZMTjMvTUUrTGpZVDMwblM1UmtmcjJn?=
 =?utf-8?B?S0IzNDRNMEFYUGZxZkhPb0psTk42L0pjOUVob2YrZnVIVzJJVUdSbHNlSHUw?=
 =?utf-8?B?Wk13SkE0TEF2c29FWmU4QTZnQ2U0WGZ6bytHZ1cvcWhnbWJ5TU9yOTNVa2Zi?=
 =?utf-8?B?Q1lSRTBUaFJXVllYQVJBUHhLN0N6bmEwMjhaTDJwdXEyNEhLWGJ4bEx5cko0?=
 =?utf-8?B?OGk3N2JUdVU2dDFvNHNNNzNNYUVramhmNEttSG14ZWNnck5FbVVvQ3V6c04x?=
 =?utf-8?B?MDJwVFBtRkYrN0ptS0QrZmhiZzN5azJvbFZyRUNsSW9mYVdseFpVdXNvVkpv?=
 =?utf-8?B?OTVKRlU3dkNwdi8vWDcrMUZCQjRSd2NlWG1sSGd5aGRwMWJPSDEzYllvU0Jx?=
 =?utf-8?B?cEcya2VtSzc1MGErdkZRZTFXM1FEQ015MG1MeXZ0eFR0T2tiTGJyb0Rzb1cw?=
 =?utf-8?B?ZlpQa3VoRWp4enVzNmpUWDdaTStDUEhjSm5pM1BaSFlNczBIT0VBdmw2SDNH?=
 =?utf-8?B?K2R1UWl1dTVVSmJkUVdUUTR6WThzZXVDK1hxR3YxKzU2K3VQMVNJTTAzVnlS?=
 =?utf-8?B?bnJvUGxDOVk3OEJlQ2gwM29KQnZRc0tPR1hkTDlKYmMybmQwa204c2lwSUIw?=
 =?utf-8?B?YmE3YkphN0t2MVhYSGIxaVY2d0NRQVFLVjR1ODlSQmcrK2d1NnFxMDFXRXR0?=
 =?utf-8?B?N3psZTBwaVNKUzJFUUpZc3l6SWxuUlJ5ekI0UVR0L2pndGxLTGlvdEQrQThW?=
 =?utf-8?B?SzRPTTVqUmhvTDFuaU90OGhZMmxNRjhhRktoQW1aYU5zbEErM0RsZk0za3BE?=
 =?utf-8?Q?QqVrCOQQ4N31osdOnJ9lRp59oTXcERopKaviWXQ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd561f4-48c5-4bcf-84fd-08d8d8123799
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:46:42.8453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnJ6puiuxC/n/weRPgtdZcYKMJ/6V0uKcEC1qavzAk2aaMSZ08R1MG1Xq8IF+URq1uw7rLP7BeYaeHfObOkbVjaOdrNfxnQK3Ru8X3I7bJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4340
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230132
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102230132


On 2/10/21 6:46 PM, Kees Cook wrote:
> As started by commit 05a5f51ca566 ("Documentation: Replace lkml.org
> links with lore"), replace lkml.org links with lore to better use a
> single source that's more likely to stay available long-term.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


Applied to for-linux-12b




