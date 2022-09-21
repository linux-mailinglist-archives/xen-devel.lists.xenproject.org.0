Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AC5E54B6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 22:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409900.652908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob6c4-0005mD-OU; Wed, 21 Sep 2022 20:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409900.652908; Wed, 21 Sep 2022 20:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob6c4-0005jX-Lk; Wed, 21 Sep 2022 20:46:32 +0000
Received: by outflank-mailman (input) for mailman id 409900;
 Wed, 21 Sep 2022 20:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulJw=ZY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ob6c3-0005jR-DR
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 20:46:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 766cf24d-39ee-11ed-9647-05401a9f4f97;
 Wed, 21 Sep 2022 22:46:27 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Wed, 21 Sep
 2022 20:46:24 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 20:46:24 +0000
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
X-Inumbo-ID: 766cf24d-39ee-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsuEVRilTK7K86vxne0bcNlGXEsRex+NzDYNodySUVnjxsC8hfeWFPBbKBrlLMCizgSCO58cDCBwzgdyqj19iCxC0uvETyFVovyOBjiyItsCZY1NGpso/kq9t7fxLceHJemotdAcpR+/FyFvl6cURp0kOZkGxQ1/9y99TEEzhu/IWz2pCeTNCfOBj7cLHDvUBOUNyQM58fVliVq9WNVPMGE7LeRWbYVTeC6Fe/rjqMPBTYUDahTHF6gUuH++quBuJw202g/6utlNdi2gFoaKNsRo6YqYXbndHk320z9Zn/QMR25wfV6s/1BbqkHKvcb+Uk6zUZF0qzw9e9HqsKBpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynD5V0QXs3XnkGQ59qhCXXhfQJjPgt9lQ5Vxfq17bS0=;
 b=XqNOS1HjHgO9Kyj6KF2Ui6WyMERdhlXxeDkLK3YRq8RmdW8FqPhf+3ahotgyJ6/C7S3kaeWu4xK0Tdl6KYedTPEqfJkDonvw8Pa+doRd5+eiwSKtpPVrYCPa/e41wfSzphW4ksembwK9NuDlc/hEtYWVPMiz4RbJ+XRqzg8J6iaxuuE/X0svBC6OGQymRy5biU0sxiM7wwWiV+BFV0EXL0EL65H0KZKpL/HZLmUVzV6CgZOeruXmYiiETMSvfErm6ceopcdUt8GLWAPnW3U8Y4DaUw9ACilHd5CKr1GyzY3YCL4KslPhzokUgUQtgWCF2tnbBTAPISyixbBeHRhZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynD5V0QXs3XnkGQ59qhCXXhfQJjPgt9lQ5Vxfq17bS0=;
 b=jpKhVCN4ifz3SIjZO9tWHSBWNLE4upYlwbNwoBf/WOpFctyXB4giyvEpG7HjT9RjT/LOBD038v5R5PvjCE/RixvF1dLuRSFzhYKJd7+CEMZ76ayioRGgfJ8ufloChYsktRchL5k871/yLuMK8HTDALQZG/ClALPOz9qS4YaWGn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9d86a231-7051-423c-457e-86286c37a6be@amd.com>
Date: Wed, 21 Sep 2022 21:46:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: "Helping newcomers to step in to Xen project"
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0449.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::29) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d0d3120-caf7-42aa-de3b-08da9c12591a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/R4myjzpDKoqqdDIQKktnKxZURAjacFCB+qW+jBSBAC196wxG6uIqsK+Wm+ztQI/gjiErikvPv8GLHgHQJGYwCg3XVkZaBD+PktZ0TDisZD8vEKvF2r6LSvKLKZVQAj1lo+VH7qVi+uOXIqA8G9RkoewRKEqTuRtK30wvbPR9HEyCAF6eS0b9Ym/TCsGK9L6mHZy640V0rUjzP7Hpkcm+mcYUGTidtMo1WIdBMOUFkOeiOLx9Kh13OQKfHMCdTFOaSt/bhIWRMkXylx3R8aqPM+2hDsaNGxVZq4Y4gcNY9yf0iK4NyIr7lRz4fL5v1qc+9WQfhXrd3AYAH0VEr8Cz2244nwS5D12745n/4HBKS1MAFinhEAZ6HqXfXi3T5FbSUkB+3aYO5aVW0SSg+S+M9f3LS3BqaK+W2xPXFj20cUc/qIF0eUvzCrzTCiE1EeD0R8cwvGZTvUtm7RbL7shYPr7CnEOLt3pUwbjGeiOHn9OZZl6lff1gH9JV2GeamP4HyfjvIl65P4YtRElWQTWxv/o2DVjGQuvrLBjB2YnpZcQ+nbhth83Q1O9IhpwU+wPsSA9TFAXVT9nuDFIcjIXVIbAdBvOIb9TSZQBrG7QEExW/W9/NEjNdnhICmZIrCoD4bWhZ0uHN7M1RrPLXCcpnIDMwh0oB27JAuj93Sh0kwqE1UeOLqvMO6SSqyjvpRHb8ScRpApoiO6KYNuN8tPRvXemKjmDgVM/9G+tix7IIEzp3V3MXUt/kLEPb7MpqnTQdRTbsveWt6RJkKDYnrYsRgBzG6rsMQKVrCppi40PEftZQUAwjahHA5UAfW7BvBqqhohayMJOB0o3b2z6z+UkcD7Ys4pEZ1AyryybqkTsmbNnFbUV6oBgUaEbAVmBjb/mk2LtKIjeklPJoC4/5Bceiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(6512007)(41300700001)(31696002)(5660300002)(31686004)(8936002)(6916009)(2906002)(66556008)(66946007)(66476007)(8676002)(36756003)(186003)(316002)(38100700002)(83380400001)(6666004)(6506007)(26005)(478600001)(2616005)(6486002)(222603001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UThFNXZOTFdaKys0VXlKSXl3ZmtTSDNqdWRWNEdzN3k0WDk3cFJJNVpQTFNH?=
 =?utf-8?B?WkRlcGhlRVFtWmsyT0hxZ3ZjdmlOL2IvMHAxYjNTZnBUUkVhcG51d2ZXdXds?=
 =?utf-8?B?c1dyb2ozMGRmL1hlTXV2N2JuZEdJTUJWQzJTaERvb1I2QWFFSFdMcDl0a3Jj?=
 =?utf-8?B?L2Z2OXBvNERkcjdVUVhleGwwcy9TZDZ5WWJORExFQ0FSSFhuZWU5aEsxMWdN?=
 =?utf-8?B?aVZUVXZwMkNPbEpuUURRQWdwalhoNGlFNm1VVkY5ZGUwMndUcnB0SlFUS1pa?=
 =?utf-8?B?bjBqNFJSZ1F6OFJXWEZyR0ozUkhBbmtpamxKUTE0QkpwQUNTWGZ2eW5Zc3RB?=
 =?utf-8?B?UTVCSjlSRDJHNGtKQ0RYRlpWaTZSZUxQeS9vSVB4d0N0Y1FSZDR3ZjRrWjdm?=
 =?utf-8?B?cWx0WmNGeTdCSnJOY1RzVFdRZE5GSHJjMlRySnZPWUNSNWN6MmRQR2Y2YXN1?=
 =?utf-8?B?Vmt6a3dxUVFYS09VdGthMS93TllYa0c3Mmd6MG5pUXA5SHBTeG0xVnVIeis2?=
 =?utf-8?B?M3Z5dXFtOFlzeDZ3bFhXV290S2ozenJjeG5rZy9oNGJVUy80TmljTnd1aU1Y?=
 =?utf-8?B?Tzg2WTF3cTJabllZWHc3bElQSDUra2llamFVMk01U1h5R29RS3B5amQ5Mm1k?=
 =?utf-8?B?di9Va1UyZGFmRW1JdXdSc1dDeDh1ZlpqSjRMczN0eU9PVFhaN0hJSjJKc00y?=
 =?utf-8?B?R2s0ZEhubUxzV1NHdEM5eFN0NEFxQ0JUemNzRUtUQU9VSm9LYXhkOGVlN3VM?=
 =?utf-8?B?TkZrWmZaaHFiZXRFSVNBQ3hWZWpZM0lMaG1zamVSeFFHR2NGWDM3RVowQ3dE?=
 =?utf-8?B?YWxVY2wwUUprZGZJYWZQWERwUmFPd0s4bXU3aVQrZmlQNmUzVk1iY1puQ0Qv?=
 =?utf-8?B?djBTYXkybzMzRXlXZEpSSlkzYlVmd1UyMFRJZmt5bXkwSDZuQUZhZnBBeTB3?=
 =?utf-8?B?NDZVU1JCNmFqSGZSQXVBQzh3SnZkOWhlN2htWm8wTlhqUElhdXgwbHBvNHZ2?=
 =?utf-8?B?aHBTZ0tIcTVHejRmWHJ2Q3hUNSszYjlsM043YWIyMEg2Zko3eVlsQmlGcG5M?=
 =?utf-8?B?OFhlY2RoRjJhcExGcE5tVzhkZkJoTXJRNC9nOTBUcVhydWpxaUQ0N3I1aVRw?=
 =?utf-8?B?QUpyU0o2NHhnQXdwUzg4TVAyTnoyYVY1eSs5VUdXbzV3T2pEUE03bHdrRGZr?=
 =?utf-8?B?ODY5RHEvdHFncmllODNOUEVuZk5GT1BiY0hxQmd3Y1kvVkFkNVBjREVJWWNJ?=
 =?utf-8?B?QU0yMU5GSWIycVJHbllFOFdnQVBibEJCR2hFMURaRUZDMTdEK2JCQ2JTZEdr?=
 =?utf-8?B?a2dIM2NzYUN0NTZLU2ptdjY3aGtkQXZYdEJHZEdpckRJNmNtK3Z0d1JkUTZ4?=
 =?utf-8?B?d3VHWVFhNFZjdDZYOGFSaDI1bFY2VXBZWmlvcWtTUnYrWmZVMzFiMnVLQ2RG?=
 =?utf-8?B?YXl1cEhrNEVTZENRWU9PWGZEdzlkRUc4Uy9KMERrUHZaQ2s3TDJJZWlZY0lt?=
 =?utf-8?B?cFJ2TjlacG43Wkl1ODNiRUc0eXlabldUbFhwWjVpTkN4YUMrOFJMN3ZpY2pl?=
 =?utf-8?B?N2F2OW1pQk9UcnRlOVN5V0RRdzZHZGpnRG12KzZGQ01LMmd3TlN4R2RDckFp?=
 =?utf-8?B?c05mRE13T0R6L0VmWXRzelVsOWJ3V3JrK3ZIK3lyMHBtcWZWMXpZYm44UklC?=
 =?utf-8?B?emphWWsrK00xZmFpZ0pTQS9Nd2N4WVMydFYxZ1JZOWZPRmxSRzdIQ1hTcmRw?=
 =?utf-8?B?clBUODlFRVBBUjN3UUcxb1VFRy9NdnBoOUc0SzFzWHpueVpScytGRnU5Rnpa?=
 =?utf-8?B?NXU3WDZCUWQza0ZDMXJJZDB2L1NhaUErd1M0QWFKSzhFYWVKUmtNL3hqM2R5?=
 =?utf-8?B?YzBWUG1qeUhFYXc0KzlNM1VhQ3BZcU5zUlFzNSt3ZDgzaEJhcnZvYWRhSzVO?=
 =?utf-8?B?YkFJd3dzcTJNOXF3SXY3T3dvUDBUeWxjUThha1l5MnVTZ0ZVR09PUUxMNWpx?=
 =?utf-8?B?dDd4dHZLNkNhRDNBNDJIeDFpcHh1L1lDS05jT2ZNeWVGODZ4Tys3TS9JOGgx?=
 =?utf-8?B?OUYrTDdKT0xvVTZDb280WnV3ZWRuS1hnczhGTEFuQ0pFR1Rqd01tNzc4V2RY?=
 =?utf-8?Q?7OoEWacwmFdGAvvFY9+PbPUQ8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0d3120-caf7-42aa-de3b-08da9c12591a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 20:46:24.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbwlPb1btdiuncb4UH84HhFYog61Wb1STnUM3CTsxu3NumRfHh1WSBD5TBskQrG4PjEaTFTieEdJI7gD0OU3sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968

Hi All,

The meeting notes are as follows. Please feel free to correct anything.


Yann - Collect ideas from people to improve things for newconmers

Bertrand :- Is the wiki OK/not OK ? It is page to document things for 
new comers. However, it is not updated regularly. Also limited people 
can modify wiki. The wiki is not documented enough.

Anthony - People can ask on IRC

XXX - Different instructions on Wiki on how to get write access for Wiki.

Yann - Is the wiki the best place to keep the information ?

Bertrand - There is a doc inside git which needs to be in sync with 
code. The other doc is about how to set up Xen. We lack documentation 
for this. If you compare it to other distros. We need more people to 
write documentation. The current information is stale. How can have a 
better visibility for docs on google ?

XXX - What google looks for keywords. It is done by SEO.

Bertrand - In wiki, you can add flags to add subjects. One might be able 
to extract documentation from Xen codebase.

Yann -  Should we have captcha for Wiki to avoid spamming by bots ?

Bertrand - Even with captcha, Bots can generate spam information.

Yann - This means we should move doc to git repository.

Bertrand - Documentation on command line infiormation is there in Xen. 
But we lack information about Xen (how to set up)

Yann - Doc should explain the evolution of code. We need documentation 
for users. Which version of Xen supports what features ?

Ayan - Release notes should document this

Yann/Bert/Anthony - There is not sufficient documentation available.

XXX - Wiki should also be used for collaboration for on going development.

XXX - Otherwise, we need to go through the mailing list.

Bertrand - We need to organise wiki in a better way.

Yann - The wiki for documentation needs to have correct info. So it 
should go through a review.

XXX - Where can I find information related to virtio (a specific feature) ?

Bertrand - Issue tracker (Gitlab epics) can provide the answer.

Edwin - How does a new user create issue vs protect gitlab epics from 
spamming . This is account restricted.

XXX - There  are multiple repositories. (Gitlab. GitHub, etc). How do we 
know where the main repo lies ?

Bertrand - There are multiple downstream forks of Xen. Google may throw 
up any any

Edwin - There should be information in code where canonical repo is.

XXX - Move wiki to GitHub or gitlab.

Yann - Gitlab protects against spams. So moving wiki to Github makes 
sense. Once a page is imported in GitHub, then the other wiki pages can 
be redirected.

XXX - Wiki cannot be modified by non member of project.

Bertrand - I doubt there are lot of people who want to contribute to wiki.

XXX - Can we somehow track the good ideas discussed here ? There should 
be a difference between technical doc (on GitHub) or non technical doc 
for users (on Wiki). This can be discussed on community call.

Bertrand - We need links in wiki to point to autogenerated documentation.

Olivier - We could get historical information from the proposed new 
wiki. I could bootstrap and get more technical person to write specific 
stuff.

Bertrand - If you find an incorrect info on wiki, send it on xen-devel 
mailing list. We did write on some wiki pages that the information is 
out of date.

Olivier - Ask contractors from linux foundation to do redirection from 
old wiki pages.

Anthony - The wiki page is not managed by linux foundation.

Bertrand - Do not expect mantainers to do the porting of pages. They can 
help. And we need consensus.

XXX - There is a wiki linux Foundation org.

Bertrand - Moving pages to git repo, the issue is that formatting is a 
nightmare. Also, how do we sanity check the documentation

Olivier - Need how to guides (eg Xen on RPI). Create pages explaining 
Xen project (history, architecture). How to install ? How to use (eg 
distros) ? Keep it separate from technical documentation. George might 
help us with people.
Start with a small article and then populate it with more how to pages ?
We should centralise the information somewhere.

Bertrand - We should avoid duplicating contents from Xen project into 
new wiki.

Olivier - Need to track this item about improving the document, just 
like any other technical item.

XXX - Create an issue to document things. Also need to push for motivation.

Olivier - For technical doc, where do we start ?

XXX - We could not get the information about memory allocation flags.  
We need to add documentation to APIs.

Bertrand - The documentation should be in code. There was no consensus 
on that.

XXX - Also the documentation has different formats.

Bertrand - For some part of code, we make sure someone modifying the 
code is also updating the corresponding doc. It is not true for all the 
code.

XXX - It is not clear whether to write a design doc or not.

Bertrand - Sending a design doc to the mailing list is very useful. So 
we do not go into wrong direction. We should not commit design doc in 
code. Always send design doc to mailing list.

Kind regards,

Ayan


