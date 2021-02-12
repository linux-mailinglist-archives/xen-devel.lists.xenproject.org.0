Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478B31A332
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 18:04:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84391.158276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAbrG-0002Ne-99; Fri, 12 Feb 2021 17:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84391.158276; Fri, 12 Feb 2021 17:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAbrG-0002NF-5j; Fri, 12 Feb 2021 17:03:54 +0000
Received: by outflank-mailman (input) for mailman id 84391;
 Fri, 12 Feb 2021 17:03:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAbrE-0002N9-6S
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 17:03:52 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba1f990a-4cd9-4d6d-bc79-85ff6111e4fa;
 Fri, 12 Feb 2021 17:03:50 +0000 (UTC)
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
X-Inumbo-ID: ba1f990a-4cd9-4d6d-bc79-85ff6111e4fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613149430;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LQ0+AEYf/60avuYzwyCIOrw+QdwYj4rEREvb8mJXd5k=;
  b=GED2R+ijDJ3Scs6AsrFI5Aeew3dHArmyRmgq+HOQUDdmQ8nhrPTUH9PV
   MyeyT/1nm9/oze+NjFSblPeRxPF+wyrX8KRPymSReEeLPQvY+SWxd9ym0
   xGG/aLK1WtdaZnIlDXErl3zBY1pX7FyN8Mh0bIAM3tDtUGvXEvSgk8TTk
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tjazUEmBJWcxYkmGR61S1Md7C4CHgOo6lMk1cDin8DEP1nI/odxPPIP5b+N1fyVbYpnJ4olEBh
 Uu2OSXEG7b8VJMfhvSePIPbISr5MxSFLa1VzfvBrJitfcpoW0Ssh+bKQi7ghHQI8G4Zqllmxku
 FAUKwyUoS1RH2pMLcUmRkTwo33d6/yZ5uVMlD0fxBmBpLZNOTTwnSjO6nUxdp6gNlLBgvFaIoO
 JiO6OHMgnQEyrL5rMve4HBiTAQF8cCHnkmc8v1k5jTneMzX5XjTRYos4VNOJS97NfyhIF+EGxD
 FWU=
X-SBRS: 5.2
X-MesageID: 37092377
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37092377"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfaWYIA5vucTa0GvEBg4TGQkJsCPZX6Fd9YGpRFcaK3JSr9gtWDvpe+ukbWte1kZxtDjl7jALNBFv1XwbxnAXINGoVGjWtGDEtP9d0a4dCIxMXW2fUL0HVbyNZB7Chjoxi/3pV4vK20sHUQr+m9W7sUP0w4DBi4t5w6GXYlCnl3UkC9OzXiRlfLKgOqAYwujXkJxSK502YFxKmwV3h74TNhRymr/r5JfINuFep4T+v3h01tTK3muqTO75P+K4IIJsKtqiSK0e8Vks2Y3g5m5xSLjLzvXRDMfAiZks/xHCX1RLCH+n10k4OGSTDKNtQSCtrrbGqFX4o0yjqLBM7XmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBABoIiwDpqr3bWUxNXG+E/gzKX9JbPvZWXP0lV2Oe8=;
 b=HFNedp1CnfXGJo7Jfk9gF9X9EZYp9pDi0eO4Cl8INNVt+z9Jn2SeZFspG6imDVUrNYzsUttDPsG++gaJP8mbO7CcfPsGnc8p+Py/XuLE27iCWOkEBJisMby1S5V6K0ixQPEkzm4Z9/7CCOyhNNV0cmh1qjS5vRac/gsIR4d20S64zM0rHrEkn7Ih9CJ+k8O3dAAj2a/fC+bBozGoQ1cSzPjJx9ZRqnK0+d553imxvOnFkVBrIYrlG3AVLfdH761nWYxQmEyMsSCn3JyN6JA2HuaN/CgfaEtlGHVqW/zm1seKtlUCSbkxLarSFcFzInL6QZCYsJOu1bvojYCFYYQ0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBABoIiwDpqr3bWUxNXG+E/gzKX9JbPvZWXP0lV2Oe8=;
 b=Y46An8oxdwvDiBuw5QeZSwBqwKTDu7IwY0pz4XAdnJqoI5FyH6R/fRvSEOAibIP0dapVCGUh76FNqQQJg+UUIHYlAP6ZGyDwR2PJLKiaL70eNa9TOhPtV1WegPkLFbrZsBfrvTlvUCe8WvlKo7Hcx25Lk1hDUKDGvaLL5MginaY=
Subject: Re: [PATCH 10/10] tools/libs: Write out an ABI analysis when
 abi-dumper is available
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-11-andrew.cooper3@citrix.com>
 <6bac2a21-736d-9b07-4ee0-4654b5273ce5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8de5cecb-68eb-5a5d-687b-9b8e6d0721ba@citrix.com>
Date: Fri, 12 Feb 2021 17:03:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <6bac2a21-736d-9b07-4ee0-4654b5273ce5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f2d7714-0df7-4d98-c790-08d8cf782a02
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5776:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5776C0F1B2ACAE0CAF5EC0BEBA8B9@SJ0PR03MB5776.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qg5/S4RwmYv9emHD2CFnOLZveGgQl7cEOuNRlvKVOFG5VOXSsAPBORrGjhHNPcIw84DR2mLFp233u9NB4cgWvi7jcs/KswX3A+UpLtnpE7QOvTsC0iOAifrN/7ClV21YfQrAKYanoqu9WPpwJT4C52+lT5DdU3bnlQ4Aty3h7hEC9R4DqpsyBjeBC4O7JYqw6LTgs/tHrYyJN/B+eOrsKXVE3Lpy6qIeX1I+5ahOsXYeaT43IhLHdOnTLN6dHJU9asPKol53BgsbpEzcNY8zaHvr7kd8LaR94VbRGUe3oQjmsFUs7fXbcZ1ja/iMqHd4qf7GR4A7HRoJL7fJvJ7hDitp2N+MvPmIe/rLaXuhz8ACStg/UiSjHwkf+CypXhRL+YyjOJ2SA5MjwjAoCuIOBOdSGg2AJZik+xay+ortWoFBUtG/rQImd0JGWE3aNk0J1XgwZp4qDSnr47XRdggN2tMA3sDRffXHxF1pvDm8O1NKG4LBTtqS6MKaNzslDlOTXf2Bf/etRy1BEnz3AlxafcKI8TB6UFAgzYBSE5sUIas4fS2T7vhtTezTTyjxxt2mU7gCuwMocmqWmxrOIjpVmB/DrVbpO1ieOfLxjKp3RuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(8676002)(4744005)(31696002)(66556008)(66476007)(66946007)(86362001)(8936002)(478600001)(54906003)(316002)(16576012)(4326008)(5660300002)(2906002)(2616005)(956004)(6666004)(26005)(186003)(16526019)(6486002)(36756003)(31686004)(53546011)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T1p3VnByQWJHOWd1WFVoR3R6OXk1dERxWTdIVjNNOWZjWWdyc2prQ0ZXWXpU?=
 =?utf-8?B?RTB5TWl4bTFkNHJwS1hOVzNFOVNhV05oYzh6anRRbVA5b0J1enRIZ0V0bUVy?=
 =?utf-8?B?S1UwcTJkM2ErRWtBWVZKMkd2TzB4czRrWUtIWm9ZTHJWK2llV2huOHdCMEVq?=
 =?utf-8?B?OVhTMDl5MkdNaERlenNrUWVLY29pOXlVUHpqOFUzdnNydUdPQUhCYmhoZ0Vt?=
 =?utf-8?B?OWxpS2hKR1lybWZURnU1U3c4NEVZSFptNnVBZHYyOC9Gek5JOVNPMER2N25u?=
 =?utf-8?B?dXd6TWd0N3FLRjcvSm4yUE5jbExqMUxRWk9EWEkyUDdSZVJ0L3R1K1JhN0Ru?=
 =?utf-8?B?Rk94S1FoV2pobXBUVFE4NjlZS1dCQ1R5S0RCMlplMWRNQk1uRllJVm91SzZS?=
 =?utf-8?B?eDNTeExUVzgzT2FSR1I5bEpybWpPdm9obm5GbkdNRCtRYzhEL0o0WWJ3bUxE?=
 =?utf-8?B?VlRMYXlPTncwWFpXbG85S3VNV2F1TWgxamg4cmNRV1dPMnBJSTNyTEZPcXdC?=
 =?utf-8?B?bDVRMUFSVU1CdlYzMHE3OUJ2SlhnOEVGUUZtak5XNGJNNWM5d3BGNFhqSWxN?=
 =?utf-8?B?am5EeHJlZlhDelBEaW9PNnVVcmd2VUdiKzJRVEcvMzRkaDBvVUxFRkFZNXk2?=
 =?utf-8?B?bCt0MmVBOXNrKytlQnYyTmp3cTh2R01BOEhBMlU1bmZDSUlCYzlvYXBXYUI2?=
 =?utf-8?B?MnNKYjJJMEZlNmRQYWpMQTQ3Q1B1K1Q3Y2N3VThDYmFQSGNxWUdQM2xrK1Zk?=
 =?utf-8?B?ZXVCRVBYdzJzNmNjWmVyN1pXNm53R3gxcHkydE5mMlFrbkdpWEZydnRQeUor?=
 =?utf-8?B?Y2lMZzVvS21udWVBaTRhQnNIU255ZnU1bGVaRmVEVzBQSXdGYk1SbWQyTUpO?=
 =?utf-8?B?NXZVdzhESjhmaW9wVitleDhWemRTc2hxS0FkOHpVWGgxZGdmYVFCcE9jU3cv?=
 =?utf-8?B?NEhTU1ZkTzdyenBuU0tSN0FVSGZoZytFaE4rMGR5cjRoYVpmQVVhNUt3cHBs?=
 =?utf-8?B?dklvcDJLaUFlazNtWXZ4WFV0cXVXampxNEJMQWxGMUlZQnRmMkhUZVlRbzd0?=
 =?utf-8?B?eTJDTlJ4aTJLREo1OU5nNENDR0Rqd21ma0t0akdidW4wdGRYL2MrRjJIWklt?=
 =?utf-8?B?U2M0V2FVR2pTcml3M21GZXJoRW5HaEVKck9ZMlNvQzdiTHlndHAyZ2czdGVv?=
 =?utf-8?B?NlBwdm9GUlEzY1pYSFB6R0lJYU5VUzFxN1AvcHY1dDRZYXVxOEkyNFVwTzVV?=
 =?utf-8?B?Ynl2REo5QzdNME1KUHZRM0h3N1NaRHEyaHBmK1k5YXI4RE9HNTBWVGx4dVpj?=
 =?utf-8?B?MFRCTEZWZitEU3kyallwbFFOb1N2Uk9waC8wYlZOdU5Qd3lnQzVPMlE4eW8v?=
 =?utf-8?B?b3ZBMC9jN0JxR3ZLM1l4NUFJUUFlVjlROTBaV2lNb1RhWEtxenVLSE5CeUVn?=
 =?utf-8?B?WkZGOVZ6ZDRrQUYraUIxbFV6c0ZUbVp0RnZUM09xaW1POU9YU05FdXE4TFE4?=
 =?utf-8?B?NzZaRlNQVmo5bkZnRzlVRUVIT3hiTkhqMFExT3RMZWdiZGI0b3NIRmRZelVw?=
 =?utf-8?B?Vm9lQVJmMnhPd1dNZzJlR1BFaTIzTnlMTzh5L0huSEFzYmRWY08wOU1SUkM4?=
 =?utf-8?B?azhnOWM5Q2hISXd4V1pkbC9uZ1pCcGR3ckVuNjJmcXhpUzNhbmFoOGVhQzRZ?=
 =?utf-8?B?MGlnNUE4ajYxN0dPVy9YM3F2Q1VabjBjb0dZcG9meUFtdi9sSDVGRm1WL2RS?=
 =?utf-8?Q?sI5kjpkhaLC/cDjShxEVXT+vxOMGzgdsfKdlgIS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2d7714-0df7-4d98-c790-08d8cf782a02
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 17:03:48.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmTpjhMLPhmHNu0ObG/IdrUBOR94sYFUfOCkixhxOkBBQ3VQ3OOifwMMwgQNx5n5dJ758A/mKiM0ej0NVZaRbfrN4+RLWiJ69posrCaFzpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5776
X-OriginatorOrg: citrix.com

On 12/02/2021 16:12, Jan Beulich wrote:
> On 12.02.2021 16:39, Andrew Cooper wrote:
>> --- a/tools/libs/libs.mk
>> +++ b/tools/libs/libs.mk
>> @@ -49,6 +49,8 @@ PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
>>  LIBHEADER ?= $(LIB_FILE_NAME).h
>>  LIBHEADERS = $(foreach h, $(LIBHEADER), $(XEN_INCLUDE)/$(h))
>>  
>> +PKG_ABI := lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)-$(XEN_COMPILE_ARCH)-abi.dump
> Don't you mean $(XEN_TARGET_ARCH) here?

Yes, I do.  Will fix up.

Thanks,

~Andrew

