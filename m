Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D65428DBB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205996.361441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvFP-0007Hb-S7; Mon, 11 Oct 2021 13:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205996.361441; Mon, 11 Oct 2021 13:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvFP-0007FD-OI; Mon, 11 Oct 2021 13:21:43 +0000
Received: by outflank-mailman (input) for mailman id 205996;
 Mon, 11 Oct 2021 13:21:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZvFO-0007F7-7f
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:21:42 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b8b8150-2a96-11ec-80d9-12813bfff9fa;
 Mon, 11 Oct 2021 13:21:41 +0000 (UTC)
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
X-Inumbo-ID: 2b8b8150-2a96-11ec-80d9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633958501;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hLTWWIFfBIixB+m4hOItyJlcjUoDYUNEkghcP+AfRk4=;
  b=GKWqU9ko/Vz1ifHVcPGXSawM4gXNfeNdBHH5TgxtIqKIjyufuO2PPJwO
   2jFQpizCiogHUOBGsxNoGnqTyy1UUREUbUJk0DHiKfdpPxenJLGI1QrZC
   nE8VuhBz9MDdXbuyvfTamoA8zYtbWdFQKqsHk4en0+nke5mEOenz+b2nX
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DGYQh72bENi4XMeM7yrPXYSvypyxLVd0o+ygSMJVoEUq57KDaBiEpTbMo5qGfjhidA0BWe1lT2
 kzwmFYUWr9d925X64hkIWkXlmvQqcRICU+uQbdivvZIpQeL/639MZPXSXNuYzMPwABlOITURwl
 fij9AhPNkujR9vxtGeRkAxAJOGHIa9/1SdDtyrmCqXMX2JsYbvLWyNKClhjTApIKoY8T5KUMaQ
 2tYKfm4pgJ9PQoE2hXtAKKjxZn4+t3eJ/EF1QtCsw4WItY4HufVHdE9Rgv5pmEc1aA+9gZkot5
 OIV620q9Tx7Ocy6zdMdz8NfH
X-SBRS: 5.1
X-MesageID: 54875794
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:25TZZKO1jqtTjYXvrR3vkcFynXyQoLVcMsEvi/4bfWQNrUorgmZWz
 msXXWvVOq6Kazehc41ybo+y9UoHsJSHnYNhTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Us6w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo3a2tI5h9
 +RAib+bClozBJzlnN0XTBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iWtYAFg2Zs7ixINa/9a
 cUidT9FVhKeU0BkE2lNMqsnpfj90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiRNpXtlaVo
 Hrc+Gb0CQ1cM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQRBwcRTkCTuuSihwi1XNc3A
 3Yd+jcq65Mz8kOrZtDnWluzp3vsljQRQcZKGus2riSE0LPJ4h2xD3IBCDVGbbQOnck6XzFs7
 kWbjszgHzVHuaeQD3ma89+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRrvmbOXXjEE6zn0dSH49DlITYqcbZOnvA2zAel7EK6VSVyIv
 X4hkseY7fwTAZzlqBFhUNnhD5nyuK7baGy0bUpHWsB7rWz0qiHLkZV4uWkmfC9U3tA4lSgFi
 aM5kTha44NPJzOUZKtzbpPZ5y8CnPW4S4qNuhw5aLNzjnlNmO2voHEGia24hTmFfK0QfUcXY
 8rznSGEVydyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXVNbBotPzd+VmLq
 L6z0vdmLT0ECoUShQGNoOYuwa0idyBnVfgaVeQGHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1E
 oKVASdlJK7ErSSfc22iMyk7AJu2BMoXhS9rbEQEYAfzs1B+MNnH0UvqX8ZuFVXR3Lc4lqAco
 jhsU5joP8mjvRyeo25DMsKn8NA7HPlp7CrXVxeYjPEEV8cIbyTC+8P+fxup8y8LDyGtstA5r
 aHm3QTeKafvjSw4ZCoPQP7wnV63o1YHn+d+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvtMkQbZmxK4z/fX1oLpewlg2FXnHdQ3zWLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd8N7aNz/AZnDXW/M8ZGkSi6X8l5qeDXGVTIwKI1H5XIoxqPd532
 uwmosMXtVCy00J4LtacgylI3G2QNXhcAb4/v5QXDYK32AomzlZOPc7VBiPsuczdbtxNNg8hI
 yOOhbqEjLNZnxKQf302HHnL/OxcmZVR50wakA5cfwyEyojfm/s6/BxN6jBmHA1awyJO3/93J
 mU2ZVZ+Ir+D/mswicVON4x299qt2PFNFpTN9mY0
IronPort-HdrOrdr: A9a23:BAZrFKvYgHD7lT5FwiT5iYGC7skDctV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urtBEDtexzhHP1OgbX5X43NYOCOggLBRuxfBODZogHIKmnT8fNcyL
 clU4UWMqyUMbGit7eY3OBvKadD/OW6
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54875794"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7vLOzsSWC4o2AGLa2/Ix40DnvS4ZhVMJzB5MVCBIiSzOPXmwkiD6efd/9k6oYHvtNXdLiqsPwsf+8lhuCpKiPZnVtXmMtT1SCJddjLJgctgjtz5Nwk2vqblcFjRlxdGPjru6qx+uq+QPBlLooWiWCmez4pSxoJpTZ4SI4EulLe8Q8z6WD9IvODcwE0MOR9ZG1ywB/WSgwEHNQLaVHYXgvJMxsngpJ5d+iFPhyDlJDwpkNSJ8xA7SAtHdYJdDtPBQX21WQMzjVo2oklCaaj4kBgUx9ofrn251XsJD7BY2tUeYqi1PPjzxyKN+5X4Jq1Gl+SlELcj9Yd3FVpHaVWd5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egF0V+tHtMeF59ZvOVaYN9PSfuOExJamhIvU720waeU=;
 b=oQDTXRqj4r5H3HpIbqAWwMbyma5yq2vX17vDWmSTSdSinXDzcxog/VAy2+8C6uq2C5+IHj7oRhzyrTanN1JgmlJjb55ThJlfltQxxEnNYMr1PhXjCAP/qA0DUxuIz3rNXHaF80KUUE2DEIfY0jk57aN0LBjgFYnu3Rwd89nLq2eqVrt/EpLcdIFO1acQHVNTwX13y7SFFiynZs936fOmH2bb12ueX3t4STN2dKR4Wfm+2RClvO1hfWmcY52RVxCmg1cmHyQNrt6xVG8ohBn6d1TJKnbtYsPzAPHaH2nA7hHYg7mswIqsy57av3UeR9Bz/laAY4gAtr9lAHVuiTyMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egF0V+tHtMeF59ZvOVaYN9PSfuOExJamhIvU720waeU=;
 b=OGX+lOQ78NRS8v7oyRbX1yxvkJiJmlwPFVWsxWNdmCdgH2udwQsKxlal66ojvAZeBryMi+9R/gopJ09E3QY+qlgwO+35u7HRVesBDovO+faZYh2EEIM62duCGYBV3AsbEoSmbz6hneofBz8LhX3ZtofTpmtPzYq3wJfk/gtCXhU=
Date: Mon, 11 Oct 2021 15:20:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Message-ID: <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
X-ClientProxiedBy: LO2P265CA0492.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1bef990-110a-4420-7e90-08d98cb9f69a
X-MS-TrafficTypeDiagnostic: DM5PR03MB2924:
X-Microsoft-Antispam-PRVS: <DM5PR03MB292437729809B1D25A4DC3708FB59@DM5PR03MB2924.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5wmPsgWi6xyRUOx/Hesf4kColqhWz1yVtR1KSdZobRYh9g7dXg/AeKEDEmbZrazsB2AjE1htFCxjhEij/wEblBKSjhh05RlLxZLbqdff8CoTlQOKoakED80I97KV1YTXeGJfvbmRdAGn8GFSGzk7+GnlMRvvugxAeQbVKClgjsU0bHp4/N5XJohVaov7+UASWt6uayRFon9rERnYzCiaLC4dVYIOqk94c6TWY1P5RjqoD0fQBSMSrGjyRbU812lRVv4sWoBCeBjkhjDID9H5FP026wCnVVhKt3kvPo1xkBEAnG7e2P1rSfuHloohxbBVpNroU27UoIWMYVZQlYDWBIxa6/zrhPl7U72YIR2UPq5OY3Dhfocn724CpEecbOQ5IkQPCJfHU9Ori7m/wrX5DMQMNpzwwd2ACFLDsSJ8C5d1DEp0Vnat0SoiniPx+AUc/bi+BdfeQj71qv9zZhQhP6iF1sU9XpuvWCQrHnEBTgpIR7VmE0gO6UK3/HZcE+B1oXqhvk+reWAmUvy8A95QRirExyyZeHqw4pC7bOEDAm9ctGum6IU9TYZ4RowBvmcD3XO0yqmOYaIWgD3mYC6U+36wt/Cc7JmYJ6JiCt4LpQi6gtzOFwqUPFKnAhEQi1qz5++3dfJIVA0LntLioIlMzEP6i61EEH2wX6MqsaNuzOPTh1ZV2O1QZWIHhztN1vGRWD0Vg0o6fpFiLl9WIuE9zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(26005)(8676002)(54906003)(6916009)(316002)(186003)(5660300002)(85182001)(38100700002)(6486002)(9686003)(86362001)(4326008)(8936002)(6496006)(83380400001)(66946007)(66556008)(956004)(508600001)(66476007)(53546011)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K25wSmFlTCszU3dpRDNobm45UXVmaGFTajEwMWdyc0paU2ZxWGdXYVozcHZO?=
 =?utf-8?B?YTZ6SHY5NVJCV1F2SWVPcGltckw5OU9PRGNuSnNuc3d3RTcwWWE1V0h1UXdJ?=
 =?utf-8?B?WVNNS2NEYWtEY2xsV29EU2tNZmVEeW9sLzJmWjZVcnN1OWxiMW1EUjYvcTl3?=
 =?utf-8?B?Zks3cGQrK1NLd3g5M2sxV21yWCtlenlaSkQwejBvNDc3UTRiaVMyc0V2aE9H?=
 =?utf-8?B?aWpuNHpRKzNoUzQ5VnNvaEtIdGZ5SGJvRmtMVnlwNU1xT2pITndtQ05ad0RP?=
 =?utf-8?B?Yy94YlIwMjN4M2tVdTJPQnZqeldBVTFDRVY2b3ZwUmRTWUpzZE5YZHlXV0l1?=
 =?utf-8?B?aVpSbDRZZEtOSDc4SWpkc21MNnRUeFRQTEh1YnVaZ2xYMWVmTjYxTHAydGFj?=
 =?utf-8?B?TnJsUUZoeXBLZHVJQWxUSXJOYUxMVnErZXFUckl0YlBGQ05DVjBVK3drakVx?=
 =?utf-8?B?YzhUWGZPY012WFpGV1Q5d0ZRMUtFTmtoK1JucW1OalJ6aUI5c3pKcG9lU0tL?=
 =?utf-8?B?YnF5bDBMMWpQWENQanhWOGlFVDh0aURjV0dVTXNqeml5a29hSERHSUUxQTg0?=
 =?utf-8?B?REFFTjRSckF5c2EwZTg3bHdyMTlhUUtJOEttbTBkbW14RERDT1A1aExPZTN4?=
 =?utf-8?B?Rm9CSUlkcWRrS0hhd1pvQkRRaVB1WnhqY3NmdGptZDJhOFlhRGZBQ2xBbHhH?=
 =?utf-8?B?U3RhUTk0UWxUT1hOb3RLc0poWXFkRGdNdklMT3l6M3ZlQlU5UjBTWUxHYkZE?=
 =?utf-8?B?L1ZhU1psbHZ5Njd1RDRMVm14L0xmV0ZyeDRDVFE1Q2NrVC9Kbk1FVzNJdUEr?=
 =?utf-8?B?ZThvUlo2RHd5Q3B6TXR3ODErQ3RrOUdLOGNJZjlHQmZCUHplNVhoSndrQWR1?=
 =?utf-8?B?Uy9KV0FxZWFrVjRqblVQenNXV3JxSFpSbXR1VjMxUFozdGF4TVA1SVg4aHNQ?=
 =?utf-8?B?MXZ0ejRnSGFyNkczZGU1VVVRY0hCaERoQzd0QUlrOHhYQnk4S2JlTlpZWTFm?=
 =?utf-8?B?cU1YRFdZMVhrZTRKN044a3M2VER0RFZTMUtRZk1OUGROQjlSQ05HS1lRV252?=
 =?utf-8?B?Qk4relUwYno2bUY2TFBjckhybmcyTGtKNmtsN3NFb3Q2UWFqVFNhNGFZejF1?=
 =?utf-8?B?RjJScUdEdXIvRDhBQ0NoL1cyZkdjN212Y1JIQjNjQjJRYVQ5blFuc0lpZkx1?=
 =?utf-8?B?dlNxUEd0Zlh0QkIvc0NyK3ZSWkR0UFZMdTUwR0lEUDkweTdkOFhvMXNjRkI5?=
 =?utf-8?B?dWdWZWcydy9WVHRIWlRmL1RnTmlTeWNwZGZKeEZHVFIzbW00VjlhbUdpVHU2?=
 =?utf-8?B?VUhRRHdzcTNEeHp0WTNkY3RsRkJiNktjUFh3dUFJWFM1QmlJbU52a1NHWlRp?=
 =?utf-8?B?TUlwZGh5RHRlMTlKVTZISituYyt1RWs1L2RqUXhwTTdyWWttcm54amJXSHUy?=
 =?utf-8?B?M3NMdGF2ZmpzUXNQaGZyK002TENJK0RHeGUwQyt4YWtUYnA0YitEeTVSekN6?=
 =?utf-8?B?am1HT1cwSks0dXhOUWRncytPcnR4ek1HUUM5eFZLSjdRZjRFUEdEaUtrMWVt?=
 =?utf-8?B?VldBdWVmYk5tcklvTHo2UlVIRFlIUzlLSVpYVC9wd2QvdSt2Y2NKcUNoL2pS?=
 =?utf-8?B?SkVQWEJyMGZoUnA1UWxrN2RxaVVxUGsySGJMbVF1Ti9ZQXJvMmZpUnA5MjFC?=
 =?utf-8?B?Q2NDc2RXUDNEdDA1UTV3UktrbVMrU2RwYXhmekpMZzE5UWZSLzdHcHF4Q3ls?=
 =?utf-8?Q?LmsNOjxR3k2XjRWTbCZLSCHVP8Qn0gHdaKxt07B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bef990-110a-4420-7e90-08d98cb9f69a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 13:20:58.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYHROTUmWcFKqiNDxcFqPb1rEZopWBxqWYCRrWGBAzcaBJ9aJwxxYIxwum6DnY+klZYZXJnrGWf6aZUBRE3ZSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2924
X-OriginatorOrg: citrix.com

On Mon, Oct 11, 2021 at 12:11:04PM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 11 Oct 2021, at 12:47, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Oct 06, 2021 at 06:40:27PM +0100, Rahul Singh wrote:
> >> ARM architecture does not implement I/O ports. Ignore this call on ARM
> >> to avoid the overhead of making a hypercall just for Xen to return
> >> -ENOSYS.
> > 
> > What is the cal trace of this function actually on Arm?
> > 
> > AFAICT libxl will only call xc_domain_ioport_permission if there are
> > IO ports explicitly defined in the guest configuration, or if any of
> > the BARs of the PCI device is in the IO space, which is not possible
> > on Arm.
> 
> PCI devices BARs can be in the IO space as the PCI devices are not
> Arm specific. There is not ioports on arm so to be used those can be
> in some cases remapped and accessed as MMIOs or are not possible
> to use at all.
> 
> But the IO space does appear when BARs are listed even on Arm.

Urg, I wonder whether those devices with IO BARs will work correctly
under Arm then.

How do you know whether the BAR has been remapped from IO space into
MMIO?

IMO instead of faking a successful return value from
xc_domain_ioport_permission we should avoid the call completely in the
first place, specially if we need to instead issue a call to
xc_domain_iomem_permission.

Thanks, Roger.

