Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731735CACC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 18:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109354.208765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVz5B-0002Xl-It; Mon, 12 Apr 2021 16:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109354.208765; Mon, 12 Apr 2021 16:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVz5B-0002XM-Fa; Mon, 12 Apr 2021 16:06:37 +0000
Received: by outflank-mailman (input) for mailman id 109354;
 Mon, 12 Apr 2021 16:06:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HoLK=JJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lVz5A-0002XH-7s
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 16:06:36 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0dda69a-2737-414b-9226-9366dcee0bf0;
 Mon, 12 Apr 2021 16:06:35 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13CFteb8192445;
 Mon, 12 Apr 2021 16:06:34 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 37u1hbcbm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 16:06:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13CFuIp9146298;
 Mon, 12 Apr 2021 16:06:33 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by userp3030.oracle.com with ESMTP id 37unxvk933-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 16:06:33 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Mon, 12 Apr
 2021 16:06:03 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 16:06:03 +0000
Received: from [10.74.101.110] (138.3.201.46) by
 SA9PR13CA0060.namprd13.prod.outlook.com (2603:10b6:806:22::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Mon, 12 Apr 2021 16:06:02 +0000
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
X-Inumbo-ID: b0dda69a-2737-414b-9226-9366dcee0bf0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ezO9lxcEYeQ417PQsi1opsbAwOPW7jGBct78DrLEOVY=;
 b=ql7emlPW+lVUgjuitBZ/1vcGDUj/b/K/vU7+7/rX1q90lAsV+NuH2KWZ+O4py+hvSkQh
 FkglclN5HvnXms4VzY3RBO7AErq1JB5RjRZ2zeCw4DRdTrjdUbCpFEPHy0pNDdgdkC2G
 kyNRSUfrcCiiG0apERCCrh2YfceUeA4ZGp25B0wj1v7dRTwhFN57B5fWr4aVNAI6KBKx
 6kGIUzaBCeHjwnI3hsYTkZVW0+KP56Pitl9o4CJC67kpUnfNxNLXTS2FehFcS42ayOb2
 S+VPFq+98FOvBbQS17VuzqBHWsUwLwm+pXnBKHoDA9uX2IYzKezVdVgPMeofzBSttHzh lw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcXosOZ8Qr828w9y5V7z7FQT+ATTDDayUCpl2aryeq482kyafYgEEDF/1Ga7xx+xSL7EjXVhHQj5A28VdTx6T+kkBAQwyNxEVBDtrXV/rshIwFUxALiUydBbecnIbpWgq5YETF47o3dLkd0UrvWHnFgT0ypiBbfsCwS463hyoRmwM5Syv2+2PRkcvc+1c4ZD0trUE8CC7trOQHzaLNiLXGdst4drBD6gW+VBBZMHIrY25/1vuqJLbLnem9JBy/T9nHnY7ZIH0MImFHtgoDeKq/jXnmAIKVHFLUAN0iqOpi49eWo1OxRFs5Xm9WKTUVI6KYKrbzacj7ey2O5rJ4q2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezO9lxcEYeQ417PQsi1opsbAwOPW7jGBct78DrLEOVY=;
 b=m9jOMw+DEseduba9TXGW+zrABSDecSerOIkLBJ0uUbB3looTb9nJ77dcqzEJSoavDaptcoDhWxe9F4lJIpD1ydrf1Hm9YJuzgV4UnPazlzSyzohMR6yrObJwC4FS90kBgc6BExukPbIolGW1We2o94cZM18GopCDkSB5nbz+VVIg0QX2Mx3jxBvLjFYp1GurtdzJOD9xJiC5wnxJXxLDG3JaUzvVqRHEpojsGOPdRkdyWU4oyXW3npJlTUgUw77b8TkwCFMpaCbVB4sMVYy66WL1ojj67S2MHr8JoOuj6GZbT+rbmDs9Ek8Pp9XuAm67lhe0ZiWdN7jHAFt68bATSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezO9lxcEYeQ417PQsi1opsbAwOPW7jGBct78DrLEOVY=;
 b=CsJIBG8bjiA615f35KQ+Z74UhGI0W6q9D7YLHUQPJGKEfWO6xK+g2sCcrQO1c3JnoyBesmA3oHlRUs43nKymKBLsZfsIvWQx4KmqjmD+HNTngXD8RnBZgXPZeJZqCCKxndoRYw71IttQ5fTT/4hTVKSPY92ai1GpP4nf72GkuAE=
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
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <037a8fc2-2c69-2049-8826-32181b8aec2d@oracle.com>
Date: Mon, 12 Apr 2021 12:05:59 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <ea274ffe-4eee-9fa5-b5d1-e8528b112227@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.46]
X-ClientProxiedBy: SA9PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:806:22::35) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4603781b-4a8a-45d4-ae75-08d8fdccdf37
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB42424F1EC0C6A54AD47CBC628A709@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1Eg+TCE0pD82sFoZMjzRcu/0zjSyPuWgNRcDeeoZPKFgGDrIzBYGGam0RDvewMeznGFuFzDjoXbQDh4DKGqh+eAxKBScrhf4dvQ1Al06TIZ5U4fM6mW/+ua17aOFp48vr/AJWIbR0gxpukdXrYQ+ki06SccA5koghqEKeZWtXk1QnoxzRn/MqL46AoPNchjWiQFkNUXdR7w/042v0K/U8NEyCFHoUYyf5r6BFNstTWtdMKz8h1cH+uGORJIxgr6iBDiiTUd4ol1r6tnVBc5nljyBEKPvIoHL8XHanl9MVg5Xm5Z5pQjKEzJCbNfeZKYTCZ7u4/F2jNHl0efBeUrScptSt2e6HZMYcPEd4P7LXNry0Q1o+csTnYg8MPOgAwgTAJBSCvH2ICvijEhpKvRbqk/Gt0aJs4ReUnS92l8Yej2/MnxBIA6dNUH0rRtxX7TZEpfrw6c1u8yCQ82VwCOCj0RRn/yHWodMjXmZFEexAv/sTNAnymsP/uvtdbQoGgytC7SQrbkCxzHC2gZQcrd4+rfTaFVZ/rVoJeNuhy9KLeYMPORgp3NbIy8gDdQZ+Hgla75VQWH4Yqu9KaZcvXs3qIZHs87YRPVU0sfoUfNTTcbqCKWngWwMVfoZ2enu+snRwpG50U0pVa+zdFtU9JieCGt6c+sZ8zW7g7wfslT4rtiB+V5ItsJvZjc5vCfLbGiW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(346002)(366004)(39860400002)(956004)(2906002)(186003)(83380400001)(4326008)(16576012)(66946007)(316002)(6916009)(6486002)(54906003)(2616005)(53546011)(26005)(31696002)(44832011)(478600001)(66556008)(38100700002)(8936002)(6666004)(8676002)(36756003)(66476007)(31686004)(16526019)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bDFmbCtxWW5UcSt2bjFoVmMyU3FpN25TbFcxZjI5UHBYcEtwQmpmSkExMXg4?=
 =?utf-8?B?SG1iTjBVdWVOZEo1SmFvY205TWZwS0FGY0k3cW90NTRCbUZlQmQ2ZVlNLzQ0?=
 =?utf-8?B?UlpzeU0zY0NRYjJWR2c4SDgxSzF6UGJvVHJoVVp2UzZzOW00bFVncG9uMitF?=
 =?utf-8?B?ZHNDL3Y5SlBNM3ZINWlQSkgwT20yU1lCWEZIV3l3Z1ZQditOaTBNa2hQK0Nj?=
 =?utf-8?B?ZXlGSGhHbHIrMlBTVy9IcVVnNXBLMjEzMUZnUllraTNlZmxYSHdkemZVY1Jn?=
 =?utf-8?B?M2p1dnpON1lJaS9wVUdGdlY3RzBub1MrRUNGc1Y4bDJSWkNHMWROTm5RTWhF?=
 =?utf-8?B?YUF3bmJ1cW1rd2l5TjQ4WFYrYllpcndNSGR3UmVjY0ovZ05TcVpoWER1Vkhv?=
 =?utf-8?B?Z3JYaGVTTmlJME5DOVlHWVJ4UFgvUDl0RndOMXhlZ2huYmVQaWFpc3hmQ21R?=
 =?utf-8?B?RHVLcks3dHNHNzhqdFcwUFJINEc1eXFranRXYzBYNFp2YVhYd2ttVTFaUytQ?=
 =?utf-8?B?VkJENVFCRXBUWkh1VGp1dTVZNXA3djF3QWVBWlgySzVTQ1ZIeUhYdUZkQitQ?=
 =?utf-8?B?N05oY2ovNEJUVW95M1JRUm05RHIxZUxSL2JXall1WUk5Z3Y2QlNCTFJKUkVQ?=
 =?utf-8?B?YWNnNytnNXBReG4yWTBoekVJTmZkU2N1UDUzeXJxK01aSUxkV1hkUE5PeDJQ?=
 =?utf-8?B?S3I4aW5pUUJRYi84ZFc4UkhaVkptNHFtTThWQy81Z0VUUjBGZlgxQ0RwMHJz?=
 =?utf-8?B?OVZFMTZGcTd5Q0Zob0xtTW9Ca0NVYTNjMjR0TU9iaVk5L2VtTTBrd3BHQmtu?=
 =?utf-8?B?RHN4bThHL2JRWWxybXAxV3FXNC83VHhkaFR3OU5sMFRlYnBwd3BOajFNb3Rl?=
 =?utf-8?B?eURRZXMvSjd3eFRTa0tDZWFEWjF2RTU0NGtNRDhHczVsUTRRYm1TMnJtMFIv?=
 =?utf-8?B?bW9tdVNOdG1vMEhTVERBZGVuTEZyV3VXQ0VsdktNa2RLMER2emY2dURObDJF?=
 =?utf-8?B?UzJlTmlxaGlUNmd2VHVtYk1GWlozUUFqbVl4NUM2S2FRbW9hZ3pIaGNOZ3VB?=
 =?utf-8?B?Q1lHam05YmlXZStaVUJnSnU1SklGZHRxcVpINnFtcDhmbzZTbmJxZ2pGQmdE?=
 =?utf-8?B?b09ZRmUvQ2pwRWVxRktIMWxxL1hOM3MrVHVXaldSZjh0RGlFZzBtbllDYi9S?=
 =?utf-8?B?VzdaS0NsOS9zMzB2UlB6OTdZaDducFZWQm1YemhxejBjNDllSVlLbDk4N1ZJ?=
 =?utf-8?B?NDNuY1pnZWZ3eEdqeVZPVHhzeFNqSXh4M3FxOVBlRXJhZ05maGlwVlVkbllG?=
 =?utf-8?B?WTRWYmNmYlhiWlIzeEphU3MzczZWZ2ZjalplTmtDNGZvbjFyNGg3SndaZ3hj?=
 =?utf-8?B?VGgxa2dzaHRYTVQ3eUYwQ25XY3J0Y1pMK09yeDhtZzVGb1gyU0dFVFZQQVBQ?=
 =?utf-8?B?TlZpclBHa2RTSDh5TW96UGVEZ0NzbFVRTG1qTVFaVGQydzlsb1J5bnc0TjZ6?=
 =?utf-8?B?SEFPWk5GTjlvdUZnZmlZV1RwZUd3NlVpMGVmWExrWnpTSEdvaE5XaXBMQnk2?=
 =?utf-8?B?dGNDQndTTitZNG9UTjgxVVZmODF3VlNzN0NhUk02V1V0WVNBUStUWFF2dVZ4?=
 =?utf-8?B?TitxeDc3bnRCNU9lckpRZXZVWDFMZ29yRCtja3p5ZzBGd0d3S2tvcGN3SitL?=
 =?utf-8?B?MVNMckM1T0lhR0g3bmthdTljR1drVVBWNWk0VmJVbW1LTW5zdkVhRnF4Yy91?=
 =?utf-8?Q?o4T27AQd1HjjKRgjiO4pwQK87MhEWRNEq6bqFLb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4603781b-4a8a-45d4-ae75-08d8fdccdf37
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 16:06:03.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8GbNStNsWHMQqWxLBUBZ1nOW7HPPRjd6wTaKM7VAscttx23i0Nfp8U9kR03X2E0Sq6SmG9tBlCW2cnO9HJajdzPWP+2uSGoHnNZrh4ZFzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9952 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104120102
X-Proofpoint-GUID: rkMSfBudUTVL0hkqXOoEN9OKquzTgdrN
X-Proofpoint-ORIG-GUID: rkMSfBudUTVL0hkqXOoEN9OKquzTgdrN
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9952 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104120102


On 4/12/21 5:50 AM, Jan Beulich wrote:
> On 09.04.2021 23:45, Boris Ostrovsky wrote:
>> On 4/7/21 10:37 AM, Jan Beulich wrote:
>>> There's no point in comparing SBDF - we can simply compare the struct
>>> pci_dev pointers. If they weren't the same for a given device, we'd have
>>> bigger problems from having stored a stale pointer.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Thanks. As the 1st patch of this series still looks to have an unclear
> disposition (unless not getting back a reply on my responses to your
> comments means silent agreement),


TBH I have been struggling with understanding both the original problem (just like you have) and the solution you are proposing (apart from making dev_list[] more compact).


>  I can't predict yet when I'd be able
> to submit v2. Hence I'd like to point out that this patch is
> independent of the former two, and hence would need to wait further if
> you wanted to apply it. After all this one (unlike the other two) is
> merely cleanup, and hence would rather want to go in during a merge
> window.


Given that next Sunday may be when 5.12 is released I think everything but stoppers will have to wait for the merge window.


-boris


