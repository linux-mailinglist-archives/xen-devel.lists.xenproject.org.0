Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B732ECD4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 15:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93748.176958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBCX-0004WI-JR; Fri, 05 Mar 2021 14:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93748.176958; Fri, 05 Mar 2021 14:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBCX-0004Vt-Fs; Fri, 05 Mar 2021 14:13:09 +0000
Received: by outflank-mailman (input) for mailman id 93748;
 Fri, 05 Mar 2021 14:13:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lIBCV-0004Vo-SX
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:13:07 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fcc8a2b-bb9f-4e8d-9f61-1891cc0f93b1;
 Fri, 05 Mar 2021 14:13:06 +0000 (UTC)
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
X-Inumbo-ID: 4fcc8a2b-bb9f-4e8d-9f61-1891cc0f93b1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614953586;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GBwMzzIBv2c51cbGOKnUT/yzJPxd8UcPS5r3U2+XnNQ=;
  b=bCdZVc/b8WSXK4dclEE298pQBv/OBeDIvCxNB2IoLuxw3o74y0osxTa+
   a/nGiDnVyIr5F0KIsbnDxMbyUJ/soq4/q44aOq5CET6Cz4FbWvkLQmrvh
   PYYgN0sAWCtR8G2oV3y09DEhZlvil7kYuf6r9mvtULfq2Vft8doQH74On
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WvWV7ACoavcuhoL/Ftfuevooblrkv2p8d6+rVpS92f0ZSdDok5VkNpZTmBcvt1wzrdBXpdwHyz
 qkmnvqzBgtdqNYyNvrhCbz00BwPJ0LsJS+k7Ug1LO6vCbFbNEZAHCnJkBs83pkxL1mG8UnQkV5
 tQM+RJBVUgRsy9vRpFdIyjmnOcA28V08UyJXUy1yGj9ZaZnomfMijDI9Efh32vgwuS7hz1HLIZ
 Y7v5SyhCJHTG5ebTnd+C2bx6pjZ+jBqDXUpy5BrdtCwg55rSGDuNvY8+BDKlONkKfnu0447WGz
 66s=
X-SBRS: 5.2
X-MesageID: 38650209
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,225,1610427600"; 
   d="scan'208";a="38650209"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpMBc+AGYHC6fwqQ6lJd9NVHdM8O5a5qNKdpOPEJwaOK5xjmYVWohl+uwPGVtTEQhy44xBrezNk90sItA2oOGpUsCn+5gSm4HrALpHf6NAPnw+t4fgtELeg3ulHLcVrQRUcOpZHewgKgQT4ooJND355ftMPasxc68yy1DtwbMZeQ0UuaxEnDiv/K9AxUXzKcFXjtgxvr+BMOyVvg1pzo3DRaj4s5qTCeOB+gJpKA0/dS5fT1rFRbVSrEN6fA/4k9eJ/RsneajO/HGXgP1IJxXUjpVacelmClABGXykv+jbod+Qhg/AH7OQ+wWfCsmOsgkpZo1f0p+guv2LGe8JP3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db6kB8vegPIS52yAWhLRx1GVwoRd6y5faVL6HOqWIH8=;
 b=m7sqExvWx8d+5eJ9Tqc2DR3ECusgSvpOvnDgC2tviB68E9Q8ubfuav8xNYo64W694riU1DDILWqmAJx5w+fZMKdAcoAd2qTmTP/nBEicB3sdNzykRDL0KFqLsv6Wxj7HuL4LCRW4MGmj+thVHkQDtemTHMTGyoRF86JmZmJ60VSK3Iqf/+6Mnd5wbM5TjP5YmARr78KFRtpe0t8G+UEHsEsARaA1em1C6S1YPP0Bjrav/iaPLfv2Qwa3YWHU3S638E4VN4UnonP4ZxbJ/fOZ6oVzZY07XW4BSI+SQPkHMdbKQGHIAcJ2ZAC30Hxm/22nJ6QNLS9IKeNcYelV74+lcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db6kB8vegPIS52yAWhLRx1GVwoRd6y5faVL6HOqWIH8=;
 b=uJeCpaGFjn9dwoA3IK0jtWkVDAOhcb5V78TkCDDb34MTZwFMOt+XPQy6JKqSQ/WDbQN7II2KiPHhVY2laF+zvXGEcTa4RzZWs+jK100r1LgGg3FHQ1jBnpbVYgvaFmQUakxKoLj+AKegVgVFCkGshhtOGMud9VSuqyXZXgUvp2A=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Ian Jackson <iwj@xenproject.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
 <20210305124949.6719-3-andrew.cooper3@citrix.com>
 <9b4acfc5-6d96-7922-7fde-5d0d543f8201@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from
 public API
Message-ID: <68a69e57-66b5-6f59-39f4-40649112fe40@citrix.com>
Date: Fri, 5 Mar 2021 14:12:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <9b4acfc5-6d96-7922-7fde-5d0d543f8201@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccb14c86-05cb-4f66-07a2-08d8dfe0c762
X-MS-TrafficTypeDiagnostic: BYAPR03MB4744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB47445D096A4D76C908117B9DBA969@BYAPR03MB4744.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tjRaQUeTPcY2elaib/tR7QFD3wZcOkqUqBRWnuReGTRZxVQ4301gkmfi9Nw3E7NpHIsUdeLjmBREHCSQkFw8Uy30rZCGclNFR2G1384vl/oqO8PLmNM4TFfrbfESjmZVqsKf0ezaywmPhawC5gMXn+apSap23L3Oo7bqrqPTSx5f+psOGYwmQ85lMFhzHIh2iGjuCTJWuH/3ulom/m9ApvjxAoc8tPact2CKfw7dIHuk2QUvLR0kOH72SipE1uQlFtZ1wteCRB7wsbsuXhTGsJeA2eTBEb3Ln85nFdF9jHxlE2UEGB63BAi1p/RPam4nV/2MqFx37DWnkpa9JJ1oBooAQV9luvqOKmM5TPcr+YUmCUWbNF0VGKiskaebV1FU2gfccxRUFFlCPRhwJhnQwTVfm9Vz6t66AmLZlm/piEMKJsR5DXB2aLDUszu5cBdjW4PrcLTtOL23Gmv+7ODWOmFonAElS5JcjgfF8SrSuGn12Oxm7JMxWGt0tds/WvdCx2FijeYYuOSzBhISUJyE/ASNYdZQA0r3vK2QdF+GAjWg9zuBBHWCmrsUgpKkaDongLxQXcLR6xwsSrc++L9rNfL7OjQ+SqUV6Mxsx0REvaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(31696002)(36756003)(86362001)(53546011)(8676002)(2616005)(6666004)(26005)(8936002)(54906003)(316002)(956004)(16526019)(186003)(4326008)(6486002)(478600001)(16576012)(6916009)(2906002)(66556008)(31686004)(66476007)(66946007)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NHRkYm1CeU1ISzhKRDFvQ0RKcmVya2ptQUgySzhLUUJyNlhkUlJyWm1LbytF?=
 =?utf-8?B?alc3S25vVC85Y1ZHNmgwYlNBWTk4OUxVM1RRdEFFVjhPbzVkNkxWck5TRlRo?=
 =?utf-8?B?a1I1M0tiU2FuQUJIczBRd3RodG9hMk5wL3JDTnF2MXNqbnV5T3U2ZG5zbGZL?=
 =?utf-8?B?UmROS05VYnNOdTFQWXFWZzlzcjdVREFycGliYm1zeWw5MWRIM1A0enNsTFN1?=
 =?utf-8?B?OUNCSVUyYnNkZFF1Sk1GaGU4eWpzN0JaNWVmTVVmTXhXa0tPalFySENsRFJy?=
 =?utf-8?B?V2ZvYUFlOWJybDR1cmpDcU9wN1FFVy9vR0t0TUhFZDNzekN1aCtwOFdJdWdn?=
 =?utf-8?B?UlorOWV3d3RCK0R0a3FSOE85b0hzY2dRdDJSd0wwVFRUMmNwWTlSVUpxVzFH?=
 =?utf-8?B?Smh6VHpzTFVsMUVDbTBjS3pBbGswMEZ3ZHJwdU5QNHhmS1VHa2t0THNWQlIr?=
 =?utf-8?B?aFIyeEZuMTRrZzdvanhyTklkN1dxYkIzK3BmMnI2ODhzZ1ZNOWxjN051RFZo?=
 =?utf-8?B?VUt0bzBsb3NvTENvYTFCeEUyZFhNV0dsZkdwY3ZPZjNCQmhmdytRUVptSTV6?=
 =?utf-8?B?NTFMRmZudm5WblROUVpJT2dybUgvRGovZlJQa04zaDc0L0VlVHk3QjlVNjBQ?=
 =?utf-8?B?N2FSbVpWRkUxRzdiM3hMdzdReks1c1YvUTU2Qm1tWWlOWC9aQzY4QWl0bDZZ?=
 =?utf-8?B?Nzk5eUM5WmQ0WlR6dDI1V2ZQaWF0a0VGQW9pQnRPaUVIOTZuanVEbWFXWUlt?=
 =?utf-8?B?YUtlbXdGRkVDTzNMdTFwNGZPVDFBcEZnWng0YjBZaGFYZDdkYit2YndUQXdz?=
 =?utf-8?B?NlZuVlpSVVlBWkJ5akVZVy92aEJGZlVBM0F0NTFvWXl3WG00dGhMTGl6Rkg5?=
 =?utf-8?B?M2hna0VNanVXcFpHbUhiUUluTERFaGd4bzV1SGl0cUExRlovNS9HNWVKdmNN?=
 =?utf-8?B?T3d5dXpLaEZMQ2xDMUROem1MMlhYTVoydGo3aExWRDFyR3FWU3hvWmpLdFZh?=
 =?utf-8?B?OFNoZjhYQnBibVU1N0gxd3FBOHpCSFJPVmJmT1JIYWN5aStLUzB5bk5qUTVm?=
 =?utf-8?B?Nzh6RS9LYWRKMEU4aGRwNDVZMGM1alNJajlsRVhmSUJicmhCdFk2RjRNaXBl?=
 =?utf-8?B?SDNEUUtraXJ4VG5tblRqRFZpeXJyN3BOUWlsRVVtV3QyWkE1NTBHaXl6Z2ta?=
 =?utf-8?B?Z1ZkVzNBR0NBdVU1a0hPQ2J5T1d6L3Irc1Jhd2lLbW9WQ2hyUjU1UUE5RnZW?=
 =?utf-8?B?QkZUN0xGbUt5S1NtSnd1L0EyNmhKOHZOWURmYm1HWWZHVW8wNjUxOThKRTVZ?=
 =?utf-8?B?RjBxMC9xVWwwdHZVeDI5WVRibkJHMmFPdGswTHZ5Umc3ZXNRbXZnUVIreXpO?=
 =?utf-8?B?ODBBUXhFWms5Z2hDNzgzVUYvaU4zOTRVRUxqVy8xdU5QMDkyNHM1cFpsaHdY?=
 =?utf-8?B?ekV5Q1k2c1FrU3J0UndXTGVjUXZGa0M0cjdoMU9FVWFLTTJoMXhxaWNUYlJj?=
 =?utf-8?B?MXNnMURGMS9oM1REbjA1WkJScGhpWFZ0YTJBMlFsVms4M0tqdk9HSEJxMldG?=
 =?utf-8?B?K0pWR3hSb2RIS0x1N0wwdmRXd21FdkNmZ0FjR2g5a0V4ckFZNUo0b1QwdnI3?=
 =?utf-8?B?M1RzTGZhNUNzWS9vRG1UdGFzSnBDbjcyRjVvOUc4ZW5BVFgrNTEvdlM3eHkz?=
 =?utf-8?B?YTZqTlMvQ1d6OTk5MFN1Q0FTU1didGlHYXU1V0tpVjlnb3lZV3UydXU3b2li?=
 =?utf-8?Q?XKOJcOu9nsZ1KYbl0BEsCCy+wY8LNi6m2GlCzHP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb14c86-05cb-4f66-07a2-08d8dfe0c762
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 14:12:58.5253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQXhCCiNZz9npAr3D538g5VX5oFagMBfvrikqnFtd5zbLPntgwFJnCPIlTfHcmbvaarmf934U0ySEAvoar2TYzkptjz+sJG4y1GHtaFbcxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4744
X-OriginatorOrg: citrix.com

On 05/03/2021 13:53, Jan Beulich wrote:
> On 05.03.2021 13:49, Andrew Cooper wrote:
>> Exactly as with c/s f40e1c52e4, this is inappropriate for a stable libra=
ry.
>>
>> That change actually broke the build with:
>>
>>   include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t'
>>        ioservid_t *id);
>>        ^
>>
>> as libxendevicemodel.h now uses a type it can't see a typedef for.  Howe=
ver,
>> nothing noticed because the header.chk logic is also broken (fixed
>> subsequently).
> While I agree up to here, ...
>
>> Strip the guard from the public header, and remove compensation from
>> devicemodel's private.h
> ... I'm unconvinced that entirely dropping the guard from the
> public header is wanted (or needed): We use these to make clear
> that in particular kernels aren't supposed to make use of the
> enclosed entities. If a type needs exposing, it (and only it)
> wants moving ou of the guarded region imo.

DMOP was invented specifically so a kernel module (i915, for Intel
gVT-g) was independent of the domctl ABI version.

Improving the life of dom0 userspace was an intended consequence, but
not the driving force behind the change.

Exactly the same is true for stubdoms currently, and I am very serious
about purging unstable interfaces eventually.

~Andrew


