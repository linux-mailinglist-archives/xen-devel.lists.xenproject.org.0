Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9187A350238
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 16:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103983.198377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbri-0003A8-3f; Wed, 31 Mar 2021 14:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103983.198377; Wed, 31 Mar 2021 14:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbrh-00039j-W8; Wed, 31 Mar 2021 14:30:37 +0000
Received: by outflank-mailman (input) for mailman id 103983;
 Wed, 31 Mar 2021 14:30:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NSS5=I5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRbrh-00039e-1O
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 14:30:37 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fd5cae3-7c8a-4f30-87be-a2b5bcdacce0;
 Wed, 31 Mar 2021 14:30:35 +0000 (UTC)
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
X-Inumbo-ID: 0fd5cae3-7c8a-4f30-87be-a2b5bcdacce0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617201035;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=29MeVBnAQCnCL295KsDDathRGJRlDhNRAbNep5HZn1Q=;
  b=fuRIrA5orwvTag9FHutZPewBdW4bsScX6ZtUHPxPHgGFWTwjh5AHZSg8
   xtuyqOjAUGIA/QM/3afsXn3BlVdKS3F030m9CThqfXwLhEDG/Qxhtx41L
   n77toHJTDddmlccoMd/RaKMlI/aMULU5OtFMSEp/VeSzbm2a3obM8fkUY
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: opiIlWuT8OSTnTHdCWAYUl+hML+XNx1B74DF3BJoDLioUJXJI1Ib/1uBUKlpqZQRwWYtYrAB0X
 1nIUtbTFRnS+froMnqRd5wY+j7RaFCqMbqWExcyQK6LlqNLe804w75tHPhZfBqrQdiK8+9a/0q
 MIbu6l+F/m6PRGNY0BwJzQ1+80OPqrWecdDFFkF5eTs+BQ02jwVMo3Q25e0/psphgbMb18TTfM
 l97EAAk3NLqOFMjj1RtRrBLu86n2gtnHlbuKQzI2fOnBy0nd3K9uZTmq5AwIvm/GgpT+wwARua
 Pk8=
X-SBRS: 5.2
X-MesageID: 40441364
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:oN1SxqxFQA7rBlPLO/8vKrPxpe4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheVysd07o
 0lSaR3DbTLZmRSpczx7BCkV/Mpx9ea+K6l7N2utEtFZysCUdAC0y5SDAGHHkpqACxPApQkHJ
 SRj/A33QaIU3IRc8i9Gz05T/HOzue73q7OTDwnI1oc6AeIhS6187KSKXSl9zoXTj8n+8ZEzU
 HriAr8j5/Dj9iazVvm23bX/9BqnrLau6N+LeitruRQFTn2kAavY+1aKvC/lRQ4uvum5lpvsP
 SkmWZHA+1J53ncfn64rHLWsmGOvgoG0HPsxUSVhnHuu6XCNUsHIvBcjoFUeAax0TtDgPhA0b
 lG12/cl51bAQKoplWY2/H0VgpnnkfxnHw6keR7tQ07baIibtZqzbA3zQdwKtMtDSj64IcoHK
 1FF8fH/stbdluccjTwonRv6MbEZAV9Ij62Bmw5/uCF2Tlfm350i2ECwtYEo3sG/JUhD7FZ+u
 X/NLhynr0mdL5ZUYtNQMM6BeenAG3ERhzBdEiIJ078Ka0BM3XR77n6/asy/+PvXJAT1pM9lN
 DgXTpjxC8PUnOrLffL8IxA8xjLTmn4dy/q0Nti659wvaC5S6HsNSGFVVAyg8qtq/gSGaTgKr
 WOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+W1/mmLOIFqTa8sjgNNrDLrvkFjgpHknlBG
 EYYTT1LMJcqkSiWnryhgnNS2rgE3aPuK5YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gxZ0
 txILTul6uhvmmo9WPU72FkUyAtTnp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1tiVc/MCR
 VeoF524KqzKJSVyUkZepaaG1Pfq0FWiGOBTp8alKHG2NzsfYkgCI06HIZrEx/QKhBzkQF2iW
 tKZQMeXHXDHjf2hajNtu1SOMjvM/1HxCaiO4p9tG/Wv0T0n7BTelIrGxqVFfOxrSlrbTxOnV
 F1+7IYm9O76EqSAFp6pv85Pl1KYHmQG5RcAm2+Fclps7j2ZQB9SnqLjzSGixc1PnHn7VkWm3
 aJF1zqRdjbRlVaoXxWyaDs7Rd9cXicZVt5bjRgvZR6DnmugAc67cabIq6y2XCWcF0M36UUNy
 zEeyIbJmpVtqaK/Q/QnDaJDnM9wJoyeuTbEbQ4arnWnnegMpeBm61DH/ha+v9eRZnTm/5OVe
 KUYAmOKjzkT+svxgyOv34gfDBut2NMq4Kc5DT1qGyjmHIvC/vbJ1prA7kdPtGH9mDhA/KFyo
 9wg945tfa5W1+BIeKu2OXSdXpOOxnTqWm5Q6UzpZdYsbk7ubFzE5PYOAG4o01vzVE7NoP5hU
 keSKN07PTdIYdpZdUVYD8c8VwzltiDRXFbwDDeE6s7ZxUqgHDaNd/SvOaNprorH0GbpAz/fV
 OY6DZQ+v/ZXy2Fkb4WYphAUVh+eQw58jBl+ujHaojbTAOtfOtH9EChMnC8fKRGIZL1bYk4v1
 J/+ZWQg+STdyDkwwjesjtwP7JW/w+cMLKPKRPJHfQN7sezNluNiLa7+cK/jD/4Tj2gdkQT7L
 c1BnA4f4BEkTktjIo+zyi0ROj2uyse4iVj3Q0=
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40441364"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ2ZVcmzwtVdhSN2Fh6G9t5pJP2Ghl27OI/ziwciDFn5e3xtMgRz224dMsQNAyNbd4TLO22HYJ+64EraFIP1MNG8mjZ2W4OsLSv+j5eHlV/JN62lL5c3ngltL3JrSKzK1hEpwaKVpeBPC0JKmXXFm1tPgQtrxsr5nXbrslZOgLtnIkmKYLFtmaD+upI1zXEz/bIFtLqniCtVPDrSmZRNyc4FeGiNMVZ50DXf+Nyd7edvrycdfotqkuXZycBqXIwRUiJUT7ft232eJVzSDXMwU0gQH06qb5uSbucFPPwezIPFU5QSi44mifQkUnwI9lCX59I3TRHrWBY+vDnQyddtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29MeVBnAQCnCL295KsDDathRGJRlDhNRAbNep5HZn1Q=;
 b=gW6zSJWHd3Ur4iUsMzSrFEggIm6FdNKKDFJCPVN/vBvpnzAfChImSq6Xzn8cfoRU3J88idW4yrAhnxKLWZEQFmpgiKDBQ0koa84Tmp1RDNXywXdOZNSw0X/oRsxCwQOMzIiiHuF0HAvekxa5VNgmu6dvTzpj7f3t2couTP2HpSMV7W/DbEbCBI3lHCFW+1ies82XYKMLpuPX0g4uHW1T4nz8PsUhZkW2aWn9P9G6jjjuR9Lf9hiV3H7kwlJ+osCMXCqaekEO+3d7Cg9YORWU7oheMKBAsKEBUs9PL9typOo9iSCAOTlB3GTlBGDM3Ulvt0Xe7c2RvUKSq8DLCDv/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29MeVBnAQCnCL295KsDDathRGJRlDhNRAbNep5HZn1Q=;
 b=Sg15bFGOmVXDpONzHuLyQZVjGUxNd6Vo0Pr/CA0yF8Fw5aBhFHZPOxR0uC3kXpQxSNigfN4cMg0kUM/2ReTJMx+les7o8e1ACRAcId+dtupzTCnZ33AJ+x7vOhzGhKwVFpgtLqtrhUfDspd+l8E7HY3s8lA+v7+10dvhJff5Fk4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul.durrant@citrix.com>
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
Thread-Topic: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
Thread-Index: AQHXINLTS489UfL61EKD4pjlwXnfbqqUSZCAgAbMCwCAABhsgIAAEbyAgAEUfwCAAdQ2AIAAAIoAgAABtoCAAAGygIAABr6A
Date: Wed, 31 Mar 2021 14:30:32 +0000
Message-ID: <E58F7AAD-AD1B-4334-BE11-2AF746E8D198@citrix.com>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
 <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
 <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
 <23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
 <27ecde00-f0aa-b701-6928-5480ed805064@citrix.com>
 <2A1FCD39-D0C0-468D-A977-2FBF7126FDE6@citrix.com>
 <24676.32400.548088.26254@mariner.uk.xensource.com>
 <1a87cfa9-d6c0-5da5-ea07-eae47186da9a@suse.com>
 <1832DBFA-B215-4CEA-9C8A-F53F2A5321E9@citrix.com>
 <9b899068-e0df-3f5f-5537-b9ff81bfa279@suse.com>
In-Reply-To: <9b899068-e0df-3f5f-5537-b9ff81bfa279@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89297639-9155-43f6-3347-08d8f4518a3d
x-ms-traffictypediagnostic: PH0PR03MB5720:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5720223A80B18B0B55FE204E997C9@PH0PR03MB5720.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g5U2jDHRTaNoGp94uDxO4nWfc0fZrjHYY9glFw01OCo4D7Zjwp6a223YbTRiEo2xBfxxijrvVjtVid0dc3fdWbGPHbPhaup/B8BxGkeof5i+kiE+7itr262iT97D4igv8Fr7EWQl94JXzd6rT3S7GD74B12ZqhDG2DyLlrBaaQxoR9VfFvZLD62VgM2EyY/QFNLkpDhEZ2M/ko5f7vYjWqF+lYdKGzlReM9vDnGMunLq1yoBzuOE+PDy+ol3Gh/m75G2PaA4CplfszgzNp9tBib/LgHgKCnzGdKHYBoRdDWX8S6SDaJJaSwJ8fjK4o/wXCIXSpAM2niMdDIOE7RaUyIhbJRoeYc8sqj37LPlIHPSxn9IBs18HUdMjGWkSQ3gbhAqFGil0LR5qxYWrM/RQ9d7NKGxm4pXzp5PzhBFtqSX1f2618+mLCHflZepgj4f0ejgXXU3jHppCbbeM9Tc0VlJneYp1hGGCDswm9etnjEfDmS2xVxso7EgVSEpj/cxCcxb8cFhrUpvPSD01gC0GdoX23Xle8y6dxrENazHb+avt9l/aF9TajnjJ3XRcSglP0SAsbAJnk3u7Q/ZykWqNv0AoSm6rANM1jL3fVw+VCkARVafQkz7etmgziXu5qJ2tDYtuRiKyKTgEMxsG06P1b4ih/F7cEpqv93RAvdq6LJwYRlYzUutTe/RnuJFb4oVt8S7nWmDgRp/2Xn5syP6gPAclHzSo4eLBGxa2oViIFMp7I5k02SJkQF3dQosi6GS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(5660300002)(316002)(38100700001)(83380400001)(33656002)(107886003)(53546011)(26005)(186003)(8936002)(478600001)(6486002)(6916009)(4326008)(8676002)(6506007)(66946007)(66476007)(66556008)(54906003)(71200400001)(64756008)(66446008)(86362001)(91956017)(76116006)(6512007)(2616005)(36756003)(2906002)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SDhZckV5L0ZyN1ZUeW96R3hoaFc3NGF3YkpsNXA0V3BzQ093amU4Uk95Q2hv?=
 =?utf-8?B?MTk5Zzdia2Rld0JtdjYyeXFBY09CQWRLdHdLdzFhVStzUGpFT0JyWncyd3VI?=
 =?utf-8?B?Sk1KeUUwcWFrUzdkaGR2RElJV0VQN1pxN0dwZEppVVgvZkN0bEFIelZDTlN6?=
 =?utf-8?B?dnowMHVXZDM1N0FBRE8rZExKczZLc0Q3UE9JeE4rWk1WeDlyYVdQV055NVRQ?=
 =?utf-8?B?WkM0ZW5ucnA1Y0kzeHFKYmJYdzFhaFMvQkx3VXZ5T1ROUE81d2EvUWc1OUN2?=
 =?utf-8?B?T2kyKzZ5M0trcGUycldCQWVTanhXdkZ3a2hXd3dvOW9nL0w1UGk3QlVHUkY4?=
 =?utf-8?B?TkV6OENkSnhFbTFsTTdNUUFKbEsxcFVOQ0RLL1JQUVArYUtrUWJJUnlmYWZh?=
 =?utf-8?B?VTAxM3g2SXNQTkVQRGo1S1ErNjFFUnhRTzc3eFNTczBjUXJXS0RGM0RTN2M4?=
 =?utf-8?B?blhJcmNtRjlXQ0FzbCtFdFRvYnlZMDV0RTliVEthdzJRMEoxeXdxOXBuMFF3?=
 =?utf-8?B?eFhUTkdGVHZyZmY3K3ZMaXFFS0dOZGFray9WSEp5MTFieXRvUEowd2xZQWtD?=
 =?utf-8?B?Nm90bFM4cWNHOXNnRjZ2aitPelZRdGVnaE1tUkFxSE5oNVFZUmxkelRjRE01?=
 =?utf-8?B?d0wrSFdGVFo5NUhzWmFVR0hkYU1EN3JiQ2FCWERucTJoZnZpUGhxUjkrUDdI?=
 =?utf-8?B?alNLeCs1anF3T1BZbUJGSzZRUDc1em5XZ09PTFVQbWY0QzQyNFlTSXhzWXpi?=
 =?utf-8?B?OERvdlg1eHFmTkxmSHFYTUYzQkR6d1BMazdZdEViUmk2K05XQ0l4enBudjl1?=
 =?utf-8?B?RWZaMERpa242VHI0czJSSFc1b2ozVGlGMCt4VEMzeDFjQ0l4aThhZ1VVSDN3?=
 =?utf-8?B?MW1WcktMaitib1daSmFkK3JNOUxQdkpwc201d0RnNjEyM1FhY1FKV2FId0pV?=
 =?utf-8?B?MHVQQUtFTjNhcS9icng5NTVDVURVWWVmL29VRjU5enlYNzkzY2M2eUdHVG5p?=
 =?utf-8?B?ZGFyNk5zTE5TaEtucWxpeDErdFpsQ3dGNUFFQm1ISVlURDU2NlR5cys1eUc3?=
 =?utf-8?B?NllJN0dNVkxnQ1pKajRpalZaNDZXY1RtdHZjY3pTT3J4NVhCR2d3ZWlFQmZK?=
 =?utf-8?B?Z3R4KzVBNmlidG1tWjBXOFlObEZaTm9FSC9yU2x5UFBaU09iTnNKU3FINjg4?=
 =?utf-8?B?OVhXUHBaT3ZmZDl2eHQ0U000WHRybk9mc1dJYmFZRm56WUVkdTFLQXNGSnR6?=
 =?utf-8?B?dERFYm5FSjZDN3UrNEM5eDBCNC9oNGJoa09abm8yemxsV25mbThDb1ArWGlC?=
 =?utf-8?B?KzlMbHNFTCsrWEZWUzVOditPR3d0eTRJMmlPVGRiQzQzMDhLRkVKTW8zYUUz?=
 =?utf-8?B?VG5KL2xVWXlVbHdYNnpGUEgzSlc1RC9QdGpxbGFncDY3T29KV3gyU2xqcC9M?=
 =?utf-8?B?VUdDTkNFc0p3WTRFZUdtUTVZZ1dpV1Q0cFRTM2JhQzBTQjZlVXVmRTRIcXRx?=
 =?utf-8?B?bk9BRWdweHZOdjhoYWtNNzhmVmNZTU5xRW52dHIzVExvNzVXSXNlZFhUT0Qr?=
 =?utf-8?B?L2wwN1BZZnJSNE9qT0FUczFqVFgvdnJibVJKV1htN01DN0YwVWFhZkV0M25i?=
 =?utf-8?B?NW9WNCtOZy9rcDN2Nys5ZkI5THl3TTBqWmNZak8vMXIxK2tpRXduQ2NPcGFH?=
 =?utf-8?B?Uzk5TjNtUUlKb3VGTDRsQW5uL0ZoNnMrZW1aUkNLK2JNUjFIWlloK01leUVS?=
 =?utf-8?B?dGk1QVhsZHlMbzY5am5tb2hVZlhnSE1OR0lSZHpjRUY3cVdpT0tpZFM3V0VU?=
 =?utf-8?B?SlJiWEs0UlBGU2l2MEVlUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEFD7B3E7F05DA4B9B6B369BEA6EA8B2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89297639-9155-43f6-3347-08d8f4518a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 14:30:32.0555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6+x7TmecUO3xMrkx1CUhA0GyDh7PX2Dl0gR+lheHzwlg0eQ5aXNUZRX+tQcuL47nsrP7evBvzipm/epodryX9eJURLhx5hLryWj3DBtKJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5720
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDMxLCAyMDIxLCBhdCAzOjA2IFBNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzEuMDMuMjAyMSAxNjowMCwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gTWFyIDMxLCAyMDIxLCBhdCAyOjU0IFBNLCBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDMxLjAzLjIw
MjEgMTU6NTIsIElhbiBKYWNrc29uIHdyb3RlOg0KPj4+PiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAo
IlJlOiBbUEFUQ0hdIENIQU5HRUxPRy5tZDogTWFrZSBQViBzaGltIHNtYWxsZXIgYnkgZmFjdG9y
aW5nIG91dCBIVk0tc3BlY2lmaWMgc2hhZG93IGNvZGUiKToNCj4+Pj4+IEkgZG9u4oCZdCB1bmRl
cnN0YW5kIHdoeSB0aGUgdHdvIG9mIHlvdSBhcmUgZG93bnBsYXlpbmcgeW91ciB3b3JrIHNvIG11
Y2guIFllcywgdGhlc2UgYXJlIGFsbCBvbmx5IGluY3JlbWVudGFsIGltcHJvdmVtZW50czsgYnV0
IHRoZXkgYXJlIGltcHJvdmVtZW50czsgYW5kIHRoZSBjdW11bGF0aXZlIGVmZmVjdCBvZiBsb2Fk
cyBvZiBpbmNyZW1lbnRhbCBpbXByb3ZlbWVudHMgY2FuIGJlIHNpZ25pZmljYW50LiAgQ29tbXVu
aWNhdGluZyB0byBwZW9wbGUganVzdCB3aGF0IHRoZSBuYXR1cmUgb2YgYWxsIHRoZXNlIGluY3Jl
bWVudGFsIGltcHJvdmVtZW50cyBhcmUgaXMgaW1wb3J0YW50Lg0KPj4+PiANCj4+Pj4gSSBhZ3Jl
ZSB3aXRoIEdlb3JnZSBoZXJlLg0KPj4+PiANCj4+Pj4gVGhlcmUgYWUgYSBudW1iZXIgb2YgcmVh
c29ucyB3aHkgYmVoaW5kLXRoZS1zY2VuZXMgd29yayB3aXRoIGxpdHRsZQ0KPj4+PiAoaW50ZW50
aW9uYWwpIHVzZXItdmlzaWJsZSBpbXBhY3QgYXJlIHVzZWZ1bCB0byBub3RlIGluIHRoZQ0KPj4+
PiBDSEFOR0VMT0cubWQuICBXaXRoIG15IFJlbGVhc2UgTWFuYWdlciBoYXQgb24gSSB3b3VsZCBs
aWtlIHRvIHNlZSwgZm9yDQo+Pj4+IGV4YW1wbGUsDQo+Pj4+IA0KPj4+Pj4+ICsgLSBGYWN0b3Jl
ZCBvdXQgSFZNLXNwZWNpZmljIHNoYWRvdyBjb2RlLCBhbGxvd2luZyBQViBzaGltIHRvIGJlIHNs
aW1tZXINCj4+Pj4gDQo+Pj4+IHNvbWV0aGluZyBhYm91dCBodGlzIHdvcmsgaW4gdGhlIENIQU5H
RUxPRy5tZC4NCj4+Pj4gDQo+Pj4+IElESyBwcmVjaXNlbHksIGFuZCBJIGRvbid0IHRoaW5rIEdl
b3JnZSBkb2VzIGVpdGhlciwgd2hhdCBhIGdvb2QgYW5kDQo+Pj4+IGFjY3VyYXRlIHN0YXRlbWVu
dCBpcy4gIEJ1dCBJIGd1ZXNzIHdlIHdpbGwgZ28gd2l0aCB0aGUgdGV4dCBhYm92ZSBpZg0KPj4+
PiB3ZSBkb24ndCBnZXQgc29tZXRoaW5nIGJldHRlci4NCj4+PiANCj4+PiBBdCB0aGUgdmVyeSBs
ZWFzdCB0aGUgcGFydCBhZnRlciB0aGUgY29tbWEgb3VnaHQgdG8gYmUgZGVsZXRlZC4gQXMNCj4+
PiBzYWlkIGluIGFuIGVhcmxpZXIgcmVwbHksIGF0IGxlYXN0IHRoZSBzaGltIGRlZmF1bHQgY29u
ZmlnIGRpc2FibGVzDQo+Pj4gc2hhZG93IGNvZGUgYW55d2F5LCBzbyB0aGUgZmFjdG9yaW5nIG91
dCBoYXMgbm8gZWZmZWN0IHRoZXJlLg0KPj4gDQo+PiBUaGFua3MuICBTbyB3aGVuIHlvdSB3cm90
ZSB0aGUgc2VyaWVzLCB3aGF0IHdhcyB5b3VyIG1vdGl2YXRpb24/ICBEaWQgeW91IGhhdmUgYSBw
YXJ0aWN1bGFyIHRlY2huaWNhbCBvdXRjb21lIGluIG1pbmQ/ICBPciBkaWQgaXQganVzdCBib3Ro
ZXIgeW91IHRoYXQgdGhlcmUgd2FzIEhWTS1vbmx5IGNvZGUgaW4gYSBQVi1vbmx5IGJ1aWxkPyA6
LSkNCj4gDQo+IFdoYXQgYm90aGVycyBtZSBhcmUgbW9yZSB0aGUgaW1wbGljYXRpb25zIC0gaXQg
YmVpbmcgcmF0aGVyIGhhcmQgaW4NCj4gbWFueSBjYXNlcywgYW5kIGluIHBhcnRpY3VsYXIgaW4g
c2hhZG93IGNvZGUsIHRvIGJlIGFibGUgdG8gdGVsbCB3aGF0DQo+IHBhdGhzIGFyZSBpbnZvbHZl
ZCBpbiB0aGUgaGFuZGxpbmcgb2Ygd2hhdCBraW5kKHMpIG9mIGd1ZXN0cy4gVGhpcw0KPiBoYXMg
bWFkZSBtb3JlIHRpbWUgY29uc3VtaW5nIGludmVzdGlnYXRpb24gb2YgKHN1c3BlY3RlZCkgbWlz
YmVoYXZpb3INCj4gaW4gbW9yZSB0aGFuIG9uZSBjYXNlLg0KDQpPSywgc28gaG93IGFib3V0Og0K
DQotIEZhY3RvcmVkIG91dCBIVk0tc3BlY2lmaWMgc2hhZG93IGNvZGUsIGltcHJvdmluZyBjb2Rl
IGNsYXJpdHkgYW5kIHJlZHVjaW5nIHRoZSBzaXplIG9mIFBWLW9ubHkgaHlwZXJ2aXNvciBidWls
ZHMNCg0KIC1HZW9yZ2U=

