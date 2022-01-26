Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6742C49CB04
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 14:38:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260902.451143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCiUb-0006Og-Gj; Wed, 26 Jan 2022 13:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260902.451143; Wed, 26 Jan 2022 13:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCiUb-0006LA-CY; Wed, 26 Jan 2022 13:37:45 +0000
Received: by outflank-mailman (input) for mailman id 260902;
 Wed, 26 Jan 2022 13:37:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCiUZ-0006L4-6O
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 13:37:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20ff71b9-7ead-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 14:37:41 +0100 (CET)
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
X-Inumbo-ID: 20ff71b9-7ead-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643204261;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7BTEWlpuQy4O8gniYLtwQBlmRv6vK8LKl4a/i6yzY6k=;
  b=dcz/iSIEkmfKYQ7Evh0XGwsUEGCvlhxdz1XK0pShaKfqvaDMtRzTmwBw
   wXrLvVt6yZ5hs2DQ2WmevH79o3e0LWu5edObfhYXt2jgCoi+JJeWmtNom
   saAdOCX9TFfVk1hI65DCcyn+INoic5yQ2VI+6kBYAfn/k3aMlfa4M83Y8
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LGp78/jgwmo9l1aDVLePHRnvYQvJu964NYsDNT1pZmD68MEnaLd3F3IuYJD7Ss7bwKqJfTT2jy
 EUWvWEjGqoQEhHrSl3FKhNWlnwHUpTU+zktPqF4ABLOiWnyt+og1yEKqjZD6Fl7Vf8WsrM30G9
 FygYsKhLWGN4WV2V0f3sKAG6TFQ8G4V903puQ0M9w7wvhyCO4a+0xXfjnta07aufEJ+88BPPix
 A3TT3Il4mEKNcVUdbYvB7UPSwGmzf5xiNYacv/s8BfENHrqvdt2IAHbRhv4JdOYBxOrRfJ4aOH
 /Zlwd3RAHy6AsjNEOkk5howA
X-SBRS: 5.2
X-MesageID: 62797631
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vLTNwqtlp/+ugpZOvB+3LrQaDOfnVLtZMUV32f8akzHdYApBsoF/q
 tZmKW3QPazfNzDxLdx0Ptzj80IBvpfTy4RlHQRvqS02EHtG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllI6Pb14xHKf3ib44aR18DQs9P78eweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 ZVINmQ0NXwsZTVjEwtQFqs5ld60myXkUyEB92yZnKAotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8wo1yfU0oje2BfDI1IAaiBrK9407PZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQmzARVodt/xory9U
 J4swZn2AAcmVsnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1aZ9fJGG1P
 BKD5mu9AaO/2lPwPMebhKrqU6wXIVXIT4y5Bpg4kPITCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2lk3yPjOTPDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbaNmPT0FDr2nCsQWmKZORW03wY8TXMCv9JcPJ7fde2KL2ggJUpfs/F/oQKQ894x9nebU5
 HCtHEhezVv0n3rcLguWLHtkbdvSsVxX9BrX5AQgYgSl3WYNe4Gq4PtNfpc7Z+B/pudi0eR1X
 78OfMDZWqZDTTHO+jI8a5jhrdM9KET31FzWZyf1MiIie5NARhDS/oO2dAXY6yRTXDG8stEzo
 uP821qDE4YDXQlrEO3fdOmrkwGqpXEYle8rBxnIL9BfdV/C6o9vLyCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWtO/kOzPb82yvxZ57fNyJJT2NBnnp/KiCZ
 PlOy62uOvMwg1sX4ZF3FKxmzPxi6oK39aNa1AltAF7Cc0+vVuF7OnCD0MRC6v9Ny7tetVfkU
 06D4IAHa7CAOcejG18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXwPNqZxPaMk3
 fwl6Zwf5AGIgxY3NsqL03JP/GOWI31cC6gqu/n22mMwZtbHHr2aXaHhNw==
IronPort-HdrOrdr: A9a23:TqBBa6sQdirDkdsawsAPJVPx7skC0oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPmftXrdyReVxeZZnMrfKlzbamLDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sJxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMAE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF4t1HqWxa1e
 UkkS1QePib2EmhOF1dZiGdgjUI5Qxer0MKD2Xo2UcL7/aJHw7SQPAx+r6xOiGplXbI+usMjZ
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYd099Q/Bmcga+d
 NVfYrhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtV5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdE15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAW23G4gMyLeFPGC1zwdLkeqbrWnxxEOLypZx
 +aAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="62797631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMNZlOZeel3iCB6KJSmDwbkw8A7EMiLQz9loOMUCIDJICh2s2Zgwrb/sjYB8dQkyHu26VcyJ4K4BU+F2xS24BMSYbA8qKbbJXtpQyW5fCCfnHEGT3LZbbgZpZEpxZAt3RNYes4lHVlHQ/466I2DOHP0bgKQilpENhVOT7zuijiU0NhF7a/4S32JAsMZTms4dhYDO6Quf8FtTI1CO563s3HkmhgcLo3wiH+yFJ3seOTguatsWzUQ9lnRqTpxC+f9Yzf3C+a7ovXA5QlGKtugmOTvGvK1mhhhnCO76NaxMVkjaXJz8w5Nfex6OaZl5x+rdN5Y2+Pc9RsZu08lt1zcgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BTEWlpuQy4O8gniYLtwQBlmRv6vK8LKl4a/i6yzY6k=;
 b=GejYyCqHovmdG2oAQpPACMD4BvfoXGsdTK/Zi/YgFkCvFH3t/7+IIAqEQ6iU3lNBrUZVAWLECrrp+kLZRC0bayCP+UMdiq6ffB9mB9d4rgCb+WGqJ7WzMtL8/U9ddxGQ9u/MpRQePs2bTshiLEPDUfIbPmojlgLafnYLLvdveUDh1mH+9ODCpBTMoZop+PrWJ1Kz7XWwiYHBEmeIaJP0653EOwsB5O4iX9aMeitSxEK8377No2OgPjN1n+yEcP0fFRpkBEsPxD9ZmH6zbrzSUvLuvks8dczCkdSZijuIqbptSXGFdl3s2zcHal3rKGSh9olm/wfX9oCuYuCpKqnQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BTEWlpuQy4O8gniYLtwQBlmRv6vK8LKl4a/i6yzY6k=;
 b=e+GnVIbdyq1O5UbJjaQsdcvC4n46XW2bprqkXnp9W7zTa4MBOK0gkeqBQEJ8T1jmh7auvRN9xiD8Y1LfLv00EZ4jzAy8JA5Y4w1Y49cifTF0znizku5gXqEKIftAQktExXtm77eHWDtPnT4HlEKl+YxMZjOxAvH6g9SyQ+PzTcQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] x86/boot: Collect AMD speculative features earlier
 during boot
Thread-Topic: [PATCH 2/8] x86/boot: Collect AMD speculative features earlier
 during boot
Thread-Index: AQHYEpEIIirjIKT/SEuiwA9Vczaqaqx1P8uAgAAO04A=
Date: Wed, 26 Jan 2022 13:37:35 +0000
Message-ID: <0d457a94-64bc-bbd4-e7ce-59c3b1c1d2f4@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-3-andrew.cooper3@citrix.com>
 <YfFCLxnGDeuk/va0@Air-de-Roger>
In-Reply-To: <YfFCLxnGDeuk/va0@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cffb702-24ab-4faa-44ea-08d9e0d10330
x-ms-traffictypediagnostic: DM4PR03MB6158:EE_
x-microsoft-antispam-prvs: <DM4PR03MB6158206E1E4F5EC15E7949CEBA209@DM4PR03MB6158.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K+Ewip7t0sFuEPxl+gUnKRUMI7g2adeznZx/TRxbnD2ePDyQAZF/aSHOc70zKtjxhKL/YveibX2eW5BLH//LWrmbFASiu92ey8/nOtcr00bek3J2OQPJyslY78/Rl+EZSCoKlOotwbAF2vbdo3fR2Um74K4kanMMkUGBZ36D+9xfBHNX9TAZVXOiKm2h4p+Q0lq7q1SVcT2lLhkEcAjzGLKqbbcjJFTl7tuZATZ1PF+EQGpVbxzUWWkkRahL2lPxraA3pd8se700ELi2DPzId4w+8RIqQwoq9pRrgVglUXXPg1kgzlydlgmgyOTEkgdroKNmaBL5CvX996Rea/YfXBXDHAVC/pnFofRhYGJkLb9/3KYHKyFmcObq4RaLfwaUrD1layKkf716lDYSOsUOeHzGcpfEz5hqAq/DqPqsxoveiTbQ3Sa2cOOf8TaKd95rD/hyl5njYxXt4vNaMEDWxXdpagmrb0/EbzXUSaBcDGjXN3lcuIr1ZrmfDOjW2d1N7urulujMgq2Ub6MeRmt2dUXZOuvVU2BwpunhXhiSwdqmpq/tmUohSRW+8nrqWV+rgpJZFuKvnc3AnFqPIFcHB+56ajxzGRJL/aYAZoe5cyrfP8h0ZZcm0m9xxJnuY/plqDfRHYZqTLZdggzzpUslwlgTTMJbgt7MIN2E6bSPYTF1IVKEqm9hjLM0vPYMxKPFEIE92lh5ZOaBFGJtB1pSfC0ahfDxMnPJ9hu+DIkO6rthyUsRDyseojnB7Q42xLsguzap5bemGXi2PYacT9TNeg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(36756003)(2906002)(83380400001)(508600001)(5660300002)(186003)(26005)(2616005)(76116006)(66476007)(8936002)(66556008)(8676002)(66946007)(66446008)(64756008)(6862004)(4326008)(6512007)(82960400001)(53546011)(122000001)(38070700005)(91956017)(38100700002)(6506007)(71200400001)(6636002)(86362001)(316002)(37006003)(54906003)(31696002)(6486002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Snl0eFpiZnppOFdGU1hpdlo0UTV4TTFpRmZrQnpPcWZoT2hvbGp0cTdhd3V2?=
 =?utf-8?B?SGtNbWN5VHF3ejZhZ1hpYTE1ekdDM0tqM1Q1MC9pQStWL2JCWEtLbjlqekFC?=
 =?utf-8?B?NkhNbTkvTkFHc3UwR3l3c3pnQXd6N3FIVkN1K2dkaVQyajN3YUIzZXlNcXNm?=
 =?utf-8?B?MTZCSTdvaVJIZVgyNllFbzkxTmpORkxBWFo2ZW5XQk9nSEpRaTROZWN5cG1S?=
 =?utf-8?B?aDRrWjFmYjY2ZDdKNGFuNWZuWVJndFc3TVFkU1ZjbDVFV0pydEdUclcwU21H?=
 =?utf-8?B?Um9CZEtwMWMrTnI3bDhKek9VTVJiNm0wanlPOXNkdzZMdFNCVXBYMWRIYnVH?=
 =?utf-8?B?emd6OHdGbEpLbitxNU9sMUkvd1o2dmJKckVwSzBLa3pvc2tEZkhKdGxmUXhY?=
 =?utf-8?B?RkZWQ2Y4MTBSckI1ZHA0d3RjZmFhMG9VN3RpVWNHbHUxK29zMXN6Ynp6dUts?=
 =?utf-8?B?U09aNEgydHJNR0ZJdEp3Vmh6YVFuN3JIZWdwMm1PSWlhYmZqZHorbnFTektz?=
 =?utf-8?B?SThVc1BTaXpnSTlHQVN4Q3ZxaTlyK3QzOTN2NnBadnlsTy90YUt0RGFSWWNp?=
 =?utf-8?B?SEwwaXU5aUNvdzlrb1RSZWcycmdYWFVPT3FHYXJsaFl5QUZDU1lEY0Q2UGk0?=
 =?utf-8?B?TWE1bXBOOTVZS3grMkNjMTVVYStDUmJyYWRKZ0VQSW9McElSY2tVLzVxTmNa?=
 =?utf-8?B?cElNditMeUtaa0lvbWYwS1NvS0RUcTBQa1cvQ3MwTEd1K25LdG1BRkQ0M1pO?=
 =?utf-8?B?UXY2WEFQc2Z0VTNheldTUjBzUHBBUjRxVE84TGFvQ1lEaStrYVZubEVRaks3?=
 =?utf-8?B?Z3FjWDBWMXRvTHRCMWUxZTBENUxHZDE3S2NnaTM5Z2dzRmM4V000MXU0UENU?=
 =?utf-8?B?SldMTytCUC9pUmJudzQwUERoS0QrSUo4VnBkZEFPbTlIa0tEajd3ODUvbW9v?=
 =?utf-8?B?endLUkx2ZWRIQ3dYZVlqeEpHZVhCeENUVGQxdmFUTDNOTGN5S29vZzN6YmFQ?=
 =?utf-8?B?WWsrSnRFVmZxbStLWkFlQTZJVUNDSVgyRnhuRWJZd1N4aGk5WXpzMTcweWNj?=
 =?utf-8?B?cllPaVNwdzdOUWtxQ0Rac0NxVEdyb3QwMmxQMDJNZmdDOVduVDdnUE1FVjlw?=
 =?utf-8?B?ZER6OFAwSDN4S21UR0pmR0FuaUpUcDlEcVJZZjFrYTNnbTYrcTRFclBVL1Zx?=
 =?utf-8?B?a0h6ZFQvOHpuWS9WbjdXVzBzQWVPcGVwTHdtWXh6alBmbUZDODVCOUpXTnJH?=
 =?utf-8?B?RnhJcldPNmhjenUxdzdtNHdCTGIrZmhTbE9GUWp2YWpnQ1J5ejZySjRiREVP?=
 =?utf-8?B?Zng5MUpaelBiTVhRZ2loQnphc1pSbXZqSGVCZ21nL3djQmtrUzNUaWhlaVFS?=
 =?utf-8?B?SXZpQUNLM3VqZThTSzAzamNBaHh3TVg2NDZWRFNwTmRyOGlIWWJDNkx0Yzhs?=
 =?utf-8?B?OVpvbXJHSWN0L3FhbGZibmFhY09GeTdtV2xSUDI1WG9CdlNIdFpEdVY2OTBm?=
 =?utf-8?B?ZDNBVHoxM3BKdnhJTHgxSGVvU0xLdkRDdFZEUzdCWXQzY0ZESVIwamFiaGxP?=
 =?utf-8?B?TGVjOTVyZnBqUVRQcnA0VnhZUlZCUzM3SE4xUi9QODdtQ05FZUtXdUZIRUJ1?=
 =?utf-8?B?Ly9aRTZ3MWR1RTc4U3VsUDdycUFTVWE3aFM3Sk0veVBUd29IcGxiOFdQTitt?=
 =?utf-8?B?NXdvazhoMDIxRUdUVkF2cFIyZGs2cFZDcjBjSGp6b1JvYjRBT2xWTXdsYmlO?=
 =?utf-8?B?K3RBTk92eklRMGlkaWlma1krTittWDAvZ2dad0ZXSDJzVFlndFppTG9OUHp1?=
 =?utf-8?B?T2FKME53SVZRNEhMT0RQWDZMLzgwNnpPNHNFOGJ3cU5obURRNk54RW41TGEx?=
 =?utf-8?B?UWNxZ3Rja09Vd2pFMWU0SVpUVkNDNzA5ZDNIaUlXUXJvMVdlMElabXI3QkIy?=
 =?utf-8?B?YU1KdFc1TVF6bG5ONEFudHQ1blljVGpmRnkydUhCUG1sY0Q4M0cwcStpUmY0?=
 =?utf-8?B?b0t1dHVlL2t0YjZxMVJOMngvSVNSRkMyblJGd09pc2VXS0JTVCt4QzM1b3hh?=
 =?utf-8?B?clZ2V3FEc1ppVnROOTZQd0x6NmYrbFpaWUpjK0t1UUFNMXRHY1o0dzhLSlZr?=
 =?utf-8?B?eFpoL3RmQ095dmNuWVJwRUpjOFNKUElKd2FHVnU3UXRaaEc1dTZGVDFFam45?=
 =?utf-8?B?bXgzdTNCUTV1eVNNcG9BZmNpdDRKNURzNEdlZW4vaitrL0VlWjgyWTNuY0lo?=
 =?utf-8?B?cFZ1UGQvckJXakZrYXlVaEpCNkpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF4B5EE55B869046BC68C657360F1CD8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cffb702-24ab-4faa-44ea-08d9e0d10330
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 13:37:35.4823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Meb0earDCbzRYfTEu1CdWs2KKZB/yscbUB5w5BGYvQwW1Wq4J1Tlsxqulyhmb4yEpvDOm2dTdA3BggtXKw1Zgx6pmqcTCSEmHa7qIL+s3BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6158
X-OriginatorOrg: citrix.com

T24gMjYvMDEvMjAyMiAxMjo0NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBK
YW4gMjYsIDIwMjIgYXQgMDg6NDQ6NDZBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
IEFsbCBBTUQgSUJSUy1yZWxhdGVkIGZlYXR1cmVzIGFyZSBpbiBDUFVJRC4weDgwMDAwMDA4LmVi
eC4gIENvbGxlY3QgdGhlbSBpbg0KPj4gZWFybHlfY3B1X2luaXQoKSBzbyBpbml0X3NwZWN1bGF0
aXZlX21pdGlnYXRpb25zKCkgY2FuIHVzZSB0aGVtLg0KPj4NCj4+IFJld29yayB0aGUgZXhpc3Rp
bmcgbG9naWMgc3RydWN0dXJlIHRvIGZpbGwgaW4gYy0+ZXh0ZW5kZWRfY3B1aWRfbGV2ZWwgYW5k
DQo+PiBzZXBhcmF0ZSBvdXQgdGhlIGFtYmlndW91cyB1c2Ugb2YgZWJ4IGluIGFuIG90aGVyd2lz
ZSAweDgwMDAwMDA4LXNwZWNpZmljDQo+PiBsb2dpYyBibG9jay4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+DQo+IEl0IHdv
dWxkIGJlIGdvb2QgdG8gdXBkYXRlIHRoZSBjb21tZW50IGFoZWFkIG9mIGVhcmx5X2NwdV9pbml0
IHRvDQo+IG1lbnRpb24gaXQgbm93IGFsc28gZ2F0aGVyIHNwZWN1bGF0aW9uLXJlbGF0ZWQgZmll
bGRzIGZyb20gQ1BVSUQgaW4NCj4gb3JkZXIgdG8gZG8gZWFybHkgc2V0dXAgb2YgbWl0aWdhdGlv
bnMuDQo+DQo+IEkgdGhpbmsgeW91IGNvdWxkIGFsc28gdXNlIGJvb3RfY3B1X2RhdGEgaW4gc3Bl
Y19jdHJsLmMgcHJpbnRfZGV0YWlscw0KPiBpbnN0ZWFkIG9mIGZldGNoaW5nIGFnYWluIHRoZSBj
cHVpZCBsZWFmcz8NCg0KSG1tIC0gSSBtYXkgaGF2ZSBhIG1pc3Rha2UgaGVyZS4NCg0KQm9vdCB0
aW1lIENQVUlEIGhhbmRsaW5nIGlzIGdpYW50IG1lc3MsIGFuZCBJIGhhdmVuJ3QgaGFkIHRpbWUg
dG8gZmluaXNoDQpteSB3b3JrIHRvIG1ha2UgQlNQIG1pY3JvY29kZSBsb2FkaW5nIGRlcGVuZGVu
dCBvbiB4bWFsbG9jKCksIGFsbG93aW5nDQppdCB0byBtb3ZlIGZhciBlYXJsaWVyLCBhbmQgcmVt
b3ZpbmcgdGhlIGVhcmx5L2xhdGUgQ1BVSUQgc3BsaXQuDQoNCkhvd2V2ZXIsIGluaXRfc3BlY3Vs
YXRpdmVfbWl0aWdhdGlvbnMoKSBpcyBjYWxsZWQgYWZ0ZXIgbGF0ZSBDUFVJRA0Kc2V0dXAsIHNv
IGU4YiBzaG91bGQgYmUgc3VpdGFibHkgY29sbGVjdGVkLsKgIExldCBtZSB0cnkgdG8gZmlndXJl
IG91dA0Kd2hhdCdzIGdvaW5nIG9uLg0KDQpGb3IgcHJpbnRfZGV0YWlscygpLCBJIGhhdmUgYSBm
ZWVsaW5nIHRoYXQgbWF5IGhhdmUgYmVlbiBhbiBhcnRlZmFjdCBvZg0KYW4gZWFybHkgdmVyc2lv
biBvZiB0aGUgbG9naWMsIGFuZCBsaWtlbHkgY2FuIGJlIGNsZWFuZWQgdXAuDQoNCn5BbmRyZXcN
Cg==

