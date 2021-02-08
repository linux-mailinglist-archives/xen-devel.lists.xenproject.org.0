Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF01312F05
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82710.152791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93pa-00087e-JN; Mon, 08 Feb 2021 10:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82710.152791; Mon, 08 Feb 2021 10:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93pa-00087F-Fu; Mon, 08 Feb 2021 10:31:46 +0000
Received: by outflank-mailman (input) for mailman id 82710;
 Mon, 08 Feb 2021 10:31:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0k8o=HK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l93pY-00087A-R9
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 10:31:44 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5153694-dd00-4076-b64a-8d430af2a76c;
 Mon, 08 Feb 2021 10:31:43 +0000 (UTC)
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
X-Inumbo-ID: f5153694-dd00-4076-b64a-8d430af2a76c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612780303;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DZUx01oQax/iYUlWe97Je4a/eksVcPW2+BdzIcW+Xfk=;
  b=bA5X9p0FtwDe1XxfBpeP6Z53WmWTtWbJef7osa6apInIJxJFqGIOWDCl
   eyYSqy1e5y49D9n/fJxkKMP9yz9381EF3/FwboaTJZFZ6y8hAjqR1jSNT
   79HErG641OCf2LEiJVto09xm0bFit8DEhGa0HLnAhPqpczBXh+wxjatvg
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 28c8XnO8/zFeeNVyIbqMLb8LB/GzluumD0GZLmwM2hAjdrV/NtEemG4LHXnWPEf8CoLA+XkbFY
 x0FxiF0JDvPP+FMCS1qI1SGQ2oXrxecmuVIL2li+jSWywE+YriYP1Yk3Iv6J7aQrih2uvuaXUo
 RP32mOwW1VYmCP/GyzkDnYtX5nt9UNEJIf87nLlySEh0NA3IdgcCOorEuGIkKyF9tabwJnZlOY
 M9uGG9crrA06ElzSLZoG9SeubTGfNW6L0h+VE6gdbvUu5j8v/EQtvzcjRGhOohsx3/W4YZasj7
 PQo=
X-SBRS: 5.2
X-MesageID: 36957211
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,161,1610427600"; 
   d="scan'208";a="36957211"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmkdMkIzKGI5cnd8KEcS8MRFD6tVmQ5spXKjCA0Z22kAgr+NyhUOUByRqzaLTjKfxSBAvVfxZBrVXsUz7xMOIGRxVVDF673bSVezoGdfRgivq9Rkrwr9n2fpXuWSZKM3sJV20YKw0m+4ZyXis6cdb2aYoEY6tMIyF2VqYEIBz8BL816cVatXUZMNj/8gD5Lj60ldWwUpg7u8c2llgxrD9VL2yZUexm40MbVbzCUX62xu12dixRgoISNZXbBdo2u/JCFHXMvLYsVhLEoCBUbGLrxAfyMmnPm/5wfKvUee9YySWZ6PivDpDxnaG4s2wiOZdItsbjLFp+C88odvQIGpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZUx01oQax/iYUlWe97Je4a/eksVcPW2+BdzIcW+Xfk=;
 b=nsMo0+jt8oun7j2KU4Q4gP8epCLmooXq6KOxoeQWr2hViGPYP1ytHQFTXqx1cxTiNwlsbX6VOxTviQBAoq0bKZbIcNKd0N4+Fc+6mF4MMJS7bh1NyrgSD2zQ2jR0D1FBonLx2rdYR8XRo0dgn1oZadZDY2mk/Z30ZSyCf1qjF281A9EkjpTwspEQXhhwdLfCUGgonfNR9VTfKjyM3iNCb8DmT5gejaRlDix/4vMyMNRFVHzShIIIMR3xAPjJGRVq+DTf7nt6U39orV8IebWB1E98KvIcLX5HiPaoaqP3flajhgorClzXQZP2wHGqxJx7rtsz9IdPS0qYOpNPHsL69A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZUx01oQax/iYUlWe97Je4a/eksVcPW2+BdzIcW+Xfk=;
 b=Bow2+BJPaP5Cv4pFBouR0+Yf6ZFuJKAlTmG7hNvZ0KAQgjIbCAu9JGxo8clNcNRQylod07VxScoie4u7ibjgfnqZav3ny8Lo3GUpEDPfoVkZ+FekfLZeEmKR+kapAkrDFr1WIR1amsQpp0o+iSeszgWUw25hrQwi19Hqd8/Ucqg=
Subject: Re: [PATCH 6/7] xen/evtch: use smp barriers for user event ring
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-7-jgross@suse.com>
 <2d354cad-3413-a416-0bc1-01d03e1f41cd@citrix.com>
 <dfa40af0-2706-2540-c59a-6593c1c0553a@suse.com>
 <e68f76a5-27ce-a6d8-88a3-1e8fa1c30659@citrix.com>
 <60ca5c18-bbf5-5d3d-1af6-f4692077c44e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bac45a67-087b-636f-3a74-db266f970cda@citrix.com>
Date: Mon, 8 Feb 2021 10:31:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <60ca5c18-bbf5-5d3d-1af6-f4692077c44e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80187434-e7e1-4c8e-9ea3-08d8cc1cb88d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5823:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB58238E99987B9F8C0153A683BA8F9@SJ0PR03MB5823.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rnwve+rxlTHlYchZQFF8Vqx6rf0WC/8ejvQxxppxDCmsOlKnPbJ8T48kpweIf3ApNgl4OX1HeHa9szh5J1KnX6jsB1nMXYBAreWls1M05LWVcDdghWaOpjvKdC1PCrcJtojWNxTukDxISNqqEvFikMjs3tl5/yUvT3RtEjBAytq6ok8ZUW+0xXuFsRVooLanjso6OzMYk1220y5FkMQJRil3plgEj2f7eqFSRHiRwqSQi+4MRHjIIKYlPdWcAdFo/Y+EbCKW3nHEBBX0aNPH0RSbhY1QL0aw9UIg3GmlkEccpgDRNABhazy9UQeOvVzlETEYLLYyuUcezpgPLjJEc3Nkn2pS7mqyfDSKiRBMvja+k53XpHEMzD9FIo/d06lBQ5xDUfVRTE8p+MTuDLIkK3pmqX3dTabVn2zxNo2h1LmZJpTTRBdQOMPhu7IMwm5OvGWVzXer5mVS8bluXkTpBA0jtFrdkYTD3vSbUU4cdt+rhr2oOWLMWx7Zb2E47DB50PzViHBub8iLtKGvfjCGlediufH6dbb7kMcW/Ou+ewKX3L4nyOqTWuDtplpzEkdW9fd0YyYra63pq3Gy4qEr5IRtBi7GloPrPyZvkfBpNvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(2616005)(956004)(83380400001)(66574015)(316002)(66476007)(53546011)(16576012)(66946007)(8936002)(66556008)(31686004)(478600001)(86362001)(31696002)(36756003)(6666004)(110136005)(54906003)(2906002)(6486002)(4326008)(8676002)(186003)(16526019)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eWRVTmgyblc0czZUc1d2M0czelduZEN5bTMweEhQdTRGRzBuNWdpdkRmc3ll?=
 =?utf-8?B?cUNEeGtNTVM5RXdrYlFhMkQ1K2JPTDMvOEdRVFkrRndFQWZESXJiVnZWRTJr?=
 =?utf-8?B?Wk9nY2wzSzhHVTNyKysyN1NyZmFpT3Y5OWEyYTVnVGtIRzRwQnlvRWd2LzFt?=
 =?utf-8?B?d3FTdkt3azJOQlJsMmczYzdSK0hFUTBJNFFCUitmaGVBczdKb1BDV1dmVEo5?=
 =?utf-8?B?cWllcTh5Wkd1N3hxQkFzQW9mVVNJTWtjcDMyaUl3ZkJmVnI2TEtNalNGdE9R?=
 =?utf-8?B?c0NMOGIyV2t2elFqNHZ3QUNjNVk0THNiUlkxK0N3UGViODhUUkRJSUd6VUlv?=
 =?utf-8?B?QmZXLzJ3ZENNWGpCYm1Zb0VDQ3N4NkZ0NVlMeGRJY04rdkc5dno0VGF2REg4?=
 =?utf-8?B?dk1pWDJuMVZvVlRkb2F5Rk0vOUY4UysvdGFxSDk1NGtaM1JjY2VVMGpRVEx2?=
 =?utf-8?B?MlRYLzZvUTRkR1E2TTcwYlVBT1N5MENaWDZNMFJaVEVlc3BoaDB6dUNIUUQ2?=
 =?utf-8?B?M0hlMnQ2dGV2ZUVPT3NJcXpHMHZMQ3JSZHVrSkdRMEt2Q0pSWkJFekdvUEV3?=
 =?utf-8?B?WVkrUHdDK0JxMXhvbVR2cmpJSTh2Q2lHR1RkUHNXVklFMUpmMFdFWC9yTXk0?=
 =?utf-8?B?UngwWXh4M1A1T0dQQkQ0ZXlzc21FajhTMTdQUk9NLzV3ZzdTQWxFRVlIcURW?=
 =?utf-8?B?dmJ2OVNTQmpIYTJxbEtHOS9NYTVQanFwekpCNy9URXU1ODdxZXc5ZVBpVEFj?=
 =?utf-8?B?UklSaHYyMDRnRDlBZEUrVytnSUtJZzBlUlNlVHBYZXh6Z3c5ZzhPVExWOHI4?=
 =?utf-8?B?RzM1T1g0eHBVL2RLcGFKRTFzZFBpTHJBZ0pJWmI1ZHRqNG5ZbUFGeXU3YThW?=
 =?utf-8?B?TzI1SFFGekp5RVVCVE9jM3l5QW9lSU8yaGNhMUdCWFZRM1FXaUN0Y0lDOUhQ?=
 =?utf-8?B?eHcvN1NtMExjZEJuMFUxQ1BlVWwzUFNiS3liOW1kUzVHV1I5ZGx2cVc3RVdU?=
 =?utf-8?B?aGZpeXlzN1M1bm1oVmw1UUI4dkNWdjJqeXJTa0tkU2VPemk4YUw4Sm9tbTBt?=
 =?utf-8?B?ajdXTkQ2L2ZVZkhWQS9SOVNjQ29lQStMbW52dHc1aXJvcm5CZjZXa2pSd3dD?=
 =?utf-8?B?TnN5VW8vVXVFWVF6c1hJVGhGTC9SZENuNHdHZEhNdGJISGdSTVdSa3NERS9D?=
 =?utf-8?B?V0hZbFptWWNzRkFVczV5VUZNUktUdzd0SDd0c0srWVgxMTNKZThYTWRJMyt3?=
 =?utf-8?B?c1hvNlIydHJoaTZpeGFEcGY1YUdjWktWNU1UM25yMWw0ZlF6SVVNUEtUcEZC?=
 =?utf-8?B?dDBneWgxWGloUmZYVnNVTWlvL1huZ243MmFwUEFacHVId0t0dUFMRVlCTGVt?=
 =?utf-8?B?am5yRUswMG81UkhyZDJ5RWwwNnE4MkM3WG1pVGlTVUFEcVlLcTNrZ2hKMnBG?=
 =?utf-8?B?LzFnNlFnSWZCWWZvek9yN1F5eDFmQS9MU2s5bWRLNFQ5eldJc3VlWUZCYitu?=
 =?utf-8?B?VjVsOFBqa2lPcTVPNEppVjdNTmMyZkl0bmxFcGpZbTAzTm03SDVXcFk2WkNh?=
 =?utf-8?B?US91cmoxSjFTVlRNMWxORlprWm41T1M1ZFJjL1hadG56cXRyZnBZaVlxelZy?=
 =?utf-8?B?R3BQMGplQ3dEZmhrZjJtQW54VVZkaVpyYVNKVWtzbVlwRDNzcWxkR3UvdXI3?=
 =?utf-8?B?bDhFUEtVWFVHcDQvNElnUmcxWkEza0R3WHRtUTJqRGdQbXgrRjBqVThGeFNm?=
 =?utf-8?Q?ZV8sQnEYMRxnkYFhsr37tD7Qx6diu5OQXeQwAf1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80187434-e7e1-4c8e-9ea3-08d8cc1cb88d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 10:31:40.1534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuAdKviTi76TRNXnW7hUxfaEtDBnw5QPNOwPNMiTzDAMBSQUkg7Manjp+ehVuHUMmiuEW07m2cjNC+uume8GZHlU83q1FP9UdhJtUiWOkpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5823
X-OriginatorOrg: citrix.com

On 08/02/2021 10:25, Jürgen Groß wrote:
> On 08.02.21 11:23, Andrew Cooper wrote:
>> On 08/02/2021 09:50, Jan Beulich wrote:
>>> On 08.02.2021 10:44, Andrew Cooper wrote:
>>>> On 06/02/2021 10:49, Juergen Gross wrote:
>>>>> The ring buffer for user events is used in the local system only, so
>>>>> smp barriers are fine for ensuring consistency.
>>>>>
>>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> These need to be virt_* to not break in UP builds (on non-x86).
>>> Initially I though so, too, but isn't the sole vCPU of such a
>>> VM getting re-scheduled to a different pCPU in the hypervisor
>>> an implied barrier anyway?
>>
>> Yes, but that isn't relevant to why UP builds break.
>>
>> smp_*() degrade to compiler barriers in UP builds, and while that's
>> mostly fine for x86 read/write, its not fine for ARM barriers.
>>
>> virt_*() exist specifically to be smp_*() which don't degrade to broken
>> in UP builds.
>
> But the barrier is really only necessary to serialize accesses within
> the guest against each other. There is no guest outside party involved.
>
> In case you are right this would mean that UP guests are all broken on
> Arm.

Oh - right.  This is a ring between the interrupt handler and a task. 
Not a ring between the guest and something else.

In which case smp_*() are correct.  Sorry for the noise.

~Andrew

