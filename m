Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F444AD7FD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 12:55:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268255.462052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHP5Q-0001H0-KO; Tue, 08 Feb 2022 11:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268255.462052; Tue, 08 Feb 2022 11:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHP5Q-0001EZ-HN; Tue, 08 Feb 2022 11:55:08 +0000
Received: by outflank-mailman (input) for mailman id 268255;
 Tue, 08 Feb 2022 11:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rHF=SX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nHP5P-0001ET-LP
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 11:55:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3888e56-88d5-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 12:55:05 +0100 (CET)
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
X-Inumbo-ID: f3888e56-88d5-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644321305;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3Bz3jv3JI9q31mHVOdaX+5yHINuphdteRvix91mskbI=;
  b=VvmRR7EiABlsXPD+uc/HRD6uLPtNUvisrMUJt8dEJs/rNlT5Vaws+1RX
   4Ks9cE9V1/c3Nte/FEewDXkmo/D6riaJ+3yOZ/uHgJhNXe+1UQL1fKvHB
   YKz9lJn8qKYjsd2k3JTaxVxCxJY75E0gLaMmNzpLqKnnD+22jWqbFvdvX
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8+cFhN1/Ktp1mwHod9npuu9PfsXE7Ok7Rjkj7pgViLFhIHJcOomOAMgyfUTV7xqOyScQ9K6jj2
 VnpkHToJg9wr/15lEvR9Mda7MfF07aVuJwYTNtufaxwmNCHaeI5sLG4kDxpoYCtzaeRPxwTnn2
 0eNOQbIaw53tsP7Qy8F/81dWSrrW1MvePvxfzAppFj8T1dShsvtq2gFXBBS39QueWR97/88XEK
 bOLitF94UvNUYut5pzqd6QO/Z4geIHrjLSsOx1WBZg3jRGzExU/PNj6iigcr43JwUiDnycN9Y3
 8/f0RhE8UIO/dMHkbVpR0NFm
X-SBRS: 5.1
X-MesageID: 63725845
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+VWywKjXNM2bKV/17pFg9iScX1618BcKZh0ujC45NGQN5FlHY01je
 htvWzqAOKyCZDagKd0nady3oBkGuZKAxtZhSwo9rn9nQX4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQw0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1mhZC6TSgyIJfuv808dBQBHHgkZalvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiFO
 JBEOWYyBPjGSyB2PgYSC8szpcWLxV7/cD0Jg1WznZNitgA/yyQuieOwYbI5YOeiR9hRn0uej
 nLL+SL+GB5yHMeE1TOP/3aoh+nOtSD2QoQfEPu/7PECqEKX7nweDlsRT1TTifu2kEmlQPpEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsZjsJ6d3Mu58JrDXmb/FuSaHs1IXxMGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgTZ5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8Ahkjfi+F0e5eIFcFh
 XM/XisLtfdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxLMhjG0yRZ9y/hkU
 Xt+TSpLJSxLYZmLMRLsH7tNuVPV7nxWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYarfFE8cEl/UKC5/F/UU9E890ijvryTp
 S/Vt44x4AeXuEAr3i3QMi86M+60Dc8kxZ/5VAR1VWuVN7EYSd/HxI8UdoctfKlh8+pmzPVuS
 OICddnGCfNKIgkrMRxEBXUkhIA9JhmtmyyUOC+pPGo2c5J6HlSb8d74ZAr/siIJC3Pv58c5p
 rSh0CLdQIYCGFs+XJqHNqr3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiPnc/YekGudzBGRAGGzf4erkPCXW5DP7k4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9nvonhvb5XyAhgDU7nVVXzB+MyOGSC0OlOqrZJmu1TtzypV
 x/d4dJdI7iIZp/oSQZDOAo/Y+2f/vgIgT2Ov+8tKUD36SIrrrqKVUJeY0uFhCBHdeYnNYokx
 aEqudIM6hz5gR0va47UgidR/mWKD3oBT6R46c1KXN610lImmgNYfJjRKi7q+5XeOdxDP34jL
 iKQmKef1a9XwVDPciZrGHXAtQaHaU/iZPyeIIc+Gmm0
IronPort-HdrOrdr: A9a23:yBTisqxZhUYjf6h9ASHGKrPxiOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMcs1MSZLXXbUQyTXcBfBOrZsnLd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgOVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVN77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10DDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/gzd4dvfrWrCou
 O85CvIDP4DrU85uVvF+CcF7jOQlArGLUWSkWNwz0GT+vARDwhKdPapzbgpDCcxrXBQ4e2UmZ
 g7r15w/fBsfGL9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQlo+bo7bWrHAbocYa
 JT5QDnlYJrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd4AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlayXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wl9iif3ekOhlTRfsuYDcSzciFYryL7mYRtPiTyYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63725845"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqwd6xqhp+v8Qo5u7ephDkybH0VaBVFI3xIZ1aDJH9QRzhxisPXM3tBk4c3o9TXRrnXi0hBnP/EJI/kw2PlCPXB8bS31Pr0BZXi4KeoSzZWq9dDKSVU+lCS1hnskZezbwnuHVbEZrkcj4wNPPM81lMf+CM/XMb4kCykJWfPWMoUMlFEV2DPwF6n232i8/gs+DKq7oRylLw+tEk1S1D99c6ixd+cSSs4V3SccemNhEXzmnFrRWBAAHW4/yfSiymD9r7y+1+t9ImR7H7OVfEzJYwitagetbexR/sOVxu1gMleLVLdAlNg76u1P7AanMVNMPHy60Z/FrqZ3PqYW1tR6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Bz3jv3JI9q31mHVOdaX+5yHINuphdteRvix91mskbI=;
 b=IC55PLARjWIrxj946tMnIojugT7vT4uwRKRcVMeNQy0/aE8tVglVlU3HU9kybK9t/2X0Q5HjbFZD4jHxzGRg8R9/TLXqfbSex84B/ol11EOmEZ4r9bNbRRFlfyAfpss8A1zhO/G/Ij1hMUQSnW3DIFJpAIbkIdzMCyZeVv8paHWKPeao8H36PkWkwch0e7CuIUyvq0ZGK16AsZAmVpujLa7rxgOkOu1Ps/pWk/rDYBiyU5lJ4fVxbJ8j4TUmNaPtc3iMZzi38ZxzShaIMAZoYuHALssO5rmMpFMJPznoF9i5fcIooZ691WYL3qxq3qlMS0Ep+dwOVv3pS35bQZ3waA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Bz3jv3JI9q31mHVOdaX+5yHINuphdteRvix91mskbI=;
 b=CaTlSEXjDPJZqTonazktnpD77qoHceOxN0xoEg4rRc7Ic9RA8muOJQDD7DOU3M8Sj8popclhLrC/e8QXOL/zK3EnhXqdviGYu443wLuZgHXLcKn8+zhcgqWll2uceojv5guei5lVk/i6UUv10CfYtiJeXR2osQyBpiUyocTiYTo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/public: add comment to struct
 xen_mem_acquire_resource
Thread-Topic: [PATCH v2] xen/public: add comment to struct
 xen_mem_acquire_resource
Thread-Index: AQHYHL+DXP8ckdd1J06xLHRfc3g2d6yJi+WA
Date: Tue, 8 Feb 2022 11:55:00 +0000
Message-ID: <ed7424c3-e54c-4c65-03c6-57f9ddd182bc@citrix.com>
References: <20220208074230.7901-1-jgross@suse.com>
In-Reply-To: <20220208074230.7901-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9a76986-6c3c-4d8e-5f68-08d9eaf9d5bd
x-ms-traffictypediagnostic: SN6PR03MB4285:EE_
x-microsoft-antispam-prvs: <SN6PR03MB428551CD677B95180E58C0F8BA2D9@SN6PR03MB4285.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VKWmBYBE93rcLrhE0SWYBALDsJyXGwZCD2tcEr2+0xUzNAMBZSKcyMSyEgO1fN1im9ukwk5ZMseUPjEw9OtwXk+xhUgFUUIXLZFIuY221wOv6GRdsvRcb1MEtpPdSsdQWmcmTRHKsMIn2aWTx8uJ0P5mi7rvgRXjMxocWJgH4EDoetIfqbZsgRSVv0gt33efCOfXlIcqiVbMwYnh4JR7j2QnufHOYpBsofIU8Fwq0RkKVnGpVg5AapqWo6EVmtpWeMXY5yxNP2lMNzyoOVJlo9ohK3L8n/CHJrkGLiyzFZmnBEpEkgnXS62Ds1rmNMx8VELUCBJJs9SzQrw0Lvkj/rhcDLmhk3sH5lWs41ZZ+NQ1sYBT2nkQ/GZ5sQmoxEiXF8GD60S1xnXChCqPsEiPIvCyvNyf3pmDxn02cCjYI0pihXLYL5VWezGFor3Y5w5fxPamA+4O7TtuTB8XDkCcvyvo6dOFTx2/aaNqFRkF1gju68Kz/salZ59RCgFdpxAFbvcq49Rz2omqyS9q3Q3kKNP2Osz1SODc3OrMX7MyejbUvQ176PRQR/u2UZwU163zK5MN+axpWiPtonGoVfUeTEMFw82u0aKxfRk3/5lP6J1vQ5oPcJRPwh1ndh6npmk9R6lYgiiPwCX+G5EW6oEzNjyNaZp7XEJkwCVON2I07hAkJNpPjbkgaDNG8+trDHSiLaHMDn7fhX9a1DllTExGflUBum5WTye2GRYQInPfZ+6LH1rxsG5C1aViFn6GS12sqFNdV6TOPjuXFZP6ivVNWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(8676002)(76116006)(66946007)(31686004)(36756003)(66476007)(66556008)(2906002)(91956017)(4326008)(64756008)(66446008)(83380400001)(38070700005)(38100700002)(122000001)(82960400001)(6486002)(31696002)(86362001)(508600001)(186003)(110136005)(316002)(54906003)(2616005)(53546011)(6506007)(26005)(71200400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c00yTVZnTjk5MHF3SGdmY3NBUGFRSjFGRitrL1YvMDM2V3l3SnZXekJ2dVVY?=
 =?utf-8?B?eitXUk1USXNMeDlFR2tqTkhOYUtGang0VGZQREVnMTJIaGUwSm9LQmxmR0pS?=
 =?utf-8?B?cDRtcG80T05tRXhmb0o0akMvSm5uQTU0TFFyekNQVHA2a2toT1RaSHBZWWRH?=
 =?utf-8?B?dzdpb3ZOSi94bTFmcXpOMDlkL2RFSFhmRDhsUmFOa0dHbHh0K0ZuQVIrdzYy?=
 =?utf-8?B?MW9NUDBOdkFsZXM0Z2tEZEhTOFZaM2ZmK05lMXg1YWF0RHZsbGx5MnJldktr?=
 =?utf-8?B?WHBNdmFYNEZWcU1UVmd6Z25BZFR4Si9ZZVRPTjRqSlRDeE9oKzJFUGxvaDBh?=
 =?utf-8?B?UUcwOHVkNk1vRlM0SnNqNllCRDBlb1RhS0xnbmo3NGlVUUwwNDNRQUUxaHB2?=
 =?utf-8?B?TlNPZ2FnWUVaNmdmR3E1RFI3ZWIxQjlUWndmbTBQY0MzWGQ0N2JhenYvVmI4?=
 =?utf-8?B?UGQwQTgxRkt3R09qNzBHNHRmb2NhLzJpQWFweGhXUUVCN3p0NTdFTSt6TFlo?=
 =?utf-8?B?TlFxYjVqZEdIdXlmRGp1ekl2dmdGbEtFeW5WMm16TFhyVzNVV3kzYlRmQmNu?=
 =?utf-8?B?UHdJQ0NGSk8wZXF1M0dEUkswaGRKa0hnVGVCanpMQmZVRXRzVExOamFrTVFr?=
 =?utf-8?B?TnAzY0RmSVBDS0VqOVJPcDdkdW94c3hCdm9LWUVFelFCeFFSdklnTHpJcko2?=
 =?utf-8?B?VHZ3Z2hUendnaGlLbnR5Y0lMeUNDRVZkbDdJckhvY2Eyc2JFb1k1S09VZ21H?=
 =?utf-8?B?Wkh4SXdjZ3B6VEV1WjVEYVpxSFVycjRMTTJaOHpmZkNyc2NQSXZOVWdNbjlH?=
 =?utf-8?B?NGMvS2dRak1GZ0JMTnhpRW9tdjF0UXVqanR3L0dJU01idFQ2dVdDT3ZEQll3?=
 =?utf-8?B?T0p5VGVQenpOU2FsUUo4U0pRUldsWUpWcVRKWUhJN09ZTnVqRGcvekFZQ0Vr?=
 =?utf-8?B?UzVmeDB4TVd5aXB3a2ZvT3RYSUs0KzI0RVdXYkt5ejJwenZMQ21zeWFqcEgx?=
 =?utf-8?B?cCtCQllzOCtxNmpta2tCM1NTT3pOQlIvMWl1VjVtajZMdnRKdTZobUR3cWdv?=
 =?utf-8?B?OXo4R1dOOUs4QWpNQmEvVXJDU0wvakk4V1lXbDdzdWZqK1c3Yjl1Yzh0d05v?=
 =?utf-8?B?OTJmM0w1R0o0WUw0SksyalBvd21jVHdHSGJ6c2RFeGZMbGI5amN3a2Y2bW11?=
 =?utf-8?B?NmFVT2E4RkVkSTFkTnB2VHA2dXVTczByN1V5KzNONlJpc3ZjM1pwRE5YRkQr?=
 =?utf-8?B?T28vUGhERHZpREdWb1VpbFJpa3I0NTNpdzNGcW5kUDVhenJnTmMxQWVzQUZt?=
 =?utf-8?B?TjRFa0IwV1hBRnR0MUNRQ0RaRm44YVVlRkp1dGhxb2dSN3Uvek1rUXZGVWd3?=
 =?utf-8?B?NGwrUGE1NjNKUGowNXY5WWJlb2Z5NU1yMHliTWlUd1EwMGdRUmlkNStkYkVG?=
 =?utf-8?B?MkFNQWcxdDFWMVRCOTBSZVc0bTNDdUtEdjdKQW9jZUZiRDgwR21ibmcrbXpH?=
 =?utf-8?B?RUV4Tjk0VGRMRzJlSnZPaGhzeXZGNStBaGdRQmNjVWtBWmV0Ty9xRmVWNy9T?=
 =?utf-8?B?azV3UDBLYkhYcGxpeHNUVDJNaXlXWCtRRXlWR01idkxLS2R3MlFpdWRQY05N?=
 =?utf-8?B?VWR5YncvQzRZWGtiT21CNDlPNW1qTWhJaklxTXIzL01ON3NpaUZyazdrNEY1?=
 =?utf-8?B?eTFxcDhtR0puQ1g4QW5SQzdnOFEwb0hkUkgvcTcvc3lMeGJJL0VYRHBJMlNC?=
 =?utf-8?B?SHZhN3ZnblE0eTB0eWlxZW1SWlFkeVpzUFhSd0FPbGMvdjdqK1RwemVrSFQr?=
 =?utf-8?B?TWptZlRmWW1UQUg5TUpnZHJ5M2R5L3ZqZ0hmWEJkMHdUZTlxS0ZwNXA3RVAy?=
 =?utf-8?B?a1RHV0ljUndIRmxMbXFadnN3VExXaStRbGRXT3ZoR2lwYmVmeGVnWkllSXg5?=
 =?utf-8?B?bTBYWVZwdVpaaU9iVkxQdVlDdlE0UDYrRUQvTUVheVdPbWlJa3UvWlVWdzha?=
 =?utf-8?B?L2swTFJxM2hsZ084MkY4dkZqNUh4dFgyeGFlcDhvR0RKd0NLdUFOUjNiUlQ0?=
 =?utf-8?B?dzVMcWxxZTFvN08rTWlZazNZNTB3bUljM2Job0ltayszUkVlK3pEWTh6ZzBs?=
 =?utf-8?B?SGNPZnF3NkpIc1lYQ3lNelBRMytrejEwVkxsZktkTFo5ZTV6dGxuK2w0S1Z0?=
 =?utf-8?B?dVd1QkJmZXVtVWt5T3pqaVdzemI3Nm9XNG1uQWZadWJGUWpJTmhBNzlnc1ZY?=
 =?utf-8?B?eUFQNUZDaEw3Q05jbklpM3FaWkp3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E008DC1C28E034984DCB60E0CF9D092@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a76986-6c3c-4d8e-5f68-08d9eaf9d5bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 11:55:00.2256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6TRNIcUC7D3t9ViRKtuksHYphun3LZdSqveifasmoydC1Ls41Uh59azwnM9OuMr85YYqzWJVDsK6HKyjnjAi3uKYUantAvM8NtRygtGBMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4285
X-OriginatorOrg: citrix.com

T24gMDgvMDIvMjAyMiAwNzo0MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQ29tbWl0IDdjN2Y3
ZThmYmEwMSBjaGFuZ2VkIHhlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaCBpbiBhbiBpbmNvbXBh
dGlibGUNCj4gd2F5LiBVbmZvcnR1bmF0ZWx5IHRoZSBjaGFuZ2VkIHBhcnRzIHdlcmUgYWxyZWFk
eSBpbiB1c2UgaW4gdGhlIExpbnV4DQo+IGtlcm5lbCwgc28gYW4gdXBkYXRlIG9mIHRoZSBoZWFk
ZXIgaW4gdGhlIGtlcm5lbCB3b3VsZCByZXN1bHQgaW4gYSBidWlsZA0KPiBicmVha2FnZS4NCj4N
Cj4gQXMgdGhlIGNoYW5nZSBvZiBhYm92ZSBjb21taXQgd2FzIGluIGEgc2VjdGlvbiBvcmlnaW5h
bGx5IG1lYW50IHRvIGJlIG5vdA0KPiBzdGFibGUsIGl0IHdhcyB0aGUgdXNhZ2UgaW4gdGhlIGtl
cm5lbCB3aGljaCB3YXMgd3JvbmcuDQoNCldoaWxlIEkgaGF0ZSB0byBkcmFnIHRoZSBhcmd1bWVu
dCBvbiwgdGhpcyBpcyB3cm9uZy4NCg0KSW5zdGVhZCBvZiBzcGVjdWxhdGluZywgd2h5IGRvbid0
IHdlIGFjdHVhbGx5IGxvb2sgYXQgdGhlIGNvZGUuwqAgRnJvbSBMaW51eDoNCg0KdW5zaWduZWQg
aW50IGRvbWlkID0NCsKgwqDCoMKgwqDCoMKgICh4ZGF0YS5mbGFncyAmIFhFTk1FTV9yc3JjX2Fj
cV9jYWxsZXJfb3duZWQpID8NCsKgwqDCoMKgwqDCoMKgIERPTUlEX1NFTEYgOiBrZGF0YS5kb207
DQouLi4NCm51bSA9IHhlbl9yZW1hcF9kb21haW5fbWZuX2FycmF5KHZtYSwNCsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2Rh
dGEuYWRkciAmIFBBR0VfTUFTSywNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGZucywga2RhdGEubnVtLCBlcnJzLA0KwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2bWEtPnZtX3BhZ2VfcHJvdCwNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9taWQpOw0KDQpVbmRlciB0aGUgb3Jp
Z2luYWwgaW1wbGVtZW50YXRpb24sIGl0IHdhcyBsaXRlcmFsbHkgbm90IHBvc3NpYmxlIGZvciBh
DQprZXJuZWwgdG8gYXZvaWQgdXNpbmcgWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZCwgYmVj
YXVzZSBpdA0KZGV0ZXJtaW5lZCB3aGljaCBkb21pZCBuZWVkZWQgZmVlZGluZyBpbnRvIGEgc3Vi
c2VxdWVudCBmb3JlaWduIG1hcCBjb21tYW5kLg0KDQpUaGUgY29uc3RhbnQgd2FzIHRoZXJlZm9y
ZSBhbHdheXMgcGFydCBvZiB0aGUgZnVsbHkgcHVibGljIEFCSSwgaG93ZXZlcg0KaXQgbWF5IGhh
dmUgYmVlbiBpbnRlbmRlZCwgYW5kIHN1YnNlcXVlbnQgY2xhaW1zIHRvIHRoZSBjb250cmFyeQ0K
KG5vdGFibHksIHRob3NlIHVzZWQgdG8ganVzdGlmeSBpdHMgZGVsZXRpb24pIGFyZSBmYWxzZS4N
Cg0KVGhlIHNlY3VyaXR5IGZpeCBmb3IgWGVuIHdhcyB0byBwcm9oaWJpdCBjcmVhdGluZyBzaXR1
YXRpb25zIHdoZXJlIHdlDQpmZWQgY2FsbGVyX293bmVkIGJhY2sgdG8gdGhlIGtlcm5lbC7CoCBU
aGlzIGlzIEFCSSBjb21wYXRpYmxlLCBtZXJlbHkNCmNyZWF0aW5nIGEgZGVhZCBsb2dpYyBwYXRo
IGluIHRoZSBrZXJuZWwuDQoNCj4gQWRkIGEgY29tbWVudCB0byB0aGUgbW9kaWZpZWQgc3RydWN0
IGZvciBub3QgcmV1c2luZyB0aGUgbm93IHJlbW92ZWQgYml0LA0KPiBpbiBvcmRlciB0byBhdm9p
ZCBrZXJuZWxzIHVzaW5nIGl0IHN0dW1ibGluZyBvdmVyIGEgcG9zc2libGUgbmV3IG1lYW5pbmcN
Cj4gb2YgdGhlIGJpdC4NCj4NCj4gSW4gY2FzZSB0aGUga2VybmVsIGlzIHVwZGF0aW5nIHRvIGEg
bmV3IHZlcnNpb24gb2YgdGhlIGhlYWRlciwgdGhlIHdyb25nDQo+IHVzZSBjYXNlIG11c3QgYmUg
cmVtb3ZlZCBmaXJzdC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPg0KPiAtLS0NCj4gVjI6DQo+IC0gb25seSBhZGQgY29tbWVudCBpbnN0ZWFkIG9m
IHJldmVydGluZyBjb21taXQgN2M3ZjdlOGZiYTAxIChKYW4gQmV1bGljaCkNCj4gLS0tDQo+ICB4
ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmggfCA1ICsrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvbWVt
b3J5LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmgNCj4gaW5kZXggMzgzYTk0NjhjMy4u
ODY1MTMwNTdmNyAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL21lbW9yeS5oDQo+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaA0KPiBAQCAtNjYyLDYgKzY2MiwxMSBA
QCBzdHJ1Y3QgeGVuX21lbV9hY3F1aXJlX3Jlc291cmNlIHsNCj4gICAgICAgKiB0d28gY2FsbHMu
DQo+ICAgICAgICovDQo+ICAgICAgdWludDMyX3QgbnJfZnJhbWVzOw0KPiArICAgIC8qDQo+ICsg
ICAgICogUGFkZGluZyBmaWVsZCwgbXVzdCBiZSB6ZXJvIG9uIGlucHV0Lg0KPiArICAgICAqIFRo
ZSBsb3dlc3QgYml0IHdhcyBuYW1lZCBYRU5NRU1fcnNyY19hY3FfY2FsbGVyX293bmVkIGluIGEg
cHJldmlvdXMNCj4gKyAgICAgKiB2ZXJzaW9uIGFuZCBzaG91bGQgbm90IGJlIHJldXNlZCBpbiBm
dXR1cmUuDQoNCnMvc2hvdWxkL3dpbGwvLsKgIFRoaXMgaXMgYSBzdGF0ZW1lbnQgb2YgaG93IFhl
biBzaGFsbCBiZWhhdmUuDQoNCkkgdGhpbmsgaXQncyBhbHNvIHdvcnRoIHNvbWVob3cgZml0dGlu
ZyBpbiB0aGF0IGl0J3MgYW4gb3V0cHV0IG9ubHkNCmJpdC7CoCBJdCB3aWxsIGJlIGltcG9ydGFu
dCB3aGVuIGluZXZpdGFibHkgd2UgZW5kIHVwIGNoYW5naW5nIHRoaXMgYmFjaw0KdG8gYmVpbmcg
YSBmbGFncyBmaWVsZCB3aGVuIHdlIG5lZWQgdG8gZXh0ZW5kIHRoZSBoeXBlcmNhbGwuDQoNCn5B
bmRyZXcNCg==

