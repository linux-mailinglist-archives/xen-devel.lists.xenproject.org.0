Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8B31A32E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 18:02:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84389.158264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAbp3-0002Gd-S5; Fri, 12 Feb 2021 17:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84389.158264; Fri, 12 Feb 2021 17:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAbp3-0002GE-OG; Fri, 12 Feb 2021 17:01:37 +0000
Received: by outflank-mailman (input) for mailman id 84389;
 Fri, 12 Feb 2021 17:01:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAbp1-0002G9-Qz
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 17:01:35 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 489dcfd4-9cb1-40f3-96d0-f0565531e5f8;
 Fri, 12 Feb 2021 17:01:34 +0000 (UTC)
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
X-Inumbo-ID: 489dcfd4-9cb1-40f3-96d0-f0565531e5f8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613149294;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vnW0b30z1hZxcDTtu+jo26HtPh1/6e5wL35MPxOOP64=;
  b=BRc0qDO/nSN33Mlpib8gyb0L1wGvhUbTgVguwq3yvrDAB9xxvC8pjO3p
   /msTM8rOgqqhACUIyPzv+6grDBJouPwlpIYsSe2tpKnPS46fmgF3tpnME
   Z+qIlVKR9uIOsmDhnqFuBWVMw3OjwETw5Ko55GPr9GkNCiH/3IKTxzj+j
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gdn48AqrquRY5iJo6FIf8CWvWhUa1x1/Tp+xPr+N5yZJHiW16WT/k+0N61wMLpdwt3mqKUXRB/
 /CrEJryussyGex1YHluldO485Cf2sd1BImLDCzejhB/BlUe7oFjmWUoZ1LL+Yusk7wEJb8I9T1
 ZadScgLWRjvGDG4F7SxHtXG7UULWAddGcwfMCR1+qsQN0Z2OfBDYqPU080fJNmrEFLqAppZUp5
 /I9Jbk0n6mb+my9if5gXcOUILKHYfD4uZUIk27DNaZLE8F/ngJZekYoeAvQ2AhNmeuqMbaqDiY
 cQ0=
X-SBRS: 5.2
X-MesageID: 37179681
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37179681"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYZhlOvM4l5a+AsIA50e4QQ5aHgqv9GSh7M1C45w+3+woYUn6OQ+hu3CAYLVtmhlIiYvVYVUtLCIfdvc64QtNrg/4G4BwTUS/F8Pv7ttowcmFF8QTkpJTxUq7RSy2VL582PmwjQE8wilgi388He3ofO7zlg8rhqIawkmbbzvD8aYNuN/gN1KKZbuQWD79mXKLOxVtlMCzW6fsnpHho5YPxquuDLw8Fz1s1JUVlFW/a5TmBmtDMyk1x4TN44lxj4ZHq1gAZkJibh93qgTsK6u1/K9R1CCpKiKNRmgwWTCIXT18dqqkp4NNt2wPHoS4mPBOF7ubji4eJhFQJGPbgzfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnW0b30z1hZxcDTtu+jo26HtPh1/6e5wL35MPxOOP64=;
 b=dkGlL1UYsAJJvCv8PnO0bDqpgosHcBJA1MMo0o0BcaG8rz2dm3P1uQGm6zfhBQvdNfZpOOXSlNVE1BngXWzYQAfLvxPRBFylou9x7L74ckZTLo5O6e7n2vm2/NnSkfqIWSS/eBQOpggqedaEf73j+sya+P4n97cX7MOtQm4flWtr9pKaXnoM0jyd5z6yrLKLDU7aacHNwNTnQTaCUieUH1Ci/2yKTQLQmt1sovaXuAB9qDA8DZY0fVCog4nEKMfz3xBHQk8v+JJqDHkkEdtXNobpaIPq7+N9ADxM4ZPhvJfLY4OMfO26w7vlKzpD6SVTeD1PzbGKLKY4b+NpRuetRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnW0b30z1hZxcDTtu+jo26HtPh1/6e5wL35MPxOOP64=;
 b=M+kIdi67rmWsPY9EpG7swpy6PloOr5Di2owF1+0buHT1NOcSz6xVWZVoYZApJQ5ONapKv0SQ2tdjSjkX6QmTh4mwbYBXAJDyWGn0cYqdCaJ3d/O1acOXOwF2LrM9IASFbWuF8ouxhBZB0L2cw/NRIfch6jqPQq4E000RdwsLxlM=
Subject: Re: [PATCH 06/10] stubdom/xenstored: Fix uninitialised variables in
 lu_read_state()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-7-andrew.cooper3@citrix.com>
 <cea38f47-7dc3-ea67-104a-e5b1899a7f3b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <226c35c2-2280-8353-74d0-cc35e7f84de6@citrix.com>
Date: Fri, 12 Feb 2021 17:01:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <cea38f47-7dc3-ea67-104a-e5b1899a7f3b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0270.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aba431c-4dc5-488d-2972-08d8cf77d87b
X-MS-TrafficTypeDiagnostic: BY5PR03MB5348:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5348FF5CDBFD8FBCAF497559BA8B9@BY5PR03MB5348.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWvRRN//waT0RqD4UFrPpW13RORsFrrMRhaq8KEdrTE8UUca2+6iBSJPgA39oWscCD++fLUptlviYfFonEs8whyddEEM28VgkWyWOIWJwdko8Zcqm/sAFibwI4lWa9EGF8i1sYbUj/5pXFaYER9aPj4lbvcZTvwDvjC7/DQ+TgW72T9GOBUrJrQuWDzOR+X1PlZCyWslPFNnZqh384PoCOMJ7Yc8SweUxlSwkoPSOzGsONXjbsJN77jRxnkSx1x9Vf4+VcKrnfZ4YXNt0cMqTOGJh4vpMViRK1s7KPRCS+y9ZvAbjwSF8kHbnPHFQYeAha9wj+NQ1u+3KJpc0So4G0TrjYPhpns+3MGWV8DGO79sy2NGzU0IWH9ppxrj+0B30X/m0l/x5eZ1BI76nrxHlRl4Gx2AyRlfHqoimNxEcJAHlpPJ08ENEtQnUXXs1FzIoecGgKvtZZoSHEJMUjCciocOelHT2pbd9FbdQItjqfCVG147TiHqjc0Y0vHf87VmnG5Q7C9Yvb7StZYEUNQ5AAZJdZyCR6BREHo+J9SwAo0Gwk2gCvFZ1Mb7eIKf2/SQsv9vvAAAWi4KmYlqjdICn0b1Cc3olvOfnOUOg09Xdw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(5660300002)(8936002)(110136005)(36756003)(6486002)(66574015)(66556008)(66476007)(54906003)(31696002)(66946007)(31686004)(4326008)(26005)(2906002)(53546011)(186003)(478600001)(956004)(16526019)(8676002)(316002)(86362001)(16576012)(2616005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RTc1cnorT1ZzQTJyb1NrbVNBR3dTVXZxUnJacnorbXJhZC9oQmM1THIrU0cz?=
 =?utf-8?B?cGI2YmhydWtMUE5xdGdINGVYZFplMEZlbEZsUVloNS9iTzBTcUorRVVtVTVZ?=
 =?utf-8?B?cGlVdFNaWGZIOEdUd1R4VjZZVFRtMVFCdm5GeU9oSHphUUpnTnVVMFkweisx?=
 =?utf-8?B?QVFZK0tFMmsyYkplUmRKcWNEcDZVaGJObGhLSEhaMWhtWnFjcnZMMlBHVFRG?=
 =?utf-8?B?b3hEVkY2d2p4V3BNUjk4dXdWV0RzVFpXZ21LWk9hRGowYzBoZ1c1NTArQ2tL?=
 =?utf-8?B?SlROdm5MK3VFWTVjOXFqdEY1c3hNY2x3aTRPeVZoQ3JKMlZ3SmNWSGo1UHF1?=
 =?utf-8?B?OXJxWVZQaTh6Z1c0OW9kY1AxSEhZL0tzOE5OMDhTMTFBR3VsdzZFTzJxbU9a?=
 =?utf-8?B?MVBLMlZ4Ui84OWdFTmUwQWpIQXhJcDF2c2cxWElLcVcrK0VGNitJamxNdUk1?=
 =?utf-8?B?RzRwU1V1cFlVaDNGMS9VcTRyZkRCQjFRQ3FZdjJ2STliOXdIaGRKanBpTVlX?=
 =?utf-8?B?TWZzNEhQVW5ZdncrYzNpU1BoVmlqS0MvME9wWlRYWVZpMHFUR05oaVJSekdk?=
 =?utf-8?B?R0kxVjhweUFZcFh0UU44SnlmRURJbmZvY2xtcTNoY3RXUEFRcVFvUi9vNTBL?=
 =?utf-8?B?NjllVktWdGRvNVlVUUNFYTh6K2RVVG1pbmQ0L2kvUmFLSHFadWJmTW1ET1Js?=
 =?utf-8?B?bXZKMi9LNTBYR0FScHIwaWR5aXFWa2pPRzBFMVZWekNYWm11M0s4bTEvM211?=
 =?utf-8?B?Tk05WWRKSGpOMndqT0hvei9raE9ycVFQdlNtUUptM3gwYWg4ZFBiWHVDVm1j?=
 =?utf-8?B?Ym1VVjg5RDVQNTlhVkRhSjhyZDhOdk51UTd5ckZucGd6L0x3a2N1Kys4ZlJH?=
 =?utf-8?B?a1h2K3U2ZkxvT0ZXTVFmNHRVdDFMd0dPd0Z0K3V4YlByYjNGV3A3KzVJR05P?=
 =?utf-8?B?YnM5WWU1WHM4UFAxVk01d3ZobUdJeDJEK05LSjFZdU1KeURsa3FHcUpOMXox?=
 =?utf-8?B?d29GOHZ6SUxKZXdFRUZzSHdRcktkaHhvaExVUm9iVG80cTVDOFoyZitReUtp?=
 =?utf-8?B?ZXR6Ry9OSVFBbUxGY1Y1NXdOTWdzT3hrZTN1MnlXcmRBQ3gwY0VWL1ZBVnlj?=
 =?utf-8?B?QW0yWHJ5VkR2VXhFVHdMdlVIWDBHS1lIdkoyQ2FoNGZYQlk1K1JoKzB2NnUr?=
 =?utf-8?B?NytINnZWSUZaVnZ6aUJ6V0VxSnhPbWJHaVoyakhpcmRLQWZpTUEzTUI3V1dy?=
 =?utf-8?B?OXBEYkc5eFhTODZyMGxtZHlRekxMUktsVHhwRWE2RkNBMDZoclN3a1AwYjFu?=
 =?utf-8?B?S2grdm1SYnVRNUdjYlVtYlhVcDZVLzlTNDNnTW1ub0c2YnAzcXk5cWZlNWF3?=
 =?utf-8?B?ZTlmMG9UYTFmNmpUcTA2Z3RzZGs1T1ZxL3VPNnM0dFdiQmV1MXlLOGVNcVk3?=
 =?utf-8?B?OHRuUjZDTXNFYmN2RStzMldLeDZ3RHNsWnNpeTVNMzcxWTgxVWVNaDZXalla?=
 =?utf-8?B?NUgxOTZ0T2thbThGd3ZvdzZXWWkwcEpYM043bktQbXZRYjEyalVaRzhqTEtQ?=
 =?utf-8?B?R1YrZDVWa1F5VEtyYVhLOFNteHJyMFlMcEcwcklENVdpQk0wT0dKQ3VTdjJB?=
 =?utf-8?B?OUFGMStyY053NVF1OFZoaHJpazI2N0tvR3dXMVlIajRKQUV2Y1VmeHlBVk1W?=
 =?utf-8?B?YjdwT0pSbmt2cTQyUTBPN1JCb2QwQ3g1VXpYMVJSUllnRVQvK29zYlZEVVlT?=
 =?utf-8?Q?tIgds9XvkaL0f09HIp4OUfXdCAK32RV1e4cRCXn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aba431c-4dc5-488d-2972-08d8cf77d87b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 17:01:31.6031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPqF5w9KQqHx1myJvmhftdpQFEvCBMji1ptm1fvTpjcMZesscGKBHskYgrQpzWP42u5nrQxg0zB3peCgGGKoF4xuQVl5QlzeR+T+Bitb2xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5348
X-OriginatorOrg: citrix.com

On 12/02/2021 16:08, Jürgen Groß wrote:
> On 12.02.21 16:39, Andrew Cooper wrote:
>> Various version of gcc, when compiling with -Og, complain:
>>
>>    xenstored_control.c: In function ‘lu_read_state’:
>>    xenstored_control.c:540:11: error: ‘state.size’ is used
>> uninitialized in this
>>    function [-Werror=uninitialized]
>>      if (state.size == 0)
>>          ~~~~~^~~~~
>>    xenstored_control.c:543:6: error: ‘state.buf’ may be used
>> uninitialized in
>>    this function [-Werror=maybe-uninitialized]
>>      pre = state.buf;
>>      ~~~~^~~~~~~~~~~
>>    xenstored_control.c:550:23: error: ‘state.buf’ may be used
>> uninitialized in
>>    this function [-Werror=maybe-uninitialized]
>>       (void *)head - state.buf < state.size;
>>                      ~~~~~^~~~
>>    xenstored_control.c:550:35: error: ‘state.size’ may be used
>> uninitialized in
>>    this function [-Werror=maybe-uninitialized]
>>       (void *)head - state.buf < state.size;
>>                                  ~~~~~^~~~~
>>
>> Interestingly, this is only in the stubdom build.  I can't identify any
>> relevant differences vs the regular tools build.
>
> But me. :-)
>
> lu_get_dump_state() is empty for the stubdom case (this will change when
> LU is implemented for stubdom, too). In the daemon case this function is
> setting all the fields which are relevant.

So I spotted that.  This instance of lu_read_state() is already within
the ifdefary, so doesn't get to see the empty stub (I think).

Also, I'd expect the compiler to complain at -O2 if it spotted that code.

>
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks,

~Andrew

