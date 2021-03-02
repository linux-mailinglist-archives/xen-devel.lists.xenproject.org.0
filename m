Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD29B329BE9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 12:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92273.174109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH32R-0007AQ-IT; Tue, 02 Mar 2021 11:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92273.174109; Tue, 02 Mar 2021 11:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH32R-0007A1-Ex; Tue, 02 Mar 2021 11:18:03 +0000
Received: by outflank-mailman (input) for mailman id 92273;
 Tue, 02 Mar 2021 11:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KcId=IA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lH32P-00079v-Np
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 11:18:01 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d78ab7d7-ab35-487d-8d8e-e2da07e68bfa;
 Tue, 02 Mar 2021 11:18:00 +0000 (UTC)
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
X-Inumbo-ID: d78ab7d7-ab35-487d-8d8e-e2da07e68bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614683880;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1+3UQ8r09124ZiDtcgSdGhpoQNNN1AuuzpSWBpCoAGg=;
  b=ebn7Uml61M1CDLj8sMJBtPB4HU0l/Q+sUNHktfFK2ItHyK8DlRQnBDW7
   76ASb1sDPtBFxUsy06A0JaUzs/7blj45KB4tXwS7+AXAiT8sBrZJAOwlk
   KdGf4DFZqRagt571ZRTPQ2K08amux9lk3Y0WbXQWCl9cSo6KenBUx9gy1
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kBAGlCPNB7DpegBl8LUtnmwHpjFU/zQmuX++L11Rh2ZdYCn/RnYTJbCRLlTUZT3Cc4AqjcITLy
 hLxY8H1xOV7nt8USP2bwpnBXcL+TpEBWdAA87bq4T+09DyuJ4ZKalzPXo4Y2m++LaHuc50/3wc
 P+7grxi+MTDcKWV1Lgw4emSxfxXQ4DRrSck0958QY6N1X/U9jRdZMS8cNkDFCT5RzPD/4p+BJk
 U9ERWcDgAujI4VMjdgywovUXbWOhlEddYnrF4FMMjiatmhfN5aqrrqnsyBfBe0Ur45iW0ch4by
 whU=
X-SBRS: 5.2
X-MesageID: 38692060
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,216,1610427600"; 
   d="scan'208";a="38692060"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0vNL4CRtJqFbQtLicS9X1UmdVhrpPVT7BfkIllNwTsYdnbBCzgO6WNf9fogwQwpDxDKwlmetlRfDcTrIrA7RK2S3Vu9C7ItFJzSZ60GmxV8Wyv8VNhStVgPNq8ClJ98kR99sZO3rXdDYaP1G5Rv7TwRF+9VMdgNBjMoMZze8jFBUZ1yNWAa1oIr33NmrwTSExGSI7VxbWD/S9vNJD68DNPKKePQYfLmyxQEF2BXK99yUkJe8IyDkZu3dqFz0cbqkB+uFpIMB5JdfrAF3FFToLz+ozLJ9POplISQSllH3FKKKf3mn0tNbr12jt+gIkuAXvzfshs/P3LBCLpD0PI1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+3UQ8r09124ZiDtcgSdGhpoQNNN1AuuzpSWBpCoAGg=;
 b=JRHPn8C3+FiGrIWO8PssI3VMBEETyDxXCA7E/EbfI95L+nrB3CxMZgg9DGVJQX8cTdhm0X99BKdGoxawUSKdyI42NRwnJTzY858eU4VU+JZpg1uZ6CJWNVmqUmN5bTDmQ0uTDLWQounY5Fj7c8AvvfLD8xgpsVxf3DZpMAHSytH8uc4N7ZeeDb/sbULxhUSm0y/O/knPnkg7/qoQC7VibDiEHUXwuPWVdje1SpGXlpuu1wrvicOq/mFjGeLct48iiUj5GIxRLKmU07qNaxPmqHN/BDRDu2mexHG8ZG5be7rGxXdQSIvneNY8HY6Z8QV/zUrFx3uVooabgq5TLn+z4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+3UQ8r09124ZiDtcgSdGhpoQNNN1AuuzpSWBpCoAGg=;
 b=aKdFcgXSa+r/16ZCXRFA2Zjtrt8PShg7NSAptrRTBxZhXNtrGNL2I6FAsDfjWScc1vM7HnhTOAhaKXvQIeygjaJmRIfpKH+rdIL80XRhBnEU/g0FIb8QFE+QfxaBPGpTtlNRBBeGBlL9X4Lzf0AmI+8wSYGGjuKD3G4skE0o73M=
Subject: Re: [PATCH 2/3] tools/libs: Stash the 4.14 API/ABIs for the stable
 libraries
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
 <20210301170044.23295-3-andrew.cooper3@citrix.com>
 <677223c5-e661-a132-35b8-2e9424817c7b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d53399b1-7053-10b1-b5a2-38244dc2f154@citrix.com>
Date: Tue, 2 Mar 2021 11:17:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <677223c5-e661-a132-35b8-2e9424817c7b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0345.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ad030fb-31f1-4cd3-63b3-08d8dd6cd487
X-MS-TrafficTypeDiagnostic: BYAPR03MB3671:
X-Microsoft-Antispam-PRVS: <BYAPR03MB367131D25026ED1099B155F5BA999@BYAPR03MB3671.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rPmWq2H0bEyS7nXpQ9iGhv/7ZxISPjmfWz+aYe/jYEYF1QMzZ/5nicI3dLM0hxf15CjcraC5Manknqxfm8TxFjKASdu/Jct++WvRkly44oGljrvb8cs8+b5JwBcJJzBOdHhT7NvHVCrZbFssfpZqE6qhiPib9JhirkO/Mdm9D6GRW+EVyi+K84gJVRXKDoYZyac1ITzys4fA6EdeZcbExXjArHkjqboQ3nLxzvUHfckKWaMlUFHNGnu/Ylu5jr/0G9fq4q1ktXZXWULRw2kGbGzwf6Q38uJIiqKtxL3QKStfAfPqRi3O3UuDCbGOXukIBmOYVzenSJFl5EfQGfebbOsFowxXIokcDIhbgH9kIh4c3w13eVbWDYdfHAxSqdP+IdaeIdoPfStbby5qnRtjgIPY62N48PZzNluiJy2CvgNoPdtp0ux86CvaEfoLO10cYcVy+CQ3bdL6Ca3WWdG56fqMgJX9Vd5d5FmJ+JlEQqHhRz+tz9h6pUZXi3ksWGViEPRNRHmSsShEtXdgL9NJhtReTMzv6TJ2YmPDqLEkaan42x1idrw1iDcd25pxGIfcZis0pQ9oik2LV6gLS7HHZYu1QBCpRUBAJ3wmB5xctJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(26005)(31696002)(4326008)(53546011)(110136005)(186003)(16526019)(8936002)(86362001)(5660300002)(16576012)(2616005)(956004)(316002)(6486002)(31686004)(478600001)(6666004)(2906002)(8676002)(36756003)(66556008)(66476007)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bzduS21IVmIvV3FqNjFNTHJlODJnMDZoVGFhUXlZZnFDMWN0dWVHOVZwd2d3?=
 =?utf-8?B?dU1PK25yL3B5RkRPbU1XNjdzd2J3dmVnZldjQnBFSFNCT3ZJNi81Tmw3ZnYr?=
 =?utf-8?B?bHdBQlBiOWYwUDRRdFBPSHl5ZmRPelp6QWFrN1RweTZpdFB3VjdzSjlUeWg4?=
 =?utf-8?B?N3ZTVjFXK1psMjkwUVROWVJXMFdnQU1yL1YvUmFOUi92eXZMd3JKa0RGc2hj?=
 =?utf-8?B?bUVrN0dPb3hiQ1lvV0R4ckd1Zm1sVE9acFRxVTJxZ01KM1FjTzRJSS94V1Q4?=
 =?utf-8?B?Z1V0K0k4NlpHMTBTUUVLZFlSenpOMDd3RENNRXlqZGVCTGtibkhYT2xoRjhE?=
 =?utf-8?B?SE53aWM4VlIvanpPc0cxQlVlQXRMS3M1UjcrQlE2WWtSTWlGVFRoajZvQld2?=
 =?utf-8?B?bWlLT1R4RVlaQTY5dkVzRFgxSFBESExBRGpWTlptVTVJdi8vbVV2TmtDclI4?=
 =?utf-8?B?aTlXRzVtUitKMURZdUxsU2w0b1V6ZVBGNURhb0VnQWZ1M3hUWW9DUGlFMnFE?=
 =?utf-8?B?dGlRWjNsSTU0YndzUGF5d01jTFU2eHBkbVRweDVOQnJNUWNwcUFYY0xhUHFh?=
 =?utf-8?B?UUtJNUFmRzlzVHdldFoyMzdIODhsVWk1QlhEZ0Zua0FRVWE1b0U3dzlNbXJJ?=
 =?utf-8?B?VE9rUWZZR1hjYmpBQ0hTSTVKL0lQNFh3aTNwZS9uOWl6Z1lKUjFDRWhYV3I3?=
 =?utf-8?B?aGRHekUzcTZsTGxXbVZYS25yNExLWlluN2dMcmo4MlMxdm9QbVhVTUcyLysz?=
 =?utf-8?B?Vm9TTmREVzBMOWIxQ0ZKM0ErM1FqYXR6NUJoWFJwWndtNFN2OUtaRjcveTJl?=
 =?utf-8?B?cXptWkdhQlV5MktMSTRzVGdaSEllU29GSkNVdmJnVEhlMEltNTE0T0lLNGhk?=
 =?utf-8?B?TkR5SnRobjFVT1g3bXBEdWp1M3AyandUTjNESy80eHoxcm1BR0F2L2tic2du?=
 =?utf-8?B?ZGRSOFpGbGdlZWlWUTlTdzBEZDBvdUowdEpjb2pmTnRDTjFJWkY4enZmT3BH?=
 =?utf-8?B?WlErdlRtam4xcVZDeEpwRENlcDBoVndwRmNqaDAvbzYxK2RaSms3eWdBUXVN?=
 =?utf-8?B?R25wMEtOeUc4ZUc2RFVLakhTQmtQYUpYbkRTdTVaV1laRXVsZlNGUXloQk5O?=
 =?utf-8?B?UDh4akgzbldncEphRHlScUtSQ292bUxEL2p1WE1ZZURXTlU5UWhoRDVUcEdU?=
 =?utf-8?B?aSt6bms0eFJ6dDJ1UXFqeERDUnh3SFFqbVFBT0FXRDEwYnhMSWxacjJOZk1V?=
 =?utf-8?B?U3NIK0oya09JQ3R4Y25wbDJFUk1RWGEvQnlqK0UzdHZ1Z200eVFLeUZLZlJW?=
 =?utf-8?B?bFN1UVB6U3hJRElKYVJwTWhDRGJyNG9Gd0h0eFQvRGlFN2xzWGhxdU1FWk1W?=
 =?utf-8?B?ZGpOMjJlRmFoTEdXRGgrSHpSaGtQNk9tU2YrK2U3NnF1eG9wVDRCb0wzTXhC?=
 =?utf-8?B?bjBNVEFnWmh6U2ZzSnY3ZnVCWWxtdWpnWEhORWs3VUpHbk05WUlJWEpFRTFr?=
 =?utf-8?B?WFJ1R1lPcENQUGFQbjdtK2RNSGFWTU1KZWI4aWh4d1pET0NWUVJJbUJSQ0dM?=
 =?utf-8?B?eDF2RWZsVFhUUHJoMDlqMGhOSUlBWHBLUkZBekRlMys3MGZHRTVpM0lxaDUx?=
 =?utf-8?B?LzloVDUrK3Jwcjd3bmQwQXZaSnBhdi9PSVFlK0twc05FZHNhQm1kUC9tQ0Vl?=
 =?utf-8?B?Mzk0K0JrMG5qL0JDbTBzQUVUU29pRUlUV1V3RzlzQUt5dm1LeDR4REp2Sm1F?=
 =?utf-8?Q?Cj5OLN9bG4WKMSHj8yPUffnNuaORRzekCRp6wnf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad030fb-31f1-4cd3-63b3-08d8dd6cd487
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 11:17:56.6463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6yvEREX3L7b/QRkFvmDVHCbKcSkAXN9ynF94mOxj7a0D41xkXpkz3uPUYrQMlPWFvuC222v1b/qO5sCgVbb820GgrzujmnLnXxyjM92ZCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3671
X-OriginatorOrg: citrix.com

On 02/03/2021 10:45, Jürgen Groß wrote:
> On 01.03.21 18:00, Andrew Cooper wrote:
>> These dumps were produced from the RELEASE-4.14.0 tag, with the
>> abi-dumper
>> tooling backported from staging.
>>
>> For each stable library, add a PKG_OLD_ABI variable pointing at the
>> 4.14 ABI.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Ian Jackson <iwj@xenproject.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Juergen Gross <jgross@suse.com>
>> ---
>>   tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump   |  924 +++++++++++
>>   .../abi/libxendevicemodel.so.1.3-x86_64-abi.dump   | 1491
>> +++++++++++++++++
>>   tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump |  719 ++++++++
>>   .../abi/libxenforeignmemory.so.1.3-x86_64-abi.dump |  847 ++++++++++
>>   tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump | 1199
>> ++++++++++++++
>>   tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump  |  597 +++++++
>>   .../libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump  | 1711
>> ++++++++++++++++++++
>>   .../libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump |  239 +++
>>   .../libs/abi/libxentoollog.so.1.0-x86_64-abi.dump  |  882 ++++++++++
>>   tools/libs/call/Makefile                           |    2 +
>>   tools/libs/devicemodel/Makefile                    |    2 +
>>   tools/libs/evtchn/Makefile                         |    2 +
>>   tools/libs/foreignmemory/Makefile                  |    2 +
>>   tools/libs/gnttab/Makefile                         |    2 +
>>   tools/libs/hypfs/Makefile                          |    2 +
>>   tools/libs/store/Makefile                          |    2 +
>>   tools/libs/toolcore/Makefile                       |    2 +
>>   tools/libs/toollog/Makefile                        |    2 +
>>   18 files changed, 8627 insertions(+)
>>   create mode 100644 tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump
>>   create mode 100644
>> tools/libs/abi/libxendevicemodel.so.1.3-x86_64-abi.dump
>>   create mode 100644 tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump
>>   create mode 100644
>> tools/libs/abi/libxenforeignmemory.so.1.3-x86_64-abi.dump
>>   create mode 100644 tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump
>>   create mode 100644 tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump
>>   create mode 100644 tools/libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump
>>   create mode 100644
>> tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump
>>   create mode 100644 tools/libs/abi/libxentoollog.so.1.0-x86_64-abi.dump
>>
>
>> diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
>> index 4ed201b3b3..37a7db5395 100644
>> --- a/tools/libs/call/Makefile
>> +++ b/tools/libs/call/Makefile
>> @@ -11,4 +11,6 @@ SRCS-$(CONFIG_SunOS)   += solaris.c
>>   SRCS-$(CONFIG_NetBSD)  += netbsd.c
>>   SRCS-$(CONFIG_MiniOS)  += minios.c
>>   +PKG_OLD_ABI =
>> ../abi/libxen$(LIBNAME).so.1.2-$(XEN_TARGET_ARCH)-abi.dump
>> +
>
> Any reason you don't add
>
> PKG_OLD_ABI =
> ../abi/libxen$(LIBNAME).so.$(MAJOR).$(MINOR)-$(XEN_TARGET_ARCH)-abi.dump
>
> to tools/libs/libs.mk, maybe with some way to override/disable the
> setting (e.g. by setting a different value for PKG_OLD_ABI just
> after including $(XEN_ROOT)/tools/libs/libs.mk) ?

The problem is with libraries which have changed in staging, where
$MINOR differs by 1.  I chose not to wildcard in ../abi/ to reduce the
chance of picking up the wrong ABI to check against.

Something needs to be a statement of which is the appropriate $MINOR to
use, and it shouldn't be the change to bump the soname, as that is a
change we want to be tested.

(That said, I'm actually struggling to get abi-compliance-checker to
catch all the things it ought to catch.  Its better than nothing, but
has some shortcomings.)

> You could even disable the ABI check if there is no map file
> provided, which will be the case for all the unstable libs.

That would be nice, but I don't see any way to do it.

~Andrew

