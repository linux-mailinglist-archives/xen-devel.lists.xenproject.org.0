Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800735DF76
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 14:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109738.209455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWIZ8-0006qb-LY; Tue, 13 Apr 2021 12:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109738.209455; Tue, 13 Apr 2021 12:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWIZ8-0006qC-IK; Tue, 13 Apr 2021 12:54:50 +0000
Received: by outflank-mailman (input) for mailman id 109738;
 Tue, 13 Apr 2021 12:54:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6X8=JK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lWIZ6-0006q7-Q7
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 12:54:48 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c22320f6-0e74-41a1-96cd-a63fde9a62d9;
 Tue, 13 Apr 2021 12:54:47 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DCnpu8092608;
 Tue, 13 Apr 2021 12:54:46 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 37u3ereyaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 12:54:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DCoURn131726;
 Tue, 13 Apr 2021 12:54:45 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by aserp3030.oracle.com with ESMTP id 37unkpg93t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 12:54:45 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2838.namprd10.prod.outlook.com (2603:10b6:a03:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Tue, 13 Apr
 2021 12:54:43 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024%7]) with mapi id 15.20.4042.016; Tue, 13 Apr 2021
 12:54:43 +0000
Received: from [10.74.99.115] (138.3.201.51) by
 BYAPR07CA0007.namprd07.prod.outlook.com (2603:10b6:a02:bc::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 13 Apr 2021 12:54:42 +0000
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
X-Inumbo-ID: c22320f6-0e74-41a1-96cd-a63fde9a62d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=zr7zlKjnCZUqs/Eic6tF6Odis6YzOwmg5k/K9Dvq0m0=;
 b=cF4dXe0RDt+KFp/TTV46tw4dAs25WGHCoq1s0Hrc+xKIf7LYgoMJ9Yn0+PZWvF4362Oo
 5OiY4zkFAaDlgWvMr/booYjQ9ilQ3wBrfg20ef6+PmmdMFY5AkVQGOlIWKEYY/gMWunJ
 W5LtC70y0NqLPHQJ/+3D7MlLIbEW/d8qDzrpoR62DWBBhQFhmtkg1gSpC1vRpl4ejjwf
 veTJa4m3caYX3JG8/fcz3mB0GVIIB5ZB+MD+xQy11j5WhNLdVLX3DPB2elR0UZNS7fpx
 lBD9//O4P2QvKOLnKKFtT737vlJhvmpDR3kysEe19LiD9rvSBRZKVMwLsPH9YVZtbI1t EQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLJ/IUVWAPVC6vxhDtlIcAYjnq343pvL9JbXZqopInwNVyf6F91fZnNI/CnRF37z8ZjAedjxJhp1V01Xbo8RpAbrttSGjVqepM4IcCDV1OgLbhydy/PpPpsakNV3Z8dbMUdcuOE43A+4WwrzqBuYF1ZUbfzSzAQpCwi4T4MU3EZFhd+w559a2fJjPG0Zq8UjsR18r3kjhb1uQZHLHSXbkWd0JZKLpsqolkFyKsVaap0U22f7vzgudi7I766naXEFnkgZir5hTbExkY9rUMQqL7a+P0pVcdqUaUJFpTMYJ7tC7arqD6KSw9fq9uH1mPxUxNwbrKZ1Q6nCELVK7P0jKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr7zlKjnCZUqs/Eic6tF6Odis6YzOwmg5k/K9Dvq0m0=;
 b=l0UsJqOD7FR7j7GdLP6D09VY+CZsT+iivwcV93rywDNy9aJE/OF+YUDmaTaTWMGgkIIUOdT3mM3sMK/R4AufSzWcH8u03ohJ9iBJH6nBJSLt3OrUDYNjzR9LN5G0CajRM1DJYf5Pi6IK4Fz7g6HYQqKHc27J6DYOERp8QE8oQi1wPkRrduAeXqxefwMrDpwJqIryorhv7yxNSgGTohROjWQ88rwBYsy3WMPfHRlgY86mqqx/S1EHRvxYhvueLWayC/67rEkmVO/Y1tbYEvyw46MyQkmKruuj6GaC4cWw98gB5bE9j+JGcIVl4ipVEgasNNxCYCpUPv+S75vRv+L5uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr7zlKjnCZUqs/Eic6tF6Odis6YzOwmg5k/K9Dvq0m0=;
 b=aPs2IGzlQaAgRC4Ax5dg+3r9OlZQQKyLBWTrQKS9KEzp+IHMUO0P2wtv54+zn91RP1dbz8dvXrPSjBvviujiafd4JoDeb0o8ipUyH54ryev8+Rko4OFKjIJBzk4QAGj1GlUPHt8fn2PZNDU0k5ydC5LhGmQXh/qW0eUev3EIB9s=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH 3/3] xen-pciback: simplify vpci's find hook
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
 <158273a2-d1b9-3545-b25d-affca867376c@suse.com>
 <e9f358bc-e957-e039-235c-6a9f68328554@oracle.com>
 <ea274ffe-4eee-9fa5-b5d1-e8528b112227@suse.com>
 <037a8fc2-2c69-2049-8826-32181b8aec2d@oracle.com>
 <e7686006-5f95-3216-60ff-daf1b1cbe8c4@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <4103f557-fda2-719a-2875-07f957d08c44@oracle.com>
Date: Tue, 13 Apr 2021 08:54:39 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <e7686006-5f95-3216-60ff-daf1b1cbe8c4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.51]
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84e562cd-c671-4f66-14e6-08d8fe7b4f21
X-MS-TrafficTypeDiagnostic: BYAPR10MB2838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB283812C4FD1B01BD6F96D02F8A4F9@BYAPR10MB2838.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eStVWJMVZy7Recw1kObC4D8Va4nUuabNI2PZ1uDrhwC9mWHrpsTkn2CSFerBViae3BeJMUc+Ow5MQYdlqNK/pdYk+2l8Eq/aux2u3igboAdZCOuM29fO4yfMr6QBPXiO1lhtkJJUeQv3MTth+LBTCWMapFW0z8LIJbohAmVSJmeWVi1/FxbhJJ4SuMs7Lo3muC2elTnTc9/ojFHaPALHBGYE7YlVj0X6veQwIPge42SgUOhhnEaTnY3uC8p8KIX8cHKRgj8nebLzq7IAeKiBZmMBNzV+cGsOX0CPR2cz1Bz1ngGiLh4aSRet2LisAOIuK5XzD+EDqEkZ0OZDRvjE2sSy/f/ZRAO5YSJjFhNqmnJTzSYKDnglekfOwQX1v7MV9Su+If0CFHnkoK6pMIcXUDsYfGZysIZR5JrNrCCY9ppjU0fxWapnBWpQ9kF9YhaR8u/vUE+tfQRmOq2nXPbmhV95nw7IfB59PClWmpzkdOgsIWfOW2I8XT0rysPt+t1kayMT3voIzJaXc207jjFF1tu2T+q77xx3rBrsYf0DRhVIV22bRSEOVUI1i5YgKkMtrgGnLPajS5EmcCjKSEvEY/j8m5MdgA3hbA0UpDh6TqAItTidaebKZ+6++SdPOJFXeOTur9q8zRb/tO90WBgKVEXmML4in8xE3ZkuStmPXCtQOL0UUiBIZIGeeNagA1S+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(39860400002)(366004)(2616005)(478600001)(956004)(5660300002)(6666004)(66946007)(186003)(6916009)(8676002)(16576012)(6486002)(31686004)(54906003)(86362001)(26005)(4326008)(4744005)(2906002)(44832011)(31696002)(66476007)(16526019)(8936002)(316002)(38100700002)(36756003)(53546011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YmZIQW9HZC9MVWRlalNIcXhXOUhVVjc5dVBSNEFMY0xCcytZQ3BGdEFib2xL?=
 =?utf-8?B?NjA5Y0NZUUtta3BCWkRRbGg3eEdQeFBicVBSdHZnbkRwNHVCM0NIUFA2ODZI?=
 =?utf-8?B?bm1rVHlqOTJGb3V1MFZiN1RuNlBEa1N2TVBpejEzUzU4WWs5M2x2WGthL05K?=
 =?utf-8?B?YnZUNDhnR0l2UFBvVVhvb2g5U1MxTzVHTE9LQzdmVnZOOGU2TGNub1FGNjFS?=
 =?utf-8?B?cWx1dWhRVDJmOFNEZG5oRGFmWnF1alBaWnNjTW5DZ2J4NFE0TzdiMW9naFk2?=
 =?utf-8?B?c2tudy9kWUVNZDdFenFHNkpHcklpZmdEV2poWTRTQm14dVN1NDhDRGQ0Zkts?=
 =?utf-8?B?MTZRMjhUdkNiUVVWN1Y4dUFmcGNJYXVRMEFpWWcxeFlBSjRoQVFjVFB5WEc2?=
 =?utf-8?B?ajBMN1RRMEI1Y0lOVDZaSnhIZmduemxzelVjU0RraDc1MWRZckcyM1hSa0NJ?=
 =?utf-8?B?aWpRY3RMbHdGSnl4SXY1WGZqNGwrVDVrcDVDUFpjWFV0eG5uRzY2VUxSaGh5?=
 =?utf-8?B?Umh4V1VieHhRYkR0V0Q0N2pGOWdEZ2ZhRDJjQVkzS3NvdVhiZ0YyQ1NkSDR1?=
 =?utf-8?B?Qys2UlN5b0pleitNTThaOGtOaU1zRm5yY2t3a25WV2Uxc0ovWWU2V1RoUE5t?=
 =?utf-8?B?VllIK1RlNkliRXRCa0llbnBvTDhaeFBWOHo1d0FzTitzVytmcllXUEwwQWp5?=
 =?utf-8?B?T2hyWkFTaWN6ZUtzeVNwV3N6akZOU1NzMkRCaFZ4K0tNNkZja3lDUUlTZnpp?=
 =?utf-8?B?MXRtUU9heHN0UnBDcWlpMU5LTTZRcy9PTzZCWkpXZ0hXcHdUbVRJREIrb1Qr?=
 =?utf-8?B?WHVWbXBLNlV0QS9yZlZ3OE55UlF0M0Z0SmNLNHB0MjJlSGdOWE91VGZKRDll?=
 =?utf-8?B?c2JXWTBoNEg2cHArbHFidU1hdDNUMk5xWjFHYUtTN3psUkJnVG1rVVpBNFIx?=
 =?utf-8?B?QlFSTk5nc1pUZmMvS3Q0UGZ3WU9POTV5d2hJMUFhQlVrYk1BcHdKejQvTi80?=
 =?utf-8?B?TW5qbDhGS2FwNnUxRmxIeG9aMzhoei9XN0dXR2lyRE1uVVJ2UXBWRnBtOTZN?=
 =?utf-8?B?YXZYSDgycTV5MjZqMldPQXZoRTdKN1gyUlhibkw3ejU1OFVTVXNkNHlLYWhn?=
 =?utf-8?B?Ukh4ZkxYMW0vVDk4Q0tLcVBRZHE5citrWTBSQW1HK0Nhcm5tK1dJL2FEMW1I?=
 =?utf-8?B?RHd6UEdjTmVHSDlDTThPVTB0cXFiN2ZHTjdORHRvQk5ZcUw1VE1wSnJDWWdF?=
 =?utf-8?B?ejM5citlc245K2Roczk4ZWdFYXB6a2tMN3drZjNQam1JNkVDOHBVN21DMWtu?=
 =?utf-8?B?Z1V5ZFJhZ1dLYnFxQnRpYUFiSlRqVmJMLzNLSzUvMEg1djRhelVjYS9zME55?=
 =?utf-8?B?QW9xMERrUHZSU2MxZkgwTERZdXRndmpuai9YVHdML0hIR0hHNm1wYVh3V1pu?=
 =?utf-8?B?WUNYUExLWTU4SmlYcnFrRytyZ1d5TjVhM0xmb0Z3Sk1OZEs0TmIvR2VsdEpm?=
 =?utf-8?B?Q0IwWHNTT0s0ZVBNdjZ3VjMrVlh0U3ZRSDZjRmJSbGNGYkNYRGNkeXdUeHVv?=
 =?utf-8?B?Y3ZvYktLelg1emZrdkZITU8vRXZYMURYRDFhbklwditHc1hXek80Qko3TmZC?=
 =?utf-8?B?cWhyY0JZOVowUXZZdWk2RFdBdmp1TFZlYTZuOVR0ZW5wbkVINW92L2dkRUtv?=
 =?utf-8?B?VjJ5Nk9meWtGYkZXRTdza3poTE9PMEREVDFvZnoxVHFXU3VzWmYvMHAzNXo2?=
 =?utf-8?Q?DwChpgyVZp5m0MbcbPiiPa9p/jblpRHm68zbNFX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e562cd-c671-4f66-14e6-08d8fe7b4f21
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 12:54:43.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAgWWz2PTGgpAHkgNGcbDGkNtGMaD4uq55NX94a4LjNvhRxCsPpf/dSSVu5vVoavdd1mGSM2PnSsoHEGpeKNQjBv14MNK41EBty6Utprt0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2838
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9952 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130089
X-Proofpoint-ORIG-GUID: cOEW3Tr7y_SFxRx7HU1nB2OqotpcSukI
X-Proofpoint-GUID: cOEW3Tr7y_SFxRx7HU1nB2OqotpcSukI
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9952 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 clxscore=1015
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130089


On 4/13/21 4:09 AM, Jan Beulich wrote:
> On 12.04.2021 18:05, Boris Ostrovsky wrote:
>>
>> Given that next Sunday may be when 5.12 is released I think everything but stoppers will have to wait for the merge window.
> Oh, I didn't mean it this way. Instead I thought the 3rd patch here could
> be pushed to Linus during the merge window, while the other two may be
> fine to go his way also during early RCs of 5.13 (giving us some time to
> sort what exactly we want to do).
>

Ah, yes, that works.


-boris


