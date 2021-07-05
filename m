Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF53BBD78
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 15:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150236.277803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Oda-0003QX-Vr; Mon, 05 Jul 2021 13:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150236.277803; Mon, 05 Jul 2021 13:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Oda-0003Ne-Sf; Mon, 05 Jul 2021 13:27:50 +0000
Received: by outflank-mailman (input) for mailman id 150236;
 Mon, 05 Jul 2021 13:27:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0OdZ-0003NY-IB
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 13:27:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9e78f3d-dd94-11eb-8447-12813bfff9fa;
 Mon, 05 Jul 2021 13:27:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-499YalOrPQ-rkeCLPAOdPw-1; Mon, 05 Jul 2021 15:27:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 13:27:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 13:27:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.7 via Frontend Transport; Mon, 5 Jul 2021 13:27:44 +0000
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
X-Inumbo-ID: c9e78f3d-dd94-11eb-8447-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625491667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=939AxuXfUc0ZT1z5aa83QMnJmEUYqVh8xwUj24UtEBY=;
	b=KkuVXeKC1dJENSCNap5gibITeY73RlOy3BuQbX7Is6WiLLrWYp5BA89VIHOCteWTNAkWr9
	YkJ8FUIgBSh+cZ9gpROZVntDON8tAl8G6FrkjsGJ+c655tWrnbdbe/NTOIlceI70vBuLU8
	NqvVBHVcO17PMXakhfP9jDaNqjXFNXk=
X-MC-Unique: 499YalOrPQ-rkeCLPAOdPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ1ihyEu+UdZz1HNSCeAWHGkzfYaZ5JWnqlVK9OQzAbd/0ILeVYNlD8L2NE9/XnelzE2ETCz/9ZF067g0XjH7da8wfDLCUAxGdQQdtx2cMagkGsUQd7l7BD4RA25nXCzzLfpsqD8W6IUjPbaPTBqsxgo4SeDoguxvzdz6sHUVbXSxRMmYcHxga9lrHA445mXgsxcW1shj1DkH0rUKoPjolH5DVljYtLL4AaDWRBUyQk1ntoSNIRaufOGL/3J9hifEQxLt1xLrGTJ+7jiIPcG3vpgxStVsyaWcL7mIk5WtJyhGQW3PvG5jJPuJq2vXElDqkZZ6oplMJqWrXW0Exv59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWoF8aiZEbpglervymjEM+ZZuYboLoVnQro25M1uzv0=;
 b=bomzAUmqmCHnyfb6+MPjLEtn5DvAo7qLHPmOuJessBuBmMa1lUV/KVLOMunwzcWE2tnl4ghr9g5T9R2ykHU809dR1Fy3Sr606moTUgu8+cjX5DsaPGoMI9AVc/Ty57yJTzVybmx+WKHwtkrclzzQa+dKMjRiHvcrdVkpFp9iKngLMkmqwGHBaAkCnREystx/osvSnTuSLRPFn3oqWBSzGuZvFzQhSzSUNbXabFYkvhgXRMCxW97r0k2QCl4pBpavaEGJrTEsskIHL+VpCdXMCqja6i4sbTAkwlsH1Ii/BOxxzLzPLgx0O/jH5yNkGpEcMCKhioi2WB7WciuDMNFMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v7 9/9] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210705105103.14509-1-luca.fancellu@arm.com>
 <20210705105103.14509-10-luca.fancellu@arm.com>
 <f1f026fb-33e4-4d18-5718-ae9f9f42327d@suse.com>
 <54ADD75F-83DC-4891-914D-B85FBA69B440@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90673e86-cbf3-8a21-4251-e77f22327485@suse.com>
Date: Mon, 5 Jul 2021 15:27:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <54ADD75F-83DC-4891-914D-B85FBA69B440@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e910a75-db0b-420e-6eb7-08d93fb8ac89
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191876620E3242076E00981B31C9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JFknnPXSG3AczV2hJxKQbVaaCuFOkxlc39GEhRrnOVEPNvu3h921wG+qBW8OlGMdwkyY0wG4/hzqooILluteqFu8VfWZ0pG5cfsLmZ+bMdf6aKmw4uJgpVYgN+9w2nnPFMwnjqJR4CFU18xs5++gG49kaO+eJu4zE4xHEc9Ifp3zQcYm6GIjzeQHoVE0LGrxSy5vJE07oXdwFTftimWCom1nhi5+VksK7yLfPFDDj3B6kKoF0AZLnjQKhJbcbbfVNDRY3RYSRaONFpTcliRTy465xOZ3uDVArdwK83stdjcjAv4/NlFE3NtWf97NWXKUNWUqDNvMYEDy8pEcTMJzC9BXnQFUIOyVmIH/U4AXdg2c/3/MQ8Jf33izE9d8zqKNavftoCYzAatQl7KNsfEoYBi7h6KWRS3EdYX/cZgP8hMdfRBwfW8CoNkm0JKNiAW8M/HYzBInGAEug7v16lMgno3zvzbv6jyWMnEdAcY/+Xn6UrwtNq6288KYRKxOiZeNw+sG9LclVd0vfMMIUiDxUuS1/2CZLGtXh8Yw4A0hIK3BxC+DOn2+mOYJ0ebWoZPgsAmojR5dfX7z1NSpJeVUD/+ednNeSZ62jFYq5wYoUVhllYF8Bp6k0gE9hEGeRKFS+wTc1mnRGiBMq7yJkaC0MAPNKvgY4RfszQDEKNB8e8d7m44C6H9nOpwTeN/UxBeqLOAzypvHfc1Uwm/RUIDLhzIqvAl1ZZZQ5zYLz1zTB4Q0LgfPPtdItvVzSaXyHCIB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(376002)(39860400002)(346002)(6486002)(16576012)(8936002)(8676002)(66556008)(66476007)(5660300002)(66946007)(4326008)(26005)(2616005)(956004)(6916009)(54906003)(186003)(86362001)(316002)(31696002)(38100700002)(36756003)(2906002)(478600001)(83380400001)(53546011)(16526019)(7416002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9VL4vbubBFVFTsJy9LN0+lm0VYfkg0kNmG5SZXtrLqADhEevCl+UP+By0UrB?=
 =?us-ascii?Q?ihrn8vJpLzLd91CHPrRZXXKzWL9Um/8IyGQneexqC47AjdkCRCumMyh9TJKu?=
 =?us-ascii?Q?idm1MWT6MAHbv8VuO6xcX/w9BdsulobaM9TmfPSiB0eyZzM+mKeiAcAFf0IZ?=
 =?us-ascii?Q?Y+if7iUiUGnjc1znHG++mVj9a+rLr2uZIQR9yV/8dUtdPJGnZYcEGzZtEoTK?=
 =?us-ascii?Q?qxylNVgGX8Izg0mcOoeTQpY2aVLV7awIRiWXQM0X6JTHXdIieTEhQAQdik/Y?=
 =?us-ascii?Q?m23iWw9LgjFeMun71iAhhaGTcPr0Rox6RbiTuOHdd7vmNYOsU44nuMv+aRCD?=
 =?us-ascii?Q?CYCoXeqAGQdMdf9yM7Syx8ob415c9yDH7qW9eK4G+vSei1O+tPR0Z3dhBdr8?=
 =?us-ascii?Q?qPFHoPWw7NW0r+YkhSbFjDjwvfK0qZ6wwr9B/+/DAhmuZodEWlDC/CDHxCR5?=
 =?us-ascii?Q?SqcA6TjiLKYv50tK8EmT7jv5QaOlf31BM4WqrHi8k6un0pL40+fqD14wgCFB?=
 =?us-ascii?Q?5lSKQtkwkj8MDhghI9ROakBXyAFQeHLVzrekbuvL30weCq5wu0b+zpwcrZ8C?=
 =?us-ascii?Q?DGsWn8TLpFJ4sBMOVJ7fZtgKRoOj1NyI9mWEpMF23PnICEaW0RPiHshL9U//?=
 =?us-ascii?Q?3LOeIs3X4FLlfpKpEGZIlquYoELlgIuCKVDQeoepOEgithc1oS7TxHgAUeqX?=
 =?us-ascii?Q?GIzQpnWtKJ+SL5AGznpXRJdn9qhWA0KndXn7uYyjZsXgWPjEUwp1vy4Zh9ve?=
 =?us-ascii?Q?Y14B4nYGWYP/1ybAOTN5Yh9GvecnQ7YtlW7rAEOFpuwiL0EcaCGxTm1x/NB+?=
 =?us-ascii?Q?A1GUAJdwuB08cHg79a6hhBgRMfaXm+J+yzGAC8rvVzG7FPKjxoLS/KKJimiw?=
 =?us-ascii?Q?UOQMMqHdIIzECYF2ul9cqj5QJZUyGndUglElQttmQtPAi/mxC8/WHEJ+mUBp?=
 =?us-ascii?Q?NWnY2c105g+LqdSKQFHYqBhwsdic1L+2+SVW9lwSBLPYnKr+IqLCmPQbJDQ6?=
 =?us-ascii?Q?TEjmQpgAv406akgPtXiVzxzKctjrc3PHLBCznKRBaXhAYm4L7z/soDZUiXpJ?=
 =?us-ascii?Q?x61Nk1HqjSAkhzpwUbmtuTUee/SMzY2WH/6Ze4+i8oM+JF/tUtKvJayLvUEa?=
 =?us-ascii?Q?NIZ8QgbivCpp8TNlSJEnL7ZjUGL7Yquf6WjP/Ez/ERcUiHn+LrEMNt+zBaX4?=
 =?us-ascii?Q?M5+gNxnLL8a+yIKE+Q+2xvkpJMW4oRnslqO4UvjddmO5s4NIXcU7Ms7raCqf?=
 =?us-ascii?Q?ZrxAagRbx8eFyZngf/tmvUInbiKzEMd8pX4AkU/zEL0yoX3LeGuMbxrZ835H?=
 =?us-ascii?Q?S9QCw5e2LjXnGgMaK6FUkJum?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e910a75-db0b-420e-6eb7-08d93fb8ac89
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 13:27:45.2255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGqVnlFhF9fd2NLhJ4pyKNoPGDFZPc5ekHfi0X+JAmcSlt1+oHggPVhmmgfkaoFw6v9LM9f2L3ZnZhh+LOOHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 05.07.2021 15:23, Luca Fancellu wrote:
> Hi Jan,
>=20
>> On 5 Jul 2021, at 14:03, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.07.2021 12:51, Luca Fancellu wrote:
>>> Modification to include/public/grant_table.h:
>>>
>>> 1) Add doxygen tags to:
>>> - Create Grant tables section
>>> - include variables in the generated documentation
>>> - Used @keepindent/@endkeepindent to enclose comment
>>>   section that are indented using spaces, to keep
>>>   the indentation.
>>> 2) Add .rst file for grant table
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> v7 changes:
>>> - commit message changed
>>> - Add comment about grant table queries and uses
>>> to the documentation
>>> v6 changes:
>>> - Fix misaligned comment
>>> - Moved comments to make them display in the docs
>>> - Included more documentation in the docs
>>> v5 changes:
>>> - Move GNTCOPY_* define next to the flags field
>>> v4 changes:
>>> - Used @keepindent/@endkeepindent doxygen commands
>>>  to keep text with spaces indentation.
>>> - drop changes to grant_entry_v1 comment, it will
>>>  be changed and included in the docs in a future patch
>>> - Move docs .rst to "common" folder
>>> v3 changes:
>>> - removed tags to skip anonymous union/struct
>>> - moved back comment pointed out by Jan
>>> - moved down defines related to struct gnttab_copy
>>>  as pointed out by Jan
>>> v2 changes:
>>> - Revert back to anonymous union/struct
>>> - add doxygen tags to skip anonymous union/struct
>>> ---
>>> docs/hypercall-interfaces/arm64.rst           |   1 +
>>> .../common/grant_tables.rst                   |   9 +
>>
>> In patch 8 you now add arm32.rst and x86.rst as well, so it's at
>> least odd that here you alter only one of the three. However, ...
>>
>>> --- a/docs/hypercall-interfaces/arm64.rst
>>> +++ b/docs/hypercall-interfaces/arm64.rst
>>> @@ -8,6 +8,7 @@ Starting points
>>> .. toctree::
>>>    :maxdepth: 2
>>>
>>> +   common/grant_tables
>>
>> ... to me this seems the wrong way round anyway: I'd rather see
>> common stuff not be linked from per-arch locations, but per-arch
>> docs to be down the hierarchy from common ones.
>=20
> The things is that common stuff is not really common, if you go and solve=
 every
> define and so on, you end up with a different content for x86, aarch64, a=
rm.
>=20
> So you can=E2=80=99t have a common.rst containing the common things becau=
se depending on each
> platform the content will change.

Wait - the documentation should be uniform for all architectures.
If there are architecture specific aspects, then these should imo
still be mentioned in the common section of the doc, just pointing
out what those specifics are for which architectures. Architecture
specific doc pieces ought to cover architecture specific hypercalls
or sub-functions of common ones.

Jan


