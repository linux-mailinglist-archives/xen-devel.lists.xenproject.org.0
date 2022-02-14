Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3272E4B52F4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272324.467119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJc9F-0000PB-VL; Mon, 14 Feb 2022 14:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272324.467119; Mon, 14 Feb 2022 14:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJc9F-0000NH-Rr; Mon, 14 Feb 2022 14:16:13 +0000
Received: by outflank-mailman (input) for mailman id 272324;
 Mon, 14 Feb 2022 14:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJc9D-0000My-Tw
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:16:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a645b747-8da0-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 15:16:08 +0100 (CET)
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
X-Inumbo-ID: a645b747-8da0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644848167;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+/M+up3u21H5aCWSuyMDsIZV5CyiRJCxmfayMhFC+LY=;
  b=a/tns2fjVYT+m/cuScLB1Sxy0XhaAc5d1y+tKijYNTZ10Zj//O1wV9Xp
   UhNmijtHr5plZ7kSrK3IbxT53mKL1YMnB5tRZGhWV27N+5oSYHzE+baxY
   T1WWJp9irpPVySXbAhm6Y+kApurXG3BLMtse3dRmoG5LuW2npGRXBUwBC
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ssp5zLyMpGHiFHZg68k1FMhQVjOexb27ZwAJydK4YOsVZybZ471Rmd4ovej8s9aCLJb0bPLNyw
 Zcm5IDYYi5sQ4Snf1iVdWStvxkwAtoxCkxdalY0NEmk8tbH3t1psYfOVyQLRPdV6dwmsaNirKg
 4TEsQSqcI7hgjar84wl8F+Ww89VojC0o4kSvzcPVuZ70VxVe2A2jsbrTrVY34lhcxG2te+hiEx
 7CSzrC7oKc5Amz1mRSPxJG9w9AhRoZysWn4ygqy8Y3SOZqQ41MIZNIaYzXfQ175HAidYI6+I4L
 ZBDVN7zjwTVT6Kw9nHj/cLBW
X-SBRS: 5.1
X-MesageID: 66381804
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:I4yj2qOVvHbVHgfvrR3zkcFynXyQoLVcMsEvi/4bfWQNrUp0hTxTy
 GYZWm3TbvmNYmemKdFwYdm1oENTscOGzIVjSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYowSqzstX2
 tJpj7e9ZTUZH4mRlro+bjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmlr1pkeRaq2i
 8wxQB5FZw3jTxpzH0oNNM09vOr4qULQfGgNwL6SjfVuuDWCpOBr65DhKMHQe8CKbcxNk1yEu
 3nd+GDkHhAdMsfZwj2AmlquifXIhjjTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDS9DnWhSirX2svxgCWsFRGek39AGMzKXP5w+TQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty9v+pIA+iDrfQ9AlF7S65vXqHRngz
 jbMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEqUzVJiQpyiQ7aD5HTp3ddkcYjHbWSo6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBP
 ReL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9z23+KTPuftmU
 Xt+TSpLJSxEYZmLNBLsG48gPUUX7i4/33jPYpvw0g6q17GTDFbMF+tZbwveM71htfjeyOkwz
 zq4H5HUoyizrcWkOnWHmWLtBQxiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLSZyx950Wa5ZfVeBhrISPO9YvF
 KJbEyhBa9wSIgn6F8M1M8Ws8tw6LE7z7e9MVgL8CAUCk1dbb1Wh0vfvfxf19TlICSyytMAkp
 Kan2B+dSp0GLzmOxu6NN5pDFnu94ioQnvxcRUzNLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94r5QfFjGkd6HnXA6erkPyft4Wf+k5RLV/yFfG6BWTqsqrmif
 +hc09r1LOYDwARRq4N5HrsylfA+6tLjqqV01ANhGHmXPV2nBqk5eiuN3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOjKhGlCPT4PI5JFTByBV2pLfXA19POxSsiTBGKOcnOo0S3
 up86tUd7Bayi0R2P4/e3DxU7WmFMlcJT74j6sMBGIbuhwcmlgNCbJjbBnOk6Z2DcYwRYEwjI
 zvSj6venbVMgEHFdiNrR3TK2ONcg7UIuQxLkwBedwjYxIKdi69lxgBV/BQ2Uh9Rn0dO3O9EM
 2R2M1F4ePeV9DByickfB22hFmmt3vFCFpAdH7fRqFDkcg==
IronPort-HdrOrdr: A9a23:csp9jK2fSwGHTjPY+aF5kAqjBRZyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/heAV7QZnibhILOFvAi0WKC+UyuJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZm6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngdOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerV8bMpiA2XkAgwbzYxBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIeLH4sJlOz1GkcKp
 gkMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dg/22J6IJzIEUaICbQxFreWpe5PdI+c9vcfEzc8
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="66381804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdUvfzn/gNDDTqISoKDgW/A1CyrjPk+6othe6DG6BPhWwPhrun34qF2S/1oGSSKMe9X4bASyiKHw4vq+gP82+dohs9RVGhck/xUYBSoucEX8vo1dFRO+aGWJoJlDNviEAqt1r+/QhgbT0Cpy2RQG8DA02+rcox8qhO1KzeDpmL+zi/aAtRLR825GU07eAtLT5oh4llk+OitRqEtiWw8BkB1+lLF5YtyfUnZodK1XEkNLjr9CEJeWkt8i5aT9MNLghuQJiXUpnJeW7vP5T1hgWD2UglDnRFuSyRmZx+2dOodPVqift1V3N6ApYiLbuX9Xh1UZ4QMvYtyoJ9EQF1jPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/M+up3u21H5aCWSuyMDsIZV5CyiRJCxmfayMhFC+LY=;
 b=DO77sHGifZ53GE7eClct7b60ybhRjwIAdJrU+u3okD4jZRHBvoU5j1dXIm23D6es3hkSp7Eng5LL05YEbIQ/g8KaNxU8U+obOGXlGQclzUeomTvRYAE9X1K1oeWpWJf4UtBowaDe+KLBbP4welGnTGh6P4mTORhxx/MPa+lL+d5RAced4LSYNcpszDw15BqnqplqWjlVk7x54fvP/LPqb3B1sY+RgnVfNBiRj8rCm35ep7De238Fmdvbk8S11+5lVvuGcs131yLrX62B/0+rpnh8MTyZWS/4CqSijwwFI51vMeefXlNsxTFPI59rvl8wJSmG1lKnE1wY3XGM65iwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/M+up3u21H5aCWSuyMDsIZV5CyiRJCxmfayMhFC+LY=;
 b=BqDO/E+qUXlU5U8gjkRvwipjNDcyesCLBn289aptZO/rvpMFlDQkOCaNxUI1BIWexzXOB7a/l8o1IDWkQJBc/6HMymVYG483N3JEkWhpYEZsUOMu2ncMNmxeYhsadhuUHD6KduMMS8oRMh2JcOAJicDy5CKXuQoh/9FWDh7mvSA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Julien
 Grall" <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Juergen
 Gross <jgross@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 00/70] x86: Support for CET Indirect Branch Tracking
Thread-Topic: [PATCH v2 00/70] x86: Support for CET Indirect Branch Tracking
Thread-Index: AQHYIaGi+1XAXGQfKUGTLygtpBu/SKyTBUWAgAAJC4CAAAkaAA==
Date: Mon, 14 Feb 2022 14:15:39 +0000
Message-ID: <8c6dd7d0-11e6-9b8a-66fc-f1a4998c074b@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <c471dcc2-8a91-60b8-ba5d-58874752e4d7@citrix.com>
 <218de2dc-6dd8-4e13-3288-36448e47de7f@suse.com>
In-Reply-To: <218de2dc-6dd8-4e13-3288-36448e47de7f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d289064-e017-457c-1b34-08d9efc47a5f
x-ms-traffictypediagnostic: MW4PR03MB6396:EE_
x-microsoft-antispam-prvs: <MW4PR03MB6396967A8D7DD5BCF12AF868BA339@MW4PR03MB6396.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WEGYfKZKm8BH13kCSNJ0YOJSi7qvMgoVwQEDqtw2A3bUG0JUqGThtsRw2oZR7j5e0l98hpvRPiQPSSHg4x772C75GJvK2qF+IjWZSvIS3a+y58+CHm7LD5rCo1iyILsfMpnVyxLGLt3krIhmxAA2o2Z3QIzwFbOsbtglDNneA2uly0x6Dvx18bozx2STBwVwPkYEOOM1fXJThwuKt+Vumu7pLlP4+PzUkvALtD4KGQEuUqr+dV1HiVPrjb3amRIiaBjHxx8H86bJH17BiPa5+XQ8EGpepRwmvD5YNzyGJiFIkjXvQLMNGBuQTfIls1N4l10L5a1pQvQMR/luFgkPrkWKjM/KaZ8Mt+9apzJBfe3S78XzV+yShhosm92pWddBf616pFFMEwBBR+y4TyzlvFKX/WDPVA/g9cIDQFAbqfWG0/UiyO5oGYVUtFdEZvNaEpcTOU3KuJ76yh8gN1BUtS9S9wQZufKdi0Mjig9MG/3TdwvyJz1zKNMdUHWM6TNS2gDq1dl46eRp5jDVV/j2r41waXCXLFO7LbLiHq/jMQwUexQ+RU+CC9E4S95mjKqGRdXV2ChqTOh9/GI++kHUrBgqFQnH8SoaDXVks55giRk4LMz+EiOyCPbu4mOHLyV+MQE0n8kp0q1SDLCazaHkAybpYtRhziChv63nZWg5JWZIPlNXMeNMbU+z6BRk9KzMxE6B6OaEkPxBSRlTrlo4ZpYDRRUgdWrv74vDRu1PnrUxULAKPhrKr07Fq2KhA2pZx7YviKUz3g8aK6UAS4GoPtzTu3o2PgM2kLGv1LNUWWNe3KWgawl9zK4hTXrfwNsGS8zpOLGsdDlWMtAcpC6raMxgnCy03PIct+LkSTjCcGI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(82960400001)(2906002)(31686004)(6916009)(53546011)(5660300002)(71200400001)(316002)(36756003)(508600001)(6486002)(38070700005)(66556008)(4326008)(86362001)(54906003)(91956017)(38100700002)(6506007)(66946007)(2616005)(966005)(31696002)(186003)(66476007)(6512007)(76116006)(8936002)(8676002)(26005)(66446008)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWdLNTBGMGpTMkZiaWRvZUlkSTYveXZrZ1VoR3dXbGt6YXB1WHJqcU1tS2NW?=
 =?utf-8?B?c1JPY2p0U05GQzhjbHFmWVB6REFGYzBIYlZjanZTOTB3SjRxTHJYdDRTNzhM?=
 =?utf-8?B?YmRhYXNZa0RyRW9sNVp6Z2hSUUFxOXBLenlzT1E0dVdhck5aNEFaQmt1aWk5?=
 =?utf-8?B?Z0tvcGsvZE96ZTZQZHlrZnhPUFE3enBleEU4RElBTnZ5MTBSeUJMK3FpdHcz?=
 =?utf-8?B?N3hmSjQzYzRKWjhTc3RyOEc1a1dpTVdtZlBRU1hONjdYOVJhRHRVMFA5VTdP?=
 =?utf-8?B?UHNTQTUvdFEvUFJvNGtWM0QrVXRWQUVHNnJSdnk1V0xUZjhwR0tWWUlmRVhD?=
 =?utf-8?B?WGZjbG94ZFVHaUdtZGRjTXVJZDRHc2lpNFdJZTF0UURYeTUxVVNPTHFWVllB?=
 =?utf-8?B?anF5cW1CRjgwN1VSbUhCSnVzdWhIM0M0Wm5uUTg5VXBWYzlnOWVwNHVEYzF1?=
 =?utf-8?B?QnRWQ0ExQTFOK2JHR2c2RFk0UFJLZUdmelRhQjVUWE9Ua1FPQ2VJWDZYYzVN?=
 =?utf-8?B?TXFzQUcvMmJjWE9IaTY0RUtOWGpQbStHVWpZLzdQWVA3aDZKZVpxMUgza0Vt?=
 =?utf-8?B?ZGYxaWw5akVGV0luYk96SUg5ZlV4cUxKTXMrMWptOUZlUkp3YjUrOFJKYktP?=
 =?utf-8?B?dC9neEw3SDljL0hvVDhXZG84K3p4VnJKMEJPQ2JBLzAyS0lKMTIxY2ljbjhN?=
 =?utf-8?B?Z3NyNjQ5OUltUkNkdGFxYldTTGRQQlFVQzBGbkVaQkxzOUh0UzBkc0pIcjVl?=
 =?utf-8?B?cmFaZUFGSWdvMG1oS0poTFgwU1hxbHZMR2RXaDhGd0dJK3B6WldtU1dNN3o2?=
 =?utf-8?B?TVRFVFM5OEFXUUo3YmpXTEtwckt5R3owR0wvMElwV0VzL09rYldUdEl4OXpO?=
 =?utf-8?B?N1IzZXRKd2tLZitJQlNlN2lpWUt0M2EwQ0ROam82LzJKYjhxMEI4VFRxSEN0?=
 =?utf-8?B?aFZ2RjJzV0FBRTJQT25aWGdUTnFUSW9BbWZZck9VeWt1TVFiYnFUTWg4Mmhs?=
 =?utf-8?B?WnNrUkFqcTFrRHRoSVRZQTVzRXJ1VFRGZkdMLzNlbEh1NmVFdjhXRlZpL3Vy?=
 =?utf-8?B?ckg2L2NqbzFVMzQ2YitEY0ltMTArL0JxSWorUzFNMDR4UnhvbUFjTTBUZEpS?=
 =?utf-8?B?cmNFaWpiTHRUSnVhcXVKbHlJRnBoWExWeFFHbTBBdnpBRUdSWTB5NzY1MytV?=
 =?utf-8?B?RFc2RVRQaDA3U2hPWHIrWGp5ZHBIT1czaGl3UUtzb0M3cEhTM1EvTHk1QkpT?=
 =?utf-8?B?bGxZWExtRWpCNTZweFVpQnphL09STDdxU0R5U08wWUVuNUJYN1llU2Q0NTln?=
 =?utf-8?B?UWd4cnNqOTlacGw4Tjl3WE56N2k2OFUxZXRkVmNITUEvdnBmUTRIbCsrYmFr?=
 =?utf-8?B?YkdFc3A5Y0dYZnNnbG1FTVY1Q0dtNmh6WWVXQ2ZxMjQzVU1qSGdodlg1elNP?=
 =?utf-8?B?ZGdBd09reHVyMEtIOUxYUFJsY0k4YVhiVHZyZVlISW05WlY1OW9oZ0h1ekNr?=
 =?utf-8?B?SDVRWWI5clo5UFROUmwreDBSclNsRU5uNzY2ZDJwa2x6RGRaeWNaSGFkdDhW?=
 =?utf-8?B?UmdrYm1lTlJXemdON3lpY3JhME9hcXlodWF5MHY5c0dkQnB6RFduQWRVd25j?=
 =?utf-8?B?KzlTM20zVFZGRHRBOXFhRllNejlJNEhUZFc2N21Bb3BIS3ZQL3E2ZUNHYW1S?=
 =?utf-8?B?S2E3SElubDJ0cmZaS3BVdkV5dU5XL0daaVBDQUJvbXc4K0lUV1hkeVBmb091?=
 =?utf-8?B?c09zeGtoS25tTjhsTWxBd2tVRDV5Q0Y3VnFBMmtZMEtmb0RFbHFHU2ZuOU1B?=
 =?utf-8?B?WmQzd1lXN2EzK0F5c2JYem43bHVIdUsvQ2FiY2hiNW5IanVjOW1pSEFTeTA5?=
 =?utf-8?B?UTI3M0h3WWVsWUhMVDZBcS9sWHVmRTFxSjEwcWg0UmhVaklBY3pYN0tBSHQx?=
 =?utf-8?B?QTRsRXQ4S2VEbm0rb0VEdVUrT0hkelFqM214VWl6MFF3MDZmYWQ0WUd5STV0?=
 =?utf-8?B?Zzh4ZVo5STVIaU56VjRob1Q1TDkydVQ5QnczYjVOb2dFM3RvaTFhbEpXRndE?=
 =?utf-8?B?dVhxU1NjdFM5aVhqZmlrc0RsM3hmUzJzejVic1VoQnREMWszVUhySXYvNExH?=
 =?utf-8?B?QVlnUVZQQjF2VWpYZjlpM2xGeXR5eHFIYURiMEtjMmI3c1BRR01KeFU1K2p2?=
 =?utf-8?B?SWFyTEhBWjhFQ3RMVFViajN5MTE5ZXVLaVdLeTQ0cXVYVGZnWnJxeGhadnVo?=
 =?utf-8?B?S0ptRUc1S1J5L1pUcDJoQlJqUE9RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B8387694C45FD45AA55FEC266FB97DC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d289064-e017-457c-1b34-08d9efc47a5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 14:15:39.4380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nO78ET3FzyuYETCp78uCIo/AtUw23IShFblIq7uXzCOBd5/QUTzErAO1oyD33mLACSef01+9ObaXOPW4lShS56lqqq+TCbInSBxday8D1co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6396
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMzo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTQ6MTAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNC8wMi8yMDIyIDEyOjUwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IENFVCBJbmRpcmVjdCBCcmFuY2ggVHJhY2tpbmcgaXMgYSBo
YXJkd2FyZSBmZWF0dXJlIGRlc2lnbmVkIHRvIHByb3RlY3QgYWdhaW5zdA0KPj4+IGZvcndhcmQt
ZWRnZSBjb250cm9sIGZsb3cgaGlqYWNraW5nIChDYWxsL0p1bXAgb3JpZW50ZWQgcHJvZ3JhbW1p
bmcpLCBhbmQgaXMgYQ0KPj4+IGNvbXBhbmlvbiBmZWF0dXJlIHRvIENFVCBTaGFkb3cgU3RhY2tz
IGFkZGVkIGluIFhlbiA0LjE0Lg0KPj4+DQo+Pj4gUGF0Y2hlcyAxIHRocnUgNSBhcmUgcHJlcmVx
dWlzaXRlcy4gIFBhdGNoZXMgNiB0aHJ1IDYwIGFyZSBmYWlybHkgbWVjaGFuaWNhbA0KPj4+IGFu
bm90YXRpb25zIG9mIGZ1bmN0aW9uIHBvaW50ZXIgdGFyZ2V0cy4gIFBhdGNoZXMgNjEgdGhydSA3
MCBhcmUgdGhlIGZpbmFsDQo+Pj4gZW5hYmxlbWVudCBvZiBDRVQtSUJULg0KPj4+DQo+Pj4gVGhp
cyBzZXJpZXMgZnVuY3Rpb25zIGNvcnJlY3RseSB3aXRoIEdDQyA5IGFuZCBsYXRlciwgYWx0aG91
Z2ggYW4gZXhwZXJpbWVudGFsDQo+Pj4gR0NDIHBhdGNoIGlzIHJlcXVpcmVkIHRvIGdldCBtb3Jl
IGhlbHBmdWwgdHlwZWNoZWNraW5nIGF0IGJ1aWxkIHRpbWUuDQo+Pj4NCj4+PiBUZXN0ZWQgb24g
YSBUaWdlckxha2UgTlVDLg0KPj4+DQo+Pj4gQ0kgcGlwZWxpbmVzOg0KPj4+ICAgaHR0cHM6Ly9n
aXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8tL3BpcGVsaW5lcy80NzA0
NTM2NTINCj4+PiAgIGh0dHBzOi8vY2lycnVzLWNpLmNvbS9idWlsZC80OTYyMzA4MzYyMzM4MzA0
DQo+Pj4NCj4+PiBNYWpvciBjaGFuZ2VzIGZyb20gdjE6DQo+Pj4gICogQm9pbGVycGxhdGUgZm9y
IG1lY2hhbmljYWwgY29tbWl0cw0KPj4+ICAqIFVFRkkgcnVudGltZSBzZXJ2aWNlcyB1bmNvbmRp
dGlvbmFsbHkgZGlzYWJsZSBJQlQNCj4+PiAgKiBDb21wcmVoZW5zaXZlIGJ1aWxkIHRpbWUgY2hl
Y2sgZm9yIGVtYmVkZGVkIGVuZGJyJ3MNCj4+IFRoZXJlJ3Mgb25lIHRoaW5nIEkgY29uc2lkZXJl
ZCwgYW5kIHdhbnRlZCB0byBkaXNjdXNzLg0KPj4NCj4+IEknbSB0ZW1wdGVkIHRvIHJlbmFtZSBj
Zl9jaGVjayB0byBjZmkgZm9yIHRoZSBmdW5jdGlvbiBhbm5vdGF0aW9uLCBhcw0KPj4gaXQncyBz
aG9ydGVyIHdpdGhvdXQgcmVkdWNpbmcgY2xhcml0eS4NCj4gV2hhdCB3b3VsZCB0aGUgJ2knIHN0
YW5kIGZvciBpbiB0aGlzIGFjcm9ueW0/DQoNClRoZSBjbGFzcyBvZiB0ZWNobmlxdWVzIGlzIGNh
bGxlZCBDb250cm9sIEZsb3cgSW50ZWdyaXR5Lg0KDQo+ICBJcnJlc3BlY3RpdmUgb2YgdGhlIGFu
c3dlcg0KPiBJJ2QgbGlrZSB0byBwb2ludCBvdXQgdGhlIG5hbWUgY29sbGlzaW9uIHdpdGggdGhl
IENGSSBkaXJlY3RpdmVzIGF0DQo+IGFzc2VtYmxlciBsZXZlbC4gVGhpcyBpc24ndCBuZWNlc3Nh
cmlseSBhbiBvYmplY3Rpb24gKEknbSBjZXJ0YWlubHkgZm9yDQo+IHNob3J0ZW5pbmcpLCBidXQg
d2Ugd2FudCB0byBhdm9pZCBpbnRyb2R1Y2luZyBjb25mdXNpb24uDQoNCkkgZG91YnQgdGhlcmUg
aXMgY29uZnVzaW9uIHRvIGJlIGhhZCBoZXJlLsKgIE9uZSBpcyBlbnRpcmVseSBhIGNvbXBpbGVy
DQpjb25zdHJ1Y3Qgd2hpY2ggdHVybnMgaW50byBFTkRCUjY0IGluc3RydWN0aW9ucyBpbiB0aGUg
YXNzZW1ibGVyLCBhbmQNCm9uZSBpcyBhIGdlbmVyYWwgdG9vbGNoYWluIGNvbnN0cnVjdCB3ZSBl
eHBsaWNpdGx5IGRpc2FibGUuDQoNCn5BbmRyZXcNCg==

