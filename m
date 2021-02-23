Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1F3230ED
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 19:46:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89066.167512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEchJ-00060y-R8; Tue, 23 Feb 2021 18:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89066.167512; Tue, 23 Feb 2021 18:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEchJ-000605-Nx; Tue, 23 Feb 2021 18:46:13 +0000
Received: by outflank-mailman (input) for mailman id 89066;
 Tue, 23 Feb 2021 18:46:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUnP=HZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lEchI-0005zF-BJ
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 18:46:12 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1800fa8f-bde4-46af-bec9-e24b124f7dce;
 Tue, 23 Feb 2021 18:46:11 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11NIiidF093054;
 Tue, 23 Feb 2021 18:46:07 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 36ugq3fak3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Feb 2021 18:46:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11NIQPu9115117;
 Tue, 23 Feb 2021 18:46:06 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3030.oracle.com with ESMTP id 36v9m4ytcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Feb 2021 18:46:06 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4195.namprd10.prod.outlook.com (2603:10b6:a03:201::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 18:46:04 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.031; Tue, 23 Feb 2021
 18:46:04 +0000
Received: from [10.74.102.180] (138.3.200.52) by
 CY4PR13CA0010.namprd13.prod.outlook.com (2603:10b6:903:32::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.9 via Frontend Transport; Tue, 23 Feb 2021 18:46:02 +0000
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
X-Inumbo-ID: 1800fa8f-bde4-46af-bec9-e24b124f7dce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=uVUiwQj9+9nxoo2rnj1fO9AMn0rm4aGzjApXlJYHX90=;
 b=glyOixaNXaGr+CvbkuANnB6LlyDwwF3BVRwHysyq7Dy55d1Vbl8OBXLjDZHcHeZcI3i/
 SEnczdSXZKu4C6V5/adjtu7Bh3yXq0QgPhE5+eX4VlFZi/eNwpRpvtJHYuP3F8FuwCZf
 CFr3/sjS458fhXRLxUjEOResA7q0+g/HZHPet4YJ1Xm6veHGo5vf1kf4LK2P/0IpYW1O
 uwiYKAZIid9BC2T1ZQo5cZTwvHh407mkOt5+Vx0wafwlTEXq0RjYbqfPTYPZctN1LjK0
 Ilue0e5A3lx3vc0rvjv8e5JHyKSt9MoYg+ZvyqOpAVyO4GkeNca3vGFzFjPFG9aUCVeE ow== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnEuNZwGfQrypvxNhE8XGluCWFPy+oxzf0bVY20kq1Fe5twDX7UJdSktaYl44L7bDqTWDD/hzoM80OMs1k4ToMIRh8yQ1wmpOSywvUyOSXUJqz8w8qTfcega2/Kp7npWplj6PaqjCUkowLYpCAgaTNkzcg2RsSagK1QdoIdbLrJK4uFTiP2oYiM+VcqYLo/4yrAXYfTIApfXO02aogKsyV+KHXXn/lYm1zZzPOT/ONn5GPl+wOwSuJagu47pXYRbwrWcBRWYoMEyvDOZPZIkdHDB+uYPaU8EYcczIPRLAThx+OaDmyuQror+gAVF0ZgVIQDgbySCZ+v0Pdf6qExeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVUiwQj9+9nxoo2rnj1fO9AMn0rm4aGzjApXlJYHX90=;
 b=XBcVpuXsL2TnK50S9H4LJEwJQ0Hfv8ttygdaK3hX6OMi5AdE3vXolLGNR60v0231YnVMoasUciEGF/Ws83GYFqY8/DqPF5dHlIrqJWZ5IbUFgC4VOIn3yiVIZ4nUh9X8U2hEnDotIBVWekNQpt+/0OAtr9RBWpBfVPrXbPN3FJ0lt+Mep3faABek2u0NSPc2jWvMHT6OR+5woUpOOBLVMQyEaUNwCkFEpBQSeZFO4B2g0daBmrMvZbQQDJd/4IxtDpgaVXYJTmTVujQLMJm8sTneVodf5qAiQ/dVDt2+3EFM4u9+XfIsfC+HqKAJMDe9qOUfAOH2SeupaWghykbJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVUiwQj9+9nxoo2rnj1fO9AMn0rm4aGzjApXlJYHX90=;
 b=kETts1EEBaC7IFZuVNQl87odVTNOf0i+FV3wVEDARo8eYVshmiyvTOf1QZxjfkT2Mt519b59hD5b1DoWrtiAdqq8G9RzFBXEY2beqO4iSuN3NGxWe0IWxORIXxhTzvQCBIFSl5HEyEdI7rMKqhE9Z3QaFaI+FtElUYvDOya2w9w=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
        xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
        anthony.perard@citrix.com, jun.nakajima@intel.com,
        kevin.tian@intel.com
References: <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
 <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
 <YDTMIW5vBe0IncVR@Air-de-Roger>
 <2744f277-06fb-e49f-2023-0ec6175259dd@suse.com>
 <YDTyScmud26aiaMi@Air-de-Roger>
 <172dfcab-9366-47f0-9c56-2202a8b7a7db@suse.com>
 <3ae19e76-2543-28f4-9c7f-697ccf9ed202@oracle.com>
 <YDUpF8gf6fbm4ouQ@Air-de-Roger>
 <a49b03dd-19c5-5df1-81a0-0d8d9e84156b@oracle.com>
 <YDVDNtd4n8zV7T6J@Air-de-Roger>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <e8b6c86a-339d-c89e-e087-ebe4ffd92e46@oracle.com>
Date: Tue, 23 Feb 2021 13:45:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <YDVDNtd4n8zV7T6J@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.52]
X-ClientProxiedBy: CY4PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:903:32::20) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f10ecc7-7160-4247-f0fc-08d8d82b45d6
X-MS-TrafficTypeDiagnostic: BY5PR10MB4195:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB41951F51BAABD81AD3622A578A809@BY5PR10MB4195.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yjo732jSadERdTi6Ob+ZsWVLresr5qRgX2xSY4W7MYoykajV6Ztltl2m1UTYAJWWtZs20rX0Q5mI+hzuLfNHnVLpi602tVBGk8kt/SsexTHjVwMmzBCGKKglQLC1w6pNs5GCZ7AdSZzxtYK3Z+Wr76XApRKcnFM6Ae1fbY9TpLoBQq4ln1Y3rjJf9Ly0/vC/jAgIzSYYB2j+5qtgz3Ssl1zhWy7aRLZ2nYhgOZsxtwsLx2pPOjPh4aXpBcdRUQ0QTKHoiTd+7K2r32J4PfxRdP6fUeEGy9bd4gUA5z92KtdJmCEQ/PIesxa9WyU/j+x+108vZ70biuLCAE4GLxnryQ6Asz4Z9LE6k6QP5yAoewcWgAey0JBRLUJM7NZfTwqVHPavpg8IPAW5H35GMMs/hBXiaZfn37F63aC+dY6UnFHX9+w+zT+fKRErQyBd6PSqVGbe0NqY2ZEAjlColmAC6zCiZwE4AjL+yWczQNlIxou/89tllY77Ir1yFxSSMTKUTNcds3hAJzqOnO7/cTB8OqhwEETwZNlHRIQ7nEN2VmQ0VxE9QXo1sG4yyv+pG0XK6KbI2imF247vmIBBDAx90dM4qJMneCvvP9O0yDkewx8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(376002)(366004)(346002)(5660300002)(66476007)(8936002)(956004)(66946007)(316002)(478600001)(36756003)(26005)(6666004)(31686004)(53546011)(8676002)(86362001)(6916009)(4326008)(16526019)(6486002)(16576012)(31696002)(2616005)(186003)(44832011)(66556008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RS9ibGJxQ0R3Y1RJSGFEVEdpVFRIU1p5dzNvTDdINTNWZ2ZaZU9QVFhldWJt?=
 =?utf-8?B?RU44bHFwWTk4SHBITlpkaTFTZEdYcWpQZEdUclp4QkJGVzBSRHZGVXdPbUU2?=
 =?utf-8?B?VFhEZ2x2UUdXaDJEWjVPU3BrMWNyeHo3MjBXNkV0d1BrS2FtMHY1VEM3Nlkx?=
 =?utf-8?B?L0hCUG8rNTczUUdRR01PRDlkM1RMNXZPNnZTV2kyZDZmM0ZMUkRnL05KWDVv?=
 =?utf-8?B?aU4rZ0hnV1p1MUppdCtzS1l5cUNrTUFwZWJFZWZBU1hCRFhTRU1GYUtDdnhD?=
 =?utf-8?B?QU84ZS90L1BBUkx1Mk5UNFUyMWlwK0tUOWFhZVpjUjR4YTYzSGpvZitvcXZ3?=
 =?utf-8?B?UHhONDJDbDNLV2VDNkRWZFpHTXV3Ymg3TXdEbFd2Y08vTDhHbGlHQytUbHFx?=
 =?utf-8?B?REhGT0gvZmcrMzN3eVJ3UUU4eW9sMkU1ZGN6blJsQW1GekpMUk5PMXRsUWNP?=
 =?utf-8?B?UlBzc2V4TGcrUDFXUEZ3eUt4cFB1TWQ2UWtDZGV0L2tKMjVHRno5Y1RVYlVV?=
 =?utf-8?B?STVkU2Z1N2VNSm0yQzYxSmg5NlhhRmw5UmdtNURIM0NhM0pkUENvMlZsZ0Jq?=
 =?utf-8?B?QWtsOUVhWlppT1FaYmhaV2czeWtVVGZNVE5IZkhqL3J1VkZldU5qa04wd0Mw?=
 =?utf-8?B?a1FYd05SbG56NGZaN1dDVERoWFozVFJUNENEek9qZS96UEZFZmt2VEZkZ2Fo?=
 =?utf-8?B?NzJOcHRzL2RXV1lUQ3hLbVFaL2hiRnk1S3p0SkdodExnenhDNHl3VHlabmdU?=
 =?utf-8?B?c0YxRUJoY1RBVjZZTVdKak5SRFNQUklHWTFlbjEzQVI2Q1pIZnlMY3lRVWhk?=
 =?utf-8?B?SlZCVGhIQ1NOSzNROVdDTmYwQXM2RnNiUHp4QVZ2RC9ac0FFVSt1WUxqZytw?=
 =?utf-8?B?NHVoMW9FaWh2MlkweGJwSk5rbjRMRE1yUi9uR21BRi83blB6VzY5b284a1VB?=
 =?utf-8?B?emlGNXpwcE0zSVNGRFRBTDd6WmtGYmZTN1NOM01jQS9jV3RKZk9rTy9lQSt1?=
 =?utf-8?B?cnRnbUdEOEZRSXk2YUYwUWtwMXFPQUJxeFpoT3JJcEQ0UmNPRXVFeVpFZ2lS?=
 =?utf-8?B?Z1haU0Q5bXp6ZU5iSHovMmhXUFNlZGZ6bDlWdS8reDRUUVp3cG00dUNmYis4?=
 =?utf-8?B?NFhwQ0IvVVlwcThMdVYvMVQzb3k2WjU0YzJZM0RvWTZWTFZGUmdqK1BGTFFp?=
 =?utf-8?B?ZHAvYk93eUZSYXdZNU1BK2J2T2JoSUFPSVJPbXM1YkVsQzFqSDlGUVhZOVgx?=
 =?utf-8?B?cGU4VG9IVDNCUloxNFFlU2FiZ0pNM2VqR0VJVExqQmNkTGt6RjYwcHlDRlRz?=
 =?utf-8?B?YjFSVTNIcFd4WXNXMDJnTkhlKzFFcEFMRGYyNjZKbTVlUXNTRWZDN0dKNGps?=
 =?utf-8?B?S25DdFp3SGtFNzg4MkFBOVloNnVobEJwellDdHI4R20rMlRNelJmeUkwSXlo?=
 =?utf-8?B?WFlLMGJmT2dGQzRxNnBuWHc2c3ErN3U2SEd3NGNsNlNzVTBNcy9Bbm0rbE9t?=
 =?utf-8?B?bGdxYVYvNmtaOFkwVjRWVlMrY1RrNWVuVmlIQU5VZXJFNXNyQVN3NUtVTXl3?=
 =?utf-8?B?Qkw1dDk3ZGFwczIyakFvMTZsY1J5YkhzQU9MN2VRUWtxSmJSL0psQ2xReS9j?=
 =?utf-8?B?VHdZZ2dYekVZSkM3Ni82bzNiT1h4UmJwWTB3RDZLUDRoL0NqWDFCMUg2N0dp?=
 =?utf-8?B?NTRIR0QwZkx6RThZZC9nS0NrZ1RsSUcxbi85SW14WmtRTHB1T2VzRDkvUy9y?=
 =?utf-8?Q?dPZY0IqWgRnUO+AWh4lUeU1gMns8KQ0JdFstKrW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f10ecc7-7160-4247-f0fc-08d8d82b45d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 18:46:04.2381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iURhayGs6GlNU/x6SIywp8Zid4C6DAO9icLELO5UWUOXlFsxIzP1XOIXTJteVsQWy/CviqwhENjBF3IuER73ryNUbXdlFprRLelgA/8RLVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4195
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9904 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230154
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9904 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230155


On 2/23/21 1:02 PM, Roger Pau Monné wrote:
> On Tue, Feb 23, 2021 at 11:40:07AM -0500, Boris Ostrovsky wrote:
>> On 2/23/21 11:11 AM, Roger Pau Monné wrote:
>>> On Tue, Feb 23, 2021 at 10:39:48AM -0500, Boris Ostrovsky wrote:
>>>
>>>> Before I do that though --- what was the conclusion on verbosity control?
>>> Ideally I would like to find a way to have a more generic interface to
>>> change verbosity level on a per-guest basis, but I haven't looked at
>>> all about how to do that, neither I think it would be acceptable to
>>> put that burden on you.
>>>
>>> Maybe we could introduce another flag to set whether ignored MSRs
>>> should be logged, as that would be easier to implement?
>>
>> Probably.
>>
>>
>>     msr_ignore=["verbose=<bool>", "<range>", "range>", ...]
> I think just adding a new option will be easier to parse in xl rather
> than placing it in the list of MSR ranges:
>
> msr_ignore=["<range>", "range>", ...]
> msr_ignore_verbose=<boolean>
>
> Seems easier to implement IMO.


I haven't looked at what parsing support is available in xl. If I don't find anything useful (and I give up quickly ;-) ) I can use separate options.



-boris


