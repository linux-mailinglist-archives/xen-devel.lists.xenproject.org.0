Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8012A329C83
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 12:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92282.174144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH3Ad-0008SP-Te; Tue, 02 Mar 2021 11:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92282.174144; Tue, 02 Mar 2021 11:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH3Ad-0008S2-QE; Tue, 02 Mar 2021 11:26:31 +0000
Received: by outflank-mailman (input) for mailman id 92282;
 Tue, 02 Mar 2021 11:26:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KcId=IA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lH3Ab-0008Rx-Cs
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 11:26:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3a6ae94-4311-4399-9aa7-bacb8a530588;
 Tue, 02 Mar 2021 11:26:28 +0000 (UTC)
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
X-Inumbo-ID: b3a6ae94-4311-4399-9aa7-bacb8a530588
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614684388;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6FinklHekSRnE/OkXoVhmc5CQrTHXKLzB4oIVOIqNLg=;
  b=F3z4jXel6cK2WLxfhSQ7Je0z56QvP4gqkAWSjN5uxGPYH+D/uqiZ32YC
   /9l6rmhyYdf54oQSh413sNJsVuMzURXGNiwEdu9tuP4Nr9wWiiH6xz2TQ
   9tnhp3eDGsVz0Irq6Ocl4F3aigq2c5Pe1uIg03LLizAoK01UQ/8vqA4y7
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: epuHac8kzC4q49WAiQLeTtQg5uewIRm4b3KIi0pAaWERrtnfkEoZI49l+5w05M0cioi0jGdvt9
 l189lKLc6VXaMYK7usb4+1YYTLoa29qh2xDzUq+p4lFhy2ulEe9bJtUq2YlXhxRF8JbaeF09oL
 JkwJMAz1/CZKeVbSUEKp5+6DEem8jiqfdiG2Uj0HzoDA/PfJSxlM5jgVmPvxSucRQykgyqxmFZ
 pksY14ZhzqLf3mCWEvizQkup6KLqOktQ0/rP41Lhhx7j9xOo1qlkt7lusZCpGtS/Wtas/aX1Wd
 O6o=
X-SBRS: 5.2
X-MesageID: 38315656
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,216,1610427600"; 
   d="scan'208";a="38315656"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGrjQV+j6n1aCRNDVNAsJXbj1spCkS2Y2npranEp1jjT9sMRCLE/3DVpq9ytUYsz5GAQMJc5N6ENsmvl6AiAUJicXigyFkJdlQolduU0TeSRyW7EIhyx7r9llWxAwgua7fiMZB+vbTFvuw8g2frf2hUFyffVuylPatNXSdqNAYQB7TYWfGnFdc6K7LsGfKQ9GC+0s61NbZ0bzlVn2wz9CYIxBiwX4uD+DE1E2UC2t27LVz2B4a44EI9cYcV6DQFfbQs65jYcE9Qr4TYIHRcT/fiJs2wW0/tG9LRuoIhMdKxDTnrG6ZBOYjP1ypkbwQTz6FPbTeje9zcyqeKQQfBjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FinklHekSRnE/OkXoVhmc5CQrTHXKLzB4oIVOIqNLg=;
 b=Lsp1i6xW9fgfdfXDbBSS91/B2643oppbBZhGFaRTArFAELf0k7RxBGZexzj3iqiEPK9o1xYvq43T3GueKKieOr27wxFFGPBoHla9vLxc+3Sj6K5/4LvExZEH/Gw8OvwgDuKFJH686Rdvm2aj3mvkVt6lZM003LITpNP6Q1Gv8VD/aKG5pvTUFpF+i0zBFZVOikMs+nINJRugpuPpu03QIQ7aQagrD9o6eqQk84uS36zUjOG3YTolhrR7eRvy6WX087ao26QaJ0/imHRdT+mg1Cguh/iSOWrtF1kdHhzd6IF5njD/wczRE6HJG6AoL2d2J7NCoCxQdsOQZozozjfAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FinklHekSRnE/OkXoVhmc5CQrTHXKLzB4oIVOIqNLg=;
 b=v9sx1GkFp23lUL6QwTQytq6dOiMyDGSRBWq0pGZxm2c2WUdiaLHsXRU3kSjnZ7Hc6LCcJGhsSx7RqHCh31aCQUwPOqDqM912HXUxJW9lZxoZ7QN2v2Yg6mwZbEH/7KeN+xx9cMBVu/EGPYO0oM4dxyCgIlIT0AD1/Lz8kNYLiTs=
Subject: Re: [PATCH 2/3] tools/libs: Stash the 4.14 API/ABIs for the stable
 libraries
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
 <20210301170044.23295-3-andrew.cooper3@citrix.com>
 <677223c5-e661-a132-35b8-2e9424817c7b@suse.com>
 <d53399b1-7053-10b1-b5a2-38244dc2f154@citrix.com>
 <c06e2a00-6f23-5ddc-3404-572682a0bd51@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fd1eb50e-e68f-3648-5e2d-5653537c96ea@citrix.com>
Date: Tue, 2 Mar 2021 11:26:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <c06e2a00-6f23-5ddc-3404-572682a0bd51@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef37f3a6-31fe-4ecc-3b71-08d8dd6e0376
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5949:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB59492B6FA7215E546DA0AC0DBA999@SJ0PR03MB5949.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VG7xLMii1q0b48FSYpPM5dGe/MYxbIOENnx0JD2QUAFOXoRcUPYCIejCjoYnUPW8vdpB7i41njNFYvgK/41EAGj0e0F3HjuB6FKm7FjUsPBo/U9yfqrPV6K5YvYAQz5fqTGo6SZxYRrkHwyjc0aVr8+ia9Q+L4t7uwsFTzqleuPylIta/1pDkNlx6a9G2HyjlRXDcjbwyks+pyEnWJ93Mk/61ln067lRhvDmsJ2oxRGa9yllukU8oyKPiW4GD7DzXS+SCq/2LAkp9ieC1A3yi3QQt2eS00z1pr7ku11WoiGqYrRz3vfTwvfaI2zgB9gSDZYUlEnbrdcqsuU704l8f0C7LjJAWShhCh/5JujvgepaxSpEQdAq+K85q1oJJRzLRtKi4SH2OizFbyZPmtK1YIP8qKdAHoLcMbBlkwwdC0wUSFs3kLbrUhleO3Zj1HTQezo7WQ9wUOSeYX/0myXkrb8uW8ThoUO1UCwHC+OPUABNDqsUQSdzOiZ0aCEtqYU8IrUzhtUw/BKdeXoZ/AI8iiBfIzBPmARuxx18p5Y019G/1/vZg7e3phddA6A8xj6d9xe0/EnTdi2Xl3vMTBtCzOaAC98jZx4ypnQrJV8u008=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(53546011)(31686004)(5660300002)(2616005)(4326008)(31696002)(36756003)(956004)(6666004)(26005)(86362001)(54906003)(6486002)(6916009)(8936002)(16526019)(316002)(8676002)(66556008)(478600001)(2906002)(66476007)(66946007)(186003)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V1hJbUxaQlhBTEd3YTFMeEJIWTAzZyt2TGgxQzc4dnFmQVBIaWlKTVNXRE9P?=
 =?utf-8?B?UUQwT0J1eDROSkhoNWVNcnVwbUo1MXBSb2Q0ZXVxL2lkTFB4eFk4MTBpNU84?=
 =?utf-8?B?Mzl2NVRVbThMbEYyalRkK3FtR3g5c2VEdlVycG1icFBHSVhaK1BTeGhIOVFS?=
 =?utf-8?B?Nkp0Z0ZtbFFYejJzR0s4WllDMUpUSktyVElwdUxOaHpXR01sZHpyUEVaZERp?=
 =?utf-8?B?TnFUb1Mrc05WdEIzeG5IdnZyQjVVZlB1Z0Q5M3FkMDZZamF3V1I3MDdjVVRB?=
 =?utf-8?B?eE8vNDdvcmZ4SjJ0Z0I3NWF3cWFDSlVUSHEyUDZ1N0hWY3NoUVREeVFVcm4z?=
 =?utf-8?B?d2g0TUE2OXp4QUJXUU9MVnJ3YXM3dFB4NGhUMDBvTWdWSlNnYUYxV1hQVGNQ?=
 =?utf-8?B?c0tBQ1RNUE1YT1dXb2I1ZFY1VVA4T3BFbDZmOHduancvSDlqWFljbWd1UlIr?=
 =?utf-8?B?ek5NQlRxUDFXcGtiaUFJTUo4WnFzVFJRN01qMkk2T3Q5UUdSR29KaFVEUWlT?=
 =?utf-8?B?VVU5eHB0V1ZKQWl2SHRzNS92S2F3R1pPeStXeHVpdy9NWXFrY0Vrdm1hZDFr?=
 =?utf-8?B?STJjQldGc2JqOFhaeWxHWFhGdkVzYWJkSWVyS2FRNVZTNWYxNjRwdnRIL2ox?=
 =?utf-8?B?WENka0pDMkNYSTZ2ZEJpczdUamgwTU11bmd0aEpGekgzczdtRkNtRkphb3pv?=
 =?utf-8?B?K0RuQjlrNzZ3TFBLNi91TDgyWHcyTnAzdTNCTUV0a1NKRU84enhLOGhUMFB3?=
 =?utf-8?B?enVGTWtveTBVcWFhVjhGTE5HT040L285d1JSVmt0dUZuRDBTTjBkbjdzekla?=
 =?utf-8?B?MG82ZTlPbDBBS1hPc0xTaWNqaVFPSURldkxWbGZlbUcwS0NPekd6VXkyeVNl?=
 =?utf-8?B?U1pGQVBPK21YeXZWampPWEJGbE4rSlowQ1VRN1g5QVdTY3lYaCs5SWdZZkJx?=
 =?utf-8?B?VU05TUxmSkFVS0VPNllqUXRCbTloMXdFM2lQRkJHbVBlZi8xUzcvaDlyMUN0?=
 =?utf-8?B?QnNGYVRYT3VkTDEwR3dNMyt3VTdYVWZCOTRHRldQejRBQWE3WjdvK3EwK2FC?=
 =?utf-8?B?R3JYL3VmU2JodUFzdWMyejJKNDh1TjIyT0pzN01GRFQ0RjVndFMzWEJxMnVD?=
 =?utf-8?B?c3E2aVN4eGFWeWZZN2IrZk5Ga3FaUXZpUmJ6c3NIY2pXbHFZWXdpaHVIT2JB?=
 =?utf-8?B?TThaTmpleDdycU1EcTBzRjFicGJxT0FBRTdzdW94NENhSndqcmVDbnMxS0ha?=
 =?utf-8?B?TExUR1hvQmVMblpyTnZXd29FNDQ4dGFlUzZ3UjFjVzlKekJJSVNiWXlSMXdz?=
 =?utf-8?B?eWQ1OU8xMHQ5Und4Z05OOXdsSGxGbmJLcHhGQkNIb3UxczJFeElsell0WDBU?=
 =?utf-8?B?WEo2TnZ5ZHJjUWdVdUs4WVNIN3NYM1lTdmRLd0M4Q2RLTVIvL0tQOThSVnl4?=
 =?utf-8?B?dkF3bCtpMitra1VObDZzQTBzdzJweWhqVjFoRzh5U0t5UG5aUDNqNzhvaXVC?=
 =?utf-8?B?VWpNays3Rm9NNnJ1Tm9zdWtQNll5cXg5VEZpM3lvdXhlNnN5eXVVendGejUw?=
 =?utf-8?B?ck12UUN5a01vTFc3eUMrREhlSFVId0xXdWtJc2twOTJFbUpaUGxqWUdhYWJn?=
 =?utf-8?B?U3NpMWdVVU52V05paHoxZnJ4cGV1bnBLUXlLb3k5M1Z1ektrQWdSY3cxQnU5?=
 =?utf-8?B?MGNkTkxhbGUvYUs2WWs4OTJPQjUrUlh1eEZHUTJGTU82TU1BdHFMTjVlcUJG?=
 =?utf-8?Q?ZcDnaomoSc3mbFTia7VfSVPB/B21BG6aSwijmn+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef37f3a6-31fe-4ecc-3b71-08d8dd6e0376
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 11:26:24.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIEcmdAlq2jaKBYlEgxHPn6vnLk37zuq8W9G09oRO30YHx/YK/APFs2bAI+KJR+mFzm0Hu4qKppTVEt1wAAWx+2VvVp2OI5u3n4JiPerdzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5949
X-OriginatorOrg: citrix.com

On 02/03/2021 11:21, Jan Beulich wrote:
> On 02.03.2021 12:17, Andrew Cooper wrote:
>> On 02/03/2021 10:45, Jürgen Groß wrote:
>>> On 01.03.21 18:00, Andrew Cooper wrote:
>>>> These dumps were produced from the RELEASE-4.14.0 tag, with the
>>>> abi-dumper
>>>> tooling backported from staging.
>>>>
>>>> For each stable library, add a PKG_OLD_ABI variable pointing at the
>>>> 4.14 ABI.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Ian Jackson <iwj@xenproject.org>
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Juergen Gross <jgross@suse.com>
>>>> ---
>>>>   tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump   |  924 +++++++++++
>>>>   .../abi/libxendevicemodel.so.1.3-x86_64-abi.dump   | 1491
>>>> +++++++++++++++++
>>>>   tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump |  719 ++++++++
>>>>   .../abi/libxenforeignmemory.so.1.3-x86_64-abi.dump |  847 ++++++++++
>>>>   tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump | 1199
>>>> ++++++++++++++
>>>>   tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump  |  597 +++++++
>>>>   .../libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump  | 1711
>>>> ++++++++++++++++++++
>>>>   .../libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump |  239 +++
>>>>   .../libs/abi/libxentoollog.so.1.0-x86_64-abi.dump  |  882 ++++++++++
>>>>   tools/libs/call/Makefile                           |    2 +
>>>>   tools/libs/devicemodel/Makefile                    |    2 +
>>>>   tools/libs/evtchn/Makefile                         |    2 +
>>>>   tools/libs/foreignmemory/Makefile                  |    2 +
>>>>   tools/libs/gnttab/Makefile                         |    2 +
>>>>   tools/libs/hypfs/Makefile                          |    2 +
>>>>   tools/libs/store/Makefile                          |    2 +
>>>>   tools/libs/toolcore/Makefile                       |    2 +
>>>>   tools/libs/toollog/Makefile                        |    2 +
>>>>   18 files changed, 8627 insertions(+)
>>>>   create mode 100644 tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump
>>>>   create mode 100644
>>>> tools/libs/abi/libxendevicemodel.so.1.3-x86_64-abi.dump
>>>>   create mode 100644 tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump
>>>>   create mode 100644
>>>> tools/libs/abi/libxenforeignmemory.so.1.3-x86_64-abi.dump
>>>>   create mode 100644 tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump
>>>>   create mode 100644 tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump
>>>>   create mode 100644 tools/libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump
>>>>   create mode 100644
>>>> tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump
>>>>   create mode 100644 tools/libs/abi/libxentoollog.so.1.0-x86_64-abi.dump
>>>>
>>>> diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
>>>> index 4ed201b3b3..37a7db5395 100644
>>>> --- a/tools/libs/call/Makefile
>>>> +++ b/tools/libs/call/Makefile
>>>> @@ -11,4 +11,6 @@ SRCS-$(CONFIG_SunOS)   += solaris.c
>>>>   SRCS-$(CONFIG_NetBSD)  += netbsd.c
>>>>   SRCS-$(CONFIG_MiniOS)  += minios.c
>>>>   +PKG_OLD_ABI =
>>>> ../abi/libxen$(LIBNAME).so.1.2-$(XEN_TARGET_ARCH)-abi.dump
>>>> +
>>> Any reason you don't add
>>>
>>> PKG_OLD_ABI =
>>> ../abi/libxen$(LIBNAME).so.$(MAJOR).$(MINOR)-$(XEN_TARGET_ARCH)-abi.dump
>>>
>>> to tools/libs/libs.mk, maybe with some way to override/disable the
>>> setting (e.g. by setting a different value for PKG_OLD_ABI just
>>> after including $(XEN_ROOT)/tools/libs/libs.mk) ?
>> The problem is with libraries which have changed in staging, where
>> $MINOR differs by 1.  I chose not to wildcard in ../abi/ to reduce the
>> chance of picking up the wrong ABI to check against.
>>
>> Something needs to be a statement of which is the appropriate $MINOR to
>> use, and it shouldn't be the change to bump the soname, as that is a
>> change we want to be tested.
> Introduce OLD_MINOR or ABI_OLD_MINOR?

That's not bisectable if it isn't in the changeset which bumps the soname.

~Andrew

