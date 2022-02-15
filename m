Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3534B7AF6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 00:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273592.468844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK6o1-0004ZT-Nf; Tue, 15 Feb 2022 23:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273592.468844; Tue, 15 Feb 2022 23:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK6o1-0004Xd-KO; Tue, 15 Feb 2022 23:00:21 +0000
Received: by outflank-mailman (input) for mailman id 273592;
 Tue, 15 Feb 2022 23:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zJqs=S6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nK6nz-0003X9-BB
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 23:00:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a200065-8eb3-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 00:00:17 +0100 (CET)
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
X-Inumbo-ID: 0a200065-8eb3-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644966017;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AacAo/eRvfY4J8goeSIPLwJDsg7Ltb3Rmt/eXKozd4g=;
  b=hW+k5pD2W8mS/SwnqRrxkj6BMFfYynUzmAUpniH3txoCu1ipfFFHuHpY
   lDUjuQXUyJy/t6+zVLU+5HZ9lBBHHTQcwyusC+wI1q1vGj8svEMq/v5+A
   jeqJ3858zYfU4ABU40cXOwCcWFEC6hnxtjSMOmf2Ifa4G+8yc/jrfusJ7
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: heBUP79en1b5kY6vhmZIxGp+UhymKzWQFQFhN+sUq1omiWbRi3jX7XlGX1kp4Rwu8I71Hg4R+K
 fesqJW25wFFwgpCUjeGRHFtL0MJCPAcXAJYRXO5i4idr3VhqkuPxzCIPsCy/O15pm1abPAaRdS
 YzuIZeTva9RnMQe9qrVVXdgKHhbt8YMt4uLwZe1O1GKwtB0t36FXm1SZb/Oo3tT68+ZLvN6/dP
 38gkg+h5/4GWS7AQyGSbM6BseREedSEkgEW2vc5fR0s+4M3CeKU9SnTqfHLZssu0yRgZcLr6dm
 frI+rCK1yMmsyyROgZEBoWQd
X-SBRS: 5.1
X-MesageID: 66528721
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fRuHj6tZnRkyoMij7CnKgWZNyefnVI1ZMUV32f8akzHdYApBsoF/q
 tZmKW/TPf7eYmH1LYsnat6+oE4P6sODyoRnQVRr/n01EXkT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IXhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplmpuZSigxL6L1h88ZdENyLnxOB/Mb0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 ZdDOWU1NXwsZTVLKHMqBa19wNuGvV6ka2EAkVuWq7Q4tj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6C7mQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8I9wQKi0rvb2hmyAk9eZAMcWOZ46eZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZX2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1bpdZIGW4M
 R6K42u9AaO/2lPwMMebhKrrVawXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGOqtBNdAhTdyBkbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3QApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:ymB0Hq2hZl00tVzVp/WvAAqjBRZyeYIsimQD101hICG9Lfb2qy
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
X-IronPort-AV: E=Sophos;i="5.88,371,1635220800"; 
   d="scan'208";a="66528721"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIEmBUrn8tGEB3IsrtlIeau2WpbC9nM5jqnlrHxbNNXIY8UKaX/2cF5KZraT9FGx2VhgzH14ShWqSc4SkkbHQ1mK2Q+9WLk8PofnMVZW5CvVEH7xtl/aclnnvMo+YhkZCH1fgMocb7FAFp4nDvKePSZOH5HV9qYrZsexlAQC1id8JNitIcMd8uO9MZ8oYCYPAGG83aJOc/+B7JECcVwzZm7g3wq1qXpeQBcP96RKFlTA7WRorkOWZ2lLAnUo911z7HnDB9XWaPvd8URffHPLk5JFB5Wdc+L5AQNt7xEnSpsYvP/keIx5WIITNgDzwLsZ8xm6ENvJpMq6gJpeW7kz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AacAo/eRvfY4J8goeSIPLwJDsg7Ltb3Rmt/eXKozd4g=;
 b=S7MmEg68P8Iv48LYfcOaHeWqHE0RTmFDRFRvN7J1CKYF8ivp0cZB2nrYa02g2kH+5ARtmxS38MV72v6W0LhqhwxBksSn/9K04tSMeiub4AGVZKluog90A0M0ntLPXtEwpevf1hoFJsbi1LMD5iHjbgykApnfn12T5pPnZNPhzA2VzFSt/QvYJGF15bATNILbKZ7Gg/RqXjg+G7BfuL7UrDfKUQ8v5BoISIewkEVmyLP/R9N7jahXlYKBaW9AC9d1fjOG5xa1vLfNyoJOIwMqESocKpetZo12i8t2nnNuf3dSArRRVv23551dZ8ayVp+wQW5/nj/X+iTVqrpTHzD6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AacAo/eRvfY4J8goeSIPLwJDsg7Ltb3Rmt/eXKozd4g=;
 b=hoPn1mmpHwllCmX+luQvzM9R+DEmOxIu/yLOh/67FhiU7eTF0cmcFFVAsCfy26MmmFWIJR5PPEGiJ+4JNiLodVP2ZJNN8iwOjX44syTwW0nyWPJHCj7QLa1egYJbrc+kVcQrEmLUx7KU8EiiKbbFakAMZWrZCot31zerh9VcNxA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 69/70] x86/efi: Disable CET-IBT around Runtime Services
 calls
Thread-Topic: [PATCH v2 69/70] x86/efi: Disable CET-IBT around Runtime
 Services calls
Thread-Index: AQHYIaO5yC8LkxEff0u7D+BbmzJONayU1dyAgABmbAA=
Date: Tue, 15 Feb 2022 23:00:11 +0000
Message-ID: <9909b7ca-3346-a46a-155c-e4a83d99b2fb@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-70-andrew.cooper3@citrix.com>
 <0eede8ae-c2a2-cc87-d4cd-47ceffd4e488@suse.com>
In-Reply-To: <0eede8ae-c2a2-cc87-d4cd-47ceffd4e488@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c924a774-f285-4cd4-e2fe-08d9f0d6eb64
x-ms-traffictypediagnostic: DM4PR03MB6046:EE_
x-microsoft-antispam-prvs: <DM4PR03MB604659E869DA5B558CE576CFBA349@DM4PR03MB6046.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sbTd50Obq84bi2R5TXz9icv7hefxpP+x2TXSZtJA/88fzgMAdG3kQ68iOs1s7lD16sXZsZNngiigyXAt8/hCxa1TFskJ0SNLnVhljb2lHqkbSBubuX0Hg8lrNbwEb8IoUNb2NwHRb+9Ji5Kke1n+0bfzxZ1s4H2kpXig2x94pQ2OGxOZg+H2ElO6qQgiu/6fqhOkyxQuUT3Rb4JiBCFR/gDVvwxN0y4K6BoE+0+VTFBFSBUY9wHBRtQuOMVWbaB6D2TIKjxmcQVTqe5YzsCbff+lh/VhVvm0/G8Oodb8LDnkiGdJ6l+yr5GvKSxS5+hR0iXClT9EV4R3AMBuDbkox/vdjZ5f0jeRNwxbQKGo67KkjrHiO8Ifo7ei4cdtLnuUl0B2Z1Cn9B9wIADL6/VoaWBDUuXsl2XXr5y54K8NJ3MkoETddN/wRK6KcUiRit0ALAcOtvCvhJGIz8lbdrkinQVhYQYZm+LBL2jz47OjYd/Po2rVhEUfpdytB6NUIfofRv5SIA/GJQucHfm+lxa/Xe6851YrdN5BSkH+Xo+KWIymfCmfEkjZBsfzFtSdeamFiHU6P8U/Rfjw6oyvUWgTZ/ulHg5xIZ8p4rnPIQ8tSRiP9S7/JZDwkUyMLZeV5422cLgP/tG4mo2FcX0b/w6zfFZwOJcGnVsXs0GF+fW0t55k4plguB8XVpDq8ODcge41CElm97lVcLm576cqa4HwFu6pFdjWvYUT3UFpCnMQtg+xqGPEu1VZkF/dYhCH5lyRq57/7rC5/qrNvHVwwYx7AA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(53546011)(6512007)(6506007)(71200400001)(122000001)(2906002)(26005)(5660300002)(186003)(66476007)(8936002)(66556008)(76116006)(508600001)(6486002)(54906003)(66446008)(38070700005)(4326008)(8676002)(64756008)(91956017)(6916009)(316002)(36756003)(86362001)(38100700002)(31696002)(82960400001)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amdJU1NkRlAwZ1JBbkdxTitxS1ZhRmhvclpIYWdYZENjSE1ja0Z5S3BqSElu?=
 =?utf-8?B?Z29FR093VThUUlBleVRSQStyRDNOSmxtYnFVUlc5bXE1QjlnTVhQd29scG9G?=
 =?utf-8?B?RWFtb3NlUlROUHZabjRTR2NqKzFia0tzaVRMN2RrWUF1Vk9zcWYzVGhvOCtr?=
 =?utf-8?B?V3c0T2FRSUozbktyWUJtcEwzUXlTc2d6bEpuU1lqdkpENHErZXdKVytUZlZJ?=
 =?utf-8?B?amlrYm9neTVwZVpvb3cxT1VwdFR5dnJDVWQyUVY2Mm92UnQwSHNFREREd2pw?=
 =?utf-8?B?S3o5Z3NvZWJMY2t3MDAvcmprWFR0SmplN21xdE1pS3ovT1RZVE42TW45ZXlX?=
 =?utf-8?B?YzNjempwcFVhcFh3c0RwUmZVWmNySmdIdTZLWmVBZ0dRcXNJRnd4WFhESjZt?=
 =?utf-8?B?d0o5MTFtM2h3b0hKR0liUGJkcVlibSt1ZDVSRVZFRmpZYWt1QUdvcTBaR2tI?=
 =?utf-8?B?S2FKNTh5OGJGZFVwczRaaG5sSlJhZmsyUjR3YmNNZ3Fvb1dqSHV1aG5RdG5k?=
 =?utf-8?B?Sm1tTnJCcVNHQkxtQU5FZVZrVnhBUXVnM1lQVXRRbS90cU1WYU94YjNwRFd1?=
 =?utf-8?B?bklYYXNvUkwyUjB0TS8xMHRUa2w4a00wU1hvUEVabGpFdUFkSTVSczd4eXRW?=
 =?utf-8?B?OWFxdExvNDc2TzJpRUhuU2lVT3ptb1lHZ1pHb2VnLzk3Ujk2RXRpQ1A0SGJq?=
 =?utf-8?B?ZnVsdWFXaExkeTVTRGRvRTgzRUR4dllxRmswcmJReC9Hcnl6cDVKQ1RscjNj?=
 =?utf-8?B?UmhPR3JtQXpIVFhHWWEzRmh3YVpNRFQ5WlVndktvZll4ZFpVNURBZkR2Z2E3?=
 =?utf-8?B?bXh0V3BNSDZzZ2J6cHp5c21ydWZJTWRWNnNLMHVkV2NzdDB0MzFYT0t0WnlF?=
 =?utf-8?B?SllZMHBJU0REM25aZXY4UTBzWGxnclYzZ1kzcUtXWTZUcEp5OFVwVmFPZ3V2?=
 =?utf-8?B?UVM2dWw4S0NUZEdPMlVtWUEwZy8xeGsxM1hxN1llWTYzenVFaGUrTGlUZWpp?=
 =?utf-8?B?SU1sTXdmY3N2SGY4dXlQejVHdEtDdjJXZ1h6dTRRanZjek5CcHFwdjZKRytY?=
 =?utf-8?B?ZWUzZlZBbHd0TGVOeXJxTDVuRGJaRG9Yazk5bmpaeE04SElLMW9DTGQ4VXh4?=
 =?utf-8?B?WlZ1V1pkd0R3VFZUTFF1VFJ1aUZBQUgrb0UvRW9xVEhtV3F2ZzZhWHBpakFD?=
 =?utf-8?B?UktvbUxFbDZFMktKNHlaeEFFYmtYcENEbllkU09RUWlXRm5rUDBISmEvbGVp?=
 =?utf-8?B?dTFLZlR2aENwZklzYWszeXBDelRpc3NrdWt4VXVJL1k0SjhMRWI5NDhsQW1M?=
 =?utf-8?B?Tm1hNlVSQ3RmOGNrWXQrNUg3ZWJzV3lVNzFYc0t1bFo1eTVqMmFra2wvUGZu?=
 =?utf-8?B?cW5hbWNheWppYm1jei9jNDZBQ2psdEVEQ3pKTHRDNU5SNm04QkpFejZxemtF?=
 =?utf-8?B?OUJRZWRDWlJxNUJrSUFZNkcrYXdjRmJzak81OGpUUys5V3Z6alBkLzdoR25w?=
 =?utf-8?B?M3pzN2xoZjQrT0ZwUHpacFZDVk5CekFEeVNVWW0vc1Q0MFByTGFlblFXTEw3?=
 =?utf-8?B?emtxd1dCQUVIdHRvWSt6NTB6Y1FFZk9XeGdtejQ4Qi8ydE9Gay9MUXlVais2?=
 =?utf-8?B?UGo4TWNNSkJ6eG5vZU4xL09oVEF6TkdDdE1aQm9qQ3ZNazh0RjN2M2VVMW1Z?=
 =?utf-8?B?ZzdMcmFrVHA4YkdBSUlWSXRQdVk2U1gwbHZXT3BoMHdUMTFYVGFPQ3hyUzZY?=
 =?utf-8?B?cFc5b3UxdFVUMDFYVnpkMFN3R2hRTDVxNytEQWdOVnY4VFJMcU9nRkpOOVlJ?=
 =?utf-8?B?cndyaEZjNHZnbEJ4czBsOVpDbm5RaGo3RmUwdHFrUlZRc28vMGNBdlpUMGpq?=
 =?utf-8?B?NVBjZll3bmRJSWdYQldLd2IvTnRncVVMMENvRVR6akIxSFRvVDNpR3RmbXJP?=
 =?utf-8?B?cE1hWnBaZEtiVEJKQ2RtcWU1V1RSeitsM1FvcytWL1JFZVQrMno5RGdQN1Jz?=
 =?utf-8?B?QXk0c1Fxa09RVDZISVJ3R1hENVI4K2o1L0N2REdOM1ZhRjA5V3BvbWRoM2ow?=
 =?utf-8?B?b2hkSkJaS3pPNkdwc0MwZ1hVazhNSE5TUjJ6UjFrbmlHYTJHRjFldk44OFYx?=
 =?utf-8?B?NyswdnR1aFVvdnBoSUwzeUF0UWtXLy9oS3l6OUd6TW55ODZweFk3QVJxTm90?=
 =?utf-8?B?enJmb09tQ1cyUW91ZDZsM3p6Qkx6ZmxkU3JyeUxWUkNSTFcxOUVHUzZaUGpB?=
 =?utf-8?B?aG5NdGRlVWhFUHY5TlB4SFI2T0h3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AED2B1A18CCBE2409E23E90DCC174DF8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c924a774-f285-4cd4-e2fe-08d9f0d6eb64
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 23:00:11.1623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dIHWOQdoZ78tz5bCkXOhxsPeoZJZsiFQmKHup09beB7mrMS/4EsJL3xcyVJlwI6Qh8HkDVhG3CW3YLLR0hfluSOGJHnIqK/WzPsDbITmqPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6046
X-OriginatorOrg: citrix.com

T24gMTUvMDIvMjAyMiAxNjo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTM6NTEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBVRUZJIFJ1bnRpbWUgc2VydmljZXMsIGF0
IHRoZSB0aW1lIG9mIHdyaXRpbmcsIGFyZW4ndCBDRVQtSUJUIGNvbXBhdGlibGUuDQo+PiBXb3Jr
IGlzIG9uZ29pbmcgdG8gYWRkcmVzcyB0aGlzLiBJbiB0aGUgbWVhbnRpbWUsIHVuY29uZGl0aW9u
YWxseSBkaXNhYmxlIElCVC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCj4NCj4+IC0tLSBhL3hlbi9jb21tb24vZWZp
L3J1bnRpbWUuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9lZmkvcnVudGltZS5jDQo+PiBAQCAtMjEs
NiArMjEsNyBAQCBzdHJ1Y3QgZWZpX3JzX3N0YXRlIHsNCj4+ICAgICogZG9uJ3Qgc3RyaWN0bHkg
bmVlZCB0aGF0Lg0KPj4gICAgKi8NCj4+ICAgdW5zaWduZWQgbG9uZyBfX2FsaWduZWQoMzIpIGNy
MzsNCj4+ICsgICAgdW5zaWduZWQgbG9uZyBtc3Jfc19jZXQ7DQo+PiAgI2VuZGlmDQo+PiAgfTsN
Cj4gVGhlIGxhdGVzdCB3aXRoIHRoZSBuZXh0IGFkZGl0aW9uIGhlcmUgd2Ugd2lsbCBwcm9iYWJs
eSB3YW50IHRvIC4uLg0KPg0KPj4gQEAgLTExMyw2ICsxMTQsMTkgQEAgc3RydWN0IGVmaV9yc19z
dGF0ZSBlZmlfcnNfZW50ZXIodm9pZCkNCj4gLi4uIG5vIGxvbmdlciBoYXZlIHRoaXMgYmUgdGhl
IGZ1bmN0aW9uJ3MgcmV0dXJuIHR5cGUuDQoNClNvIGFib3V0IHRoaXMuDQoNCndoeSBhcmVuJ3Qg
d2UgdXNpbmcgX19hdHRyaWJ1dGVfXygoZm9yY2VfYWxpZ25fYXJnX3BvaW50ZXIpKSA/wqAgSXQN
CmV4aXN0cyBpbiBhdCBsZWFzdCBHQ0MgNC4xIGFuZCBDbGFuZyA2Lg0KDQpXZSdyZSB3YXkgd2F5
IG92ZXJkdWUgYnVtcGluZyB0aGUgbWluaW11bSB0b29sY2hhaW4gdmVyc2lvbnMsIGFuZCBDbGFu
Zw0KMy41PT42IGlzIHN0aWxsIHZlcnkgb2Jzb2xldGUgbWluaW11bSB2ZXJzaW9uLsKgIFRoaXMg
d2F5LCB3ZSdyZSBub3QNCmRlcGVuZGluZyBvbiBzb21lIHZlcnkgc3VidGxlIEFCSSBtZWNoYW5p
Y3MgdG8gdHJ5IGFuZCBrZWVwIHRoZSBzdGFjaw0KcHJvcGVybHkgYWxpZ25lZC4NCg0KfkFuZHJl
dw0K

