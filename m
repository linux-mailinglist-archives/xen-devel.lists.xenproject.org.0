Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1935CA84
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 17:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109342.208737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyul-0000us-2q; Mon, 12 Apr 2021 15:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109342.208737; Mon, 12 Apr 2021 15:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyuk-0000uX-VS; Mon, 12 Apr 2021 15:55:50 +0000
Received: by outflank-mailman (input) for mailman id 109342;
 Mon, 12 Apr 2021 15:55:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HoLK=JJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lVyuj-0000uS-PB
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 15:55:49 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94dca6b1-ac19-4bb7-93bd-560e349ca269;
 Mon, 12 Apr 2021 15:55:49 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13CFtmKE192499;
 Mon, 12 Apr 2021 15:55:48 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 37u1hbcaa3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 15:55:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13CFtOVv172775;
 Mon, 12 Apr 2021 15:55:47 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by userp3020.oracle.com with ESMTP id 37unsr3agn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 15:55:47 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4477.namprd10.prod.outlook.com (2603:10b6:a03:2df::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 15:55:45 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 15:55:45 +0000
Received: from [10.74.101.110] (138.3.201.46) by
 BYAPR07CA0003.namprd07.prod.outlook.com (2603:10b6:a02:bc::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Mon, 12 Apr 2021 15:55:43 +0000
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
X-Inumbo-ID: 94dca6b1-ac19-4bb7-93bd-560e349ca269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=atlzDi+DE6NBgRjfwgIjKyPIgX00s/eE046Xp+kC4EU=;
 b=SQSgcdOKqp4i/tAziFywuS1/dvLanvzMT8gTaeRUYg+WqnrJkRNPfaKm3aBDnu/SmNA9
 1jmvZOEj5S8WjW88Ju6ySUwb1tzHDZdHISIgYglaZnu1AQswNnPWdv01Hxs9U3DkSCAh
 R3iYXArb+cKfiChEwxb9YWFyHyUIJRtMaPQHmVluYgLaNsPQsCXTh78htC+w4+GrPLl6
 SUMEwHGsYJUXUQiMJLOcoxOetGi7S1tL+xnG8VwDG1Td6FKSRSuLEXiZbDKpyEf2CF4O
 D6techcwYVcAPUToFSy5GqvJ39KpnV/rWw6/aAwsSQQm3saJPNAHf/LtuDLWYuYWwPsJ lg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+l5pE3zNq2uxdQ5upshF0YWqI44jWP7Ogygt2Uh5F9Qfmm8P+K4Uq2VdHtH7zPWRZL1ZRQvTnAbn2hAtTqWg/F3Nr8TS/vlDznp+ixyOaz4jUveHZyOdt2pNGUVF/56Gc6K79EgDJQZbc0wRC1xDoPUD04okS+r5ZItEuwHQ6nBK1Z54lvQlqBDBdkbApWFAa78+gJB+CzkW8tTyNlK8UBAAzqsFj1b1INjQLe2phwHZUgv0FeulD74DYE1KGCYzCKS7jPdCfNCdNePki+Elxpo7quuNeYAH5GcqH2q6VPay50dhiRFOacyynEVOfixrLNQSAGDmjHbstRDyQFRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atlzDi+DE6NBgRjfwgIjKyPIgX00s/eE046Xp+kC4EU=;
 b=eRfSLphhACcRZv28lTmMcsmFE5CuSzCCIwmVHOTa+25VIkeZU4T1EBzjPyHdaz40zltMfLfpb7sWoNCDHmsIsn0hVkSNzT5QEjc1IN37jcY/MCKIv8KsxpFL8Uo72F5DHiOmgfauQDwBGDXlQaztbd+l12lt1FNbgpr+jpf3qg1WqHV4ZDMi9KLU46jvDxSzqCigWsTS7qVeOQ8zQYpK3sTsFQL6LitNJsknISKU04ndH8BFJYWxoMKJL3lp1CkIcLSZGgAhowy7gT3SZNlyT6msR4LgLLBIfaEpkn6NDgNrojiQWFOpioqLZME4qgiFCOh0skeCPfPyDbRn1eODYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atlzDi+DE6NBgRjfwgIjKyPIgX00s/eE046Xp+kC4EU=;
 b=idZ/ENws5mO+Nd3emX/PyFT9ndNiTNr07iCiy7uEBsE43rwgc6g4rqftcFFgPbCDaCRMntwlPybzOqisoiw7HwjC38hyWJvpPJWwQakHcVzvKfsR77WT7abOBj/8b/9dduf/En1NShcG3yjQosty/Ancn9TXneJd0vA4NY43vqw=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH 2/3] xen-pciback: reconfigure also from backend watch
 handler
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
 <74955b48-80b1-3436-06b4-d8569260aa65@suse.com>
 <a93c66e5-807b-e557-d437-48d7f46f25f7@oracle.com>
 <529f18d5-89ae-596e-29a7-d773e5a3c6b2@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <c0e94f59-e91a-1f54-4692-59bb72b01f43@oracle.com>
Date: Mon, 12 Apr 2021 11:55:41 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <529f18d5-89ae-596e-29a7-d773e5a3c6b2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.46]
X-ClientProxiedBy: BYAPR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::16) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb807b4-6bee-4aba-8ad6-08d8fdcb6e84
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4477:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB44778815C2B917BC6EFDDCF58A709@SJ0PR10MB4477.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yIRjkLmK3AsAVGR4pRnC4QYh83HTctAmndub5vFTpfUYftpy6FCLahODu8kLsOQniuMiUdbCh4mgADLvA/P36pFyapRP+lrmKgNZU/n6SO5bAztbiw/8absj1iA/Du81hYQxhQZBhL5r5N05BmsCP38ecc6MN7BTxbyUqrHr3EYlzhbPISt12S8Ya+CxjNepP+gYV1cyv30kfjlFI64dz7nOR0CkPHgNnVp8rUMEnb/K8uj1ffxJoFNVd+Y+3FgBnsoeHGy6iB6QKISrKNxeZEckX6SMfYZ9m3uP/mVWbqMhEQVL3Irx6x8ora8Nen/PW/4syE00V5yK0x0EJxceNKlWcqkp5Ko43uvgQynk3VcBz9aGqvDuL7LWFCrBKVuTKimI5MiYuOJtTdg6apDcu6b+hAXcWSxZbrjHrzlFLE2yJVT0pHYPyV0dA0psGbEdCJdpPm+k7YGvvoX3pkWxxbnQNOSUdAzdCJDpIqI6oeQALkdgQ1r3hSEQd//RavDqBdQhT4rGFjJ3QrJ2Vzm4++Y8mbzFkmNFcWrHy2qOfrF2D/z3bp76qQfZmIrnZX+aAT4eoWGAofJnyXHJ6Hb3eMCPWe7kRPKtxyaLxh6HhUrDiO1QJUVwIjh9hvS3y08E7/3bqDLP7rGixfKZJ5qxC2FlYtDpJdSDO7JFW3JBQxlLCtc2jQr3I4E9hjSwbAg+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(136003)(396003)(346002)(39860400002)(186003)(2616005)(956004)(16576012)(6486002)(31686004)(44832011)(38100700002)(31696002)(54906003)(8676002)(8936002)(36756003)(5660300002)(478600001)(86362001)(4326008)(66556008)(6916009)(53546011)(26005)(2906002)(316002)(66476007)(4744005)(66946007)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WVRwZ3dObllMa2NoNzA0U29RN2JRMzZSS0VTSXNtdm13VnpVaytsS2lVdGNq?=
 =?utf-8?B?SUVlTk5SS1pMSzd0bDhCb0pjaVA4YmhnRUV0V3JVQUQrdnJGUnhENmt0ZTd1?=
 =?utf-8?B?OWYxM2RCbDhnNVR4b3dXa2x6a3g4Qk9uZ2hFYjJiMlFwNTZseWdITmpnbzd6?=
 =?utf-8?B?SUNFbVBqUDVHS3BXNElJNzdwWS9wRlg4VFNZZUFERUdiSmFmeTRSUHVpUzFy?=
 =?utf-8?B?dlp5NGVlN044WkpNTTI3ZjdvaHpxMmphdTVRcy9hdlFFMmtJTElVWVJUNjJr?=
 =?utf-8?B?cERWYVR5b1lTS3NhZndIQlo5Tmg4M2tYQnNRelNLREptZ0w3MGRMSGQxVUNx?=
 =?utf-8?B?S29oMldRWVpoSDJ0cW56OURrRlFxR1Fna0VLOUFSZjZjRFgyVEpJeWp0Q2Nv?=
 =?utf-8?B?cm5CWmtvTzc4akdRSEFTdWY1b2huaFNZd3Juelp3OWdPdm4zMTYwSTA3ZDJP?=
 =?utf-8?B?ZER4T3pVNUpGelorb3dhdFgxZjVFM3dvZ0ZhbTltUkJ6clMza1c3MXpDZzRl?=
 =?utf-8?B?ZWhkL0tzM3NVNERoTW02dzF3aStFUkJPUmRpVnFRZ3hRSWt6dm1pT0hCbTJD?=
 =?utf-8?B?bkxWUnRWMDRXZWhwbkxnZS9lWFByWjB2QjcxTzU0cDFGQUJFbkpvcjNheERP?=
 =?utf-8?B?YUNxdHlMUy9HQ2lQSmNSakhDbXBNa3lXT3lVTlpmRHdDVy9KWHlnc3dLT0U0?=
 =?utf-8?B?ZTlEQ0xJTk9lcFBrMVB4akdYZ3ZqU2FncmNLZnRSdEt5WjE5MlNqdWxzRHV3?=
 =?utf-8?B?dS96MHFrdnBxSVpzZW43clFHSm1XSHlhMGxESFhqTVhra2FyRU5DME1jdkl0?=
 =?utf-8?B?TGJUR0FhZ2RkRDRiSW1nS1ZFUlFjV21sNDNaUis5TE9CbitlaTY2WWFCamZP?=
 =?utf-8?B?c3hVUzhENkxlUkxYdm54UkF5bU5DbWh4NmwyOS93OXpicnRra0JpcWRKNmlW?=
 =?utf-8?B?OWRzVlhPa2JCSWZwdTltSERaVWc0ZkZhaXArajI3OEtJdlhHU0tQaUhoclFZ?=
 =?utf-8?B?c282TWFNK1N2RWdQMlRieHprbEpWcDYvczBDbHVuY0htL0wwTGozclk3TFpP?=
 =?utf-8?B?bjEwUmRCeW10QmsranUza3Ura1lGdUxpWGorelVVR2FoTG1MNDJ2a2JFdlpv?=
 =?utf-8?B?NmxWanJRRDBCNXR4VnpQUzV0bFl3Z3hUdlVNQjZkRmNIV1hCQk5uSzRnY0ZT?=
 =?utf-8?B?OXR1bm1vTVJvS2l6QU9maW9pREdhNjFUdnpkcVA0blBrVmtCbUs5MlR1SHRi?=
 =?utf-8?B?T0MzTFBNK2pMUUJTSlJWbDdoRGY0RjhkRmhxVmY0d3B2blBDWlZjdmQ3WmI5?=
 =?utf-8?B?bjBCdzVpcVo0b0tKRW9OWFk0VHZpeGFYNUltTHZPNWtrUk1EY0FENVFYdHJL?=
 =?utf-8?B?WmpndmQ1SWNQUHhuRjRHVytuL0RmUFZicnpUc0lwNTQ2Q2puTnJhaytLb1R6?=
 =?utf-8?B?SHduclVoNkt3WDVCUTgyRG9MWm1CdXFGeUhzWm1OZkJYV3U2UXg4azdzbjEx?=
 =?utf-8?B?bmJ0aVR1MXZKZHlDcS9WVlNLVTJpYUZsWGRCd1Myc0k3TUpZUXl2TTlFbmd4?=
 =?utf-8?B?VWFreDk1UStBLzBydFhjbElJS0FzUGFid2ovczFRbGYrTkg2cHFZQjVnL2hV?=
 =?utf-8?B?akdtZ0RnYktIMVNOMVhDUTBzU25aUnJVRXNWV0NSQnIzTTEzSzFGVnp3NHZV?=
 =?utf-8?B?ODBOMjdrYVFiTWcva3IzbHN1Q0JTSldyTWVBRElhMm9OS0x3cG42ZUE3bC9C?=
 =?utf-8?Q?QOSTEz3akJxhihGFE1fj0yzIu6rNJY2ujlKqplh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb807b4-6bee-4aba-8ad6-08d8fdcb6e84
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 15:55:44.8932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ovc/Dm6lxxE2zVpwt8Xk7nRy2FSjpsksM/WZeO+kWIyZeLUCZeEMOjaN1QY80Db3i57NRXjwdrcg+i/KRNSx3H1+hkGR7h87me2raE0k0GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4477
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9952 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120102
X-Proofpoint-GUID: CJND3bpLxCDtg1OxEDKVdF-foQJ0lTs2
X-Proofpoint-ORIG-GUID: CJND3bpLxCDtg1OxEDKVdF-foQJ0lTs2
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9952 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104120102


On 4/12/21 5:44 AM, Jan Beulich wrote:
>
>> It also looks a bit odd that adding a device is now viewed as a reconfiguration. It seems to me that xen_pcibk_setup_backend() and xen_pcibk_reconfigure() really should be merged --- initialization code for both looks pretty much the same.
> I thought the same, but didn't want to make more of a change than is
> needed to address the problem at hand. Plus of course there's still
> the possibility that someone may fix libxl, at which point the change
> here (and hence the merging) would become unnecessary.


Merging them would be a good thing regardless of fixing libxl. But I agree that it is separate from fixing the issue at hand.


Maybe rename the function? (I myself can't think of a good name).


-boris


