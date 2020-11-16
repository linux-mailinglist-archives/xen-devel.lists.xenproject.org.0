Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13342B3F12
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 09:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27751.56332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keaCs-0006ym-Fg; Mon, 16 Nov 2020 08:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27751.56332; Mon, 16 Nov 2020 08:49:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keaCs-0006yN-C6; Mon, 16 Nov 2020 08:49:50 +0000
Received: by outflank-mailman (input) for mailman id 27751;
 Mon, 16 Nov 2020 08:49:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ptU=EW=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1keaCr-0006yG-A4
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 08:49:49 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 358242b3-47a0-4504-909b-9dab8a02007c;
 Mon, 16 Nov 2020 08:49:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4ptU=EW=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
	id 1keaCr-0006yG-A4
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 08:49:49 +0000
X-Inumbo-ID: 358242b3-47a0-4504-909b-9dab8a02007c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 358242b3-47a0-4504-909b-9dab8a02007c;
	Mon, 16 Nov 2020 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605516587;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tjbRTqVWBMlfblAmGAgZ3Vr+MF1XNOo52OW9Fn4GMzg=;
  b=iAPl+jxD7Ii95OUQKRulVHf4nSHrrF16npZ/6nhPPBNFUvD2NQcayMcE
   34C1UwMUzpXJ5TDRDLGSI7oEfnwqe30GzxgVdz2AzG14HarKhgSGN2kDm
   +rZXbkoGiVgNGDVvE7KWP9flieG3eTezCyS9wGRIfT5vaPAfb2zYC8oRD
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +zgY5I1TiHFQbeLuaADvbIL0ETfT5Vf9hxCfmcbImZz4VJz9Wb0OPTUA+wr6Zz8WwnJ2OJiIQb
 s9v8HiR75ANDMQxljM2bWzaM8U5ZFuydV6pNW5US3xEEFJhdrBCzEb1BK/WHADN8/Q39/hHDwn
 FQuFqQQxtbAD41DC6jQPnasyBifEWfFmnYzBuf7YZht1d6IyQJIY36CdwpV83IRic4eFstd87d
 64Zp6v9BOCVBzPV+yl30o30/oDOyJBDTfjp1tU0oqzr5Eb7KKOc7MPDgD4ozv65AQYnqVYUC+W
 7fM=
X-SBRS: None
X-MesageID: 31251317
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,482,1596513600"; 
   d="scan'208";a="31251317"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkM8cLSjEOJmg0uY+E9w35ru4JUvIcFrIEQiPBOXFbf150LfZEMGq14bUVKdYpBlPa7DN3sg16MCGm5yuAU9kBVUfGGTJtKG0LFG0Pmv0uxv7u9e1iEYllZnOLDg1TuHwbeGMM/Y6NXIA95PfdRvy7QamAT+wQ6tgPlZmP9kPjNFtFfhKiu96R3dbZYBE3Fbg0GfmvxEI25blqoNyzB3J4//S4TJHRWdrpTamwORXxiVEp68RjPPRX7roNBDnp7l2bDAXX1QJ+A1aRgge0FLICZFthGrErZ0Yl6h6M8RAIVGQzLJ2QsD9tPW4jLbpoHhpTOkc9NqQi6Fs5gkx6tVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX4FJ7iXhQ20bOkUCJb2gd5xzkGc8wkN/rh6EaE5nFg=;
 b=VHZGS87T0hcMTVZlxLVJkmuJDM2ZUGB56PhC/GihODcG0uIIe0f7YK9+BMz1CkOthJtmTDIlydHEYVQjeXlEESTi6kVar6zVNCYTTnCx/SQirhDNF1cVcIIVWDuVxPBoGKsVqLnPSLVYmSRhy5+v8NHIs5PzP2q9ntvLWjNTMCNkxyezRMerP55be3TTqtNlGfZhFAQIpCcZDxUnC7mG+ofLSDYnVHz7SMt0GNlp4MLPM/DYVh/YIs6KGeBwEacdeQV/PjelREIVh6IVM6mkFPrnaYTJ6wv++OicvX8/W1FUhCjhldWd3sMtRP4sM46Dgmg5bi/qJI8BG76e9HU1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX4FJ7iXhQ20bOkUCJb2gd5xzkGc8wkN/rh6EaE5nFg=;
 b=JMmas0sFmAjLNC0M9xWs/kHb8Ifw2uRPoHgp61YY58jLL/XFYVBXESPYQiYuup7FdEr3yrs/7atr2x4+B9K9DkK5oq6O3HU4q5dmzOFskNa4fpAKn+sQOf7QnDabULoDNWvGA4cDtLp9M5KIJLTY0xw8sCWSR5xC4tBpfSy7iZA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Bjoern Doebel <doebel@amazon.de>, Edwin Torok <edvin.torok@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
CC: "wl@xen.org" <wl@xen.org>, "jgrall@amazon.co.uk" <jgrall@amazon.co.uk>,
	"elnikety@amazon.de" <elnikety@amazon.de>, "iwj@xenproject.org"
	<iwj@xenproject.org>
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
Thread-Topic: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
Thread-Index: AQHWueBOCvB9vAICU0yP2x4L4whcVanGT5cAgAQX64CAAA53Qg==
Date: Mon, 16 Nov 2020 08:49:42 +0000
Message-ID: <DS7PR03MB5655942EF2116BD30A050645F6E30@DS7PR03MB5655.namprd03.prod.outlook.com>
References: <20201113141823.58712-1-doebel@amazon.de>
 <5ac379ad-33fd-2973-dfdb-9e06ea539809@suse.com>
 <0e6b09fe-ffc4-195f-1b6c-67abc0cff92c@amazon.de>
 <c1352a2a-112a-966f-7410-b917cabe1d91@citrix.com>
 <39f0b457514c3b6bcc7419d9eaf5770a5c073333.camel@citrix.com>,<73515688-5db2-c81b-48fb-6c5dda4a34b1@amazon.de>
In-Reply-To: <73515688-5db2-c81b-48fb-6c5dda4a34b1@amazon.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf10ade3-654e-4143-e548-08d88a0c8fe9
x-ms-traffictypediagnostic: DM5PR03MB3355:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR03MB335599A9E355A7834A1F1DE2F6E30@DM5PR03MB3355.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U1tRzwRH+lB7S9cjUaqvtoUR19BDx284u3tk/5uBJ7NlUN48o9JrxXmVsFJPUo8tvu73nMdCEqYqfkN9uc2jQJXLVu+nOn7CbjHTsksvfstKwk0YPIdTs3GQVbb6SamRfgd2lQnK/yOfXR3vGOzYepTwSOPvwFa5MzRq+TA0N79u2sr9IvHHfq3jcLRUKuocckbne70/GzaDUL9HmqQenWUp5lpwOKOETx+TMuxhpF6qgWFfb3IxscBNtSybN3Rx7yognJcDBsUAH622yb6AaJcGn/vY9RbKRlnO9j519cliez+qbHux9EcwmPfy3WyWFcCHEWyeLePSZYBboRzO0/KIfSYB5Zw86s+FypNgAn4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5655.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(366004)(136003)(396003)(8676002)(44832011)(66446008)(71200400001)(64756008)(9686003)(316002)(66476007)(86362001)(52536014)(66946007)(76116006)(66574015)(55236004)(53546011)(110136005)(66556008)(4326008)(2906002)(91956017)(6506007)(55016002)(186003)(7696005)(54906003)(5660300002)(33656002)(6636002)(83380400001)(478600001)(4001150100001)(966005)(26005)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: GnfePHoRTLTiPEaj1g0aQI0D4DH/gGD5EPAwHMHetpPN+rLgS1DfWE90YOSvC1gUPjdSclePcfwnOKSqwvre8oiMH0bX36hj+/LIizishtcj6UWPyfatxGssegf9ZABqGPy/ohIJqNda3HwITGe+4y9o69cBwq23H7Q9e/3UM+KjlWTQv3znsDCfCQn/RnEC8VBO+hMJQiaHpw+QTEMyqvvHEqnO4dX0wSF3Sl64vd9IqYWHSKqKOW6JgRpHK4+TSZHcfz2ocajPWGL50jY9sVYJW6hhReLBlgIKcidAIJYnHjERM+5apw/tbXUXhUU3cSEuTXWdVPp09rDwVmpPHDscE+m6FMCtdZLKzqCQvmA9C7o2Px8pdcCStzWyoO03kWeJW1HpZSslIvzChQQbRdrsMUzlKUpzykjgx8Zce0zM7+7Tu7TdnF9h4fU0EJgFNknquRU4GJj7jTvfFi0BJ2KyePghGmqsspVssk/Vl6ZLDYdTJCvOyBmuw/DpwvMsBsy6WTk6PqM1vdPTLgwmKGSOmMVLx1RN5U+7IBfzgAaT87yMk/hVb4GufxFuiJm1WBUOvPzQL7mI9akT/0R2c/gO4j79jjHVDQBDHKRdW3XSTtQzYdO9z5vrvIdOpwVMmRKOCybZ7Ujw/+yF05EYaA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5655.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf10ade3-654e-4143-e548-08d88a0c8fe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 08:49:42.9963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UydBldzFjo1te3OZh54rQz+hTje+nVcYDv4ArmVzPtnbGBJ5gks845xvdSRJTThLTfvDB+HSlf3OdTHDSVlwQUzac8C74wlKzmDiUUrcl/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3355
X-OriginatorOrg: citrix.com


How about keeping such an ID in xenstore itself in some kind of /meta hiera=
rchy where xenstore could also keep stats? As long xenstore is running this=
 information is easily accessible for outside tools.

-- C

________________________________________
From: Bjoern Doebel <doebel@amazon.de>
Sent: 16 November 2020 07:53
To: Edwin Torok; xen-devel@lists.xenproject.org; jgross@suse.com; Andrew Co=
oper
Cc: wl@xen.org; Christian Lindig; jgrall@amazon.co.uk; elnikety@amazon.de; =
iwj@xenproject.org
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup


On 13.11.20 18:23, Edwin Torok wrote:
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open attachments unless you can confirm the sender and know t=
he content is safe.
>
>
>
> On Fri, 2020-11-13 at 17:13 +0000, Andrew Cooper wrote:
>> On 13/11/2020 16:56, Bjoern Doebel wrote:
>>> On 13.11.20 16:36, J=FCrgen Gro=DF wrote:
>>>> On 13.11.20 15:18, Bjoern Doebel wrote:
>>>>> Right now we do not have a mechanism to determine the version
>>>>> of the
>>>>> currently running xenstored at runtime. As xenstored runs
>>>>> throughout
>>>>> the
>>>>> lifetime of a Xen host, this may lead to problems when newer
>>>>> user space
>>>>> builds are staged. Then, the running xenstored will no longer
>>>>> match the
>>>>> version of the installed xenstored.
>>>>>
>>>>> To allow users to always identify the running version of
>>>>> xenstored, add
>>>>> a linker-generated unique build ID to every xenstored build.
>>>>> Add
>>>>> functionality to log this build ID into a file upon service
>>>>> startup.
>>>>>
>>>>> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
>>>>> Reviewed-by: Martin Mazein <amazein@amazon.de>
>>>>> Reviewed-by: Paul Durrant <pdurrant@amazon.co.uk>
>>>> No support for oxenstored or xenstore-stubdom?
>>> Your suggestion further down will apparently help for stubdom. I do
>>> not speak ocaml at all - how do we address this?
>> CC'ing Edwin and Christian who have done the bulk of the oxenstored
>> recently.
>>
>> It sounds like it might not be possible right now, but would be
>> possible
>> with a future plan to switch the Ocaml build system over to dune (the
>> new/preferred Ocaml upstream toolchain).
> See here what is possible with Dune:
> https://dune.readthedocs.io/en/stable/dune-libs.html#build-info
>
> Would the output of 'git describe --always --dirty' (perhaps combined
> with a build date) serve as a useful build ID?

The point of the build ID is to verify something like
"binary-equivalence" of two builds.

* a git hash is not sufficient because different git hashes may result
in the same binary to be created (i.e., if there is no code change in
the target binary in between those two builds)

* a time stamp is counter-productive, because then you'd have to
recreate this timestamp every time you want to re-create a build

GNU ld's --build-id claims to perform a checksumming of the "normative
parts of the output contents". Whatever that means. ;)

>
>> If it does end up being an XS_CONTROL sub-op, we can implement it at
>> a
>> future point when we can usefully answer the question.
> Wouldn't using readelf on /proc/<pid>/exe give you the running buildid?
>
> readelf -a /usr/sbin/oxenstored /proc/$(pidof oxenstored)/exe | grep
> 'Build ID'
>      Build ID: bdd5304c8984ed22570d51308ae8717d03fe60ae
>      Build ID: bdd5304c8984ed22570d51308ae8717d03fe60ae
>
> readelf -a /usr/sbin/oxenstored /proc/$(pidof oxenstored)/exe | grep
> 'Build ID'
>      Build ID: b44ff99b216db7526e3ee7841068d584cc9c2b95
>      Build ID: bdd5304c8984ed22570d51308ae8717d03fe60ae
>
>
> When you're inside a stubdom it is probably not so easy though.

Interesting. I had not considered that because after upgrading xenstored
to a different version, the running xenstored's /proc/$PID/exe shows as

# ls -l /proc/$(pgrep xenstored)/exe
lrwxrwxrwx 1 root root 0 Nov  9 14:06 /proc/3528/exe ->
/usr/sbin/xenstored (deleted)

But you are right, one can still read that procfs file. Nice!


Bjoern





Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



