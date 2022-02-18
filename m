Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7644BC2EE
	for <lists+xen-devel@lfdr.de>; Sat, 19 Feb 2022 00:41:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275664.471631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLCrt-0002gk-6X; Fri, 18 Feb 2022 23:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275664.471631; Fri, 18 Feb 2022 23:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLCrt-0002e3-2X; Fri, 18 Feb 2022 23:40:53 +0000
Received: by outflank-mailman (input) for mailman id 275664;
 Fri, 18 Feb 2022 23:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nLCrr-0002dx-LQ
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 23:40:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32b38512-9114-11ec-8eb8-a37418f5ba1a;
 Sat, 19 Feb 2022 00:40:49 +0100 (CET)
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
X-Inumbo-ID: 32b38512-9114-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645227649;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=d1t8B7JvqtxBgtqAw0NwLR4XdNVHjjInxr42Sm1K8ZQ=;
  b=bfneBYciPlfoXkfIoY9EubQjwrs97lzp5zZ0+DWCyzYuIA0wfG9WeYNO
   1g1LGodg1lJzuyB8RsGmRhUa1VI+PsFfiJok/8n3moqCDa5far7+lZlY3
   5jgM3yO4FZire1MgtOgJ/J+UF8F2kBb/jY8imZlqYrEkxlVY59856LAGX
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66802860
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lJIqbKD2+Yy62hVW/8rjw5YqxClBgxIJ4kV8jS/XYbTApG4kgzUOz
 DMZWzjSP/yNZDT9fYolaYm1900Hup/XxoQ1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg0tYz6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhR4
 +dXhYWxbjwrM5TLmtRFXEhHPn1xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4QTa6EN
 5RBAdZpRAvwQUJLZnYdMrkZmeuavVjwKjp693vA8MLb5ECMlVcsgdABKuH9cdyQRN5JmV6Yq
 3iA4CLyBhgAN/SQzDOE9jSngeqntSH0QoUJD5Wj6+VnxlaUwwQ7AhAMSUGyp/X/j0ekQs9eM
 GQd4C9opq83nGSwVcX0VRC8pH+CvzYfVsBWHul87xuCooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrpv3eKyvA2
 jGtlyozvrIRvZYEhrqWoV+S1lpAuaP1ZgIy4wzWWEes4QV4eJOpauSU1LTL0RpTBN3HFwfc5
 RDoj+DbtblTVs/VyERhVc1QROnB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCH17YSPCgUxfOdvZ5yEWIU7IT4iNuhf8NIcmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTqGr1EieR1nH1nlAs/oKwXKTz9jdJyg1bPFN843KamNLhlvMtoXi2Om
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAG6WPe8KRqmhq4ClM+QgkJUqaJqZt4ItANt/kFx4/go
 yDmMmcFmQWXuJEyAVjTApyVQOi0BsgXQLNSFXFEAGtELFB5P970tf9HL8FfkHtO3LUL8MOYh
 sItIq2oKv9OVi7G63Iaa5z8p5ZlbxOlmUSFOC/NXdT1V8cIq9DhkjM8QjbSyQ==
IronPort-HdrOrdr: A9a23:V32VMq7lncXbbb7XKwPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.88,380,1635220800"; 
   d="scan'208";a="66802860"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pd9KD45R1JEZFRDevwDqR5tNm26MWPAA0VLd1qpHDXJRU6qq3dMlCdsGnmiv/VQbT6H0SgvdPJJJL/WvAqIxkmgM6iiSAInFWSf6rRRbhCZp5W37NZ+xtfn+V5V9bxhNflcgZwJJwuOSOI/gEyA87HtEHy8WmRATKtlTos9rzrDcidYSEY8ewzbOw2wyC/7B7biDMLU2sx1Chgflw6xi035DFMmt2hjwed6bm7zFQkRAtNmxxq5LTTxx+g2m48EUDL/Nkz45uzI7/CtFOfrqUzD+cO3rLvrd20/yDhkRuBjnWFFba8LPS0ccirxlVEp3cvB0Jg02Ikm3oBOYsdZRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1t8B7JvqtxBgtqAw0NwLR4XdNVHjjInxr42Sm1K8ZQ=;
 b=MwKuucxYqIaVXxv40JIlFJbAa2ZdMVJDOWpjF5QP21qnnSdt/4gRSzP9fh7qxt9mOmoJpZjDPgDRNZ0X4y4PoErr8i6fVK/nKNQNh2S8tCwXnKCdKAfUu27n1g2FXtMG53t9D3hha4FzDvjKASaC5T2zSaMDrjy+OLxDwPKKaOTUOmTrfH6c815Wbdg+I0JQm2WzxIK55K8khlrYwg9KKVv2g96agFBTR10dfLlqRAjuPiEL60HccLwLTi+mm4kAVRQzEbkKsAgPvpegL5W+tvodUs6SgLQUSBhc/cxxQAG20w9WD/KhOdW9vbsKdO1qq43l7WYPiq7A/i3acd5ChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1t8B7JvqtxBgtqAw0NwLR4XdNVHjjInxr42Sm1K8ZQ=;
 b=GNxGKP8uxtpaTSE+UL4pYRgZ4lc7QEx0beuN7wjkYIBvVwcFbwBLDDYN2SqlKI+jgBwVjNJbvdUTx5DVP/FBg3yRHBy/4T8w/bsK7C8now+iisaoj4getkqiUuu/Ufz6ghQkRBZ2tUkHEkUJOQk2PMZdfC+vBVel5uWOGBig9Ow=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, "wl@xen.org" <wl@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"jgross@suse.com" <jgross@suse.com>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH] tools/hotplug: don't install init.d scripts if SYSTEMD
Thread-Topic: [PATCH] tools/hotplug: don't install init.d scripts if SYSTEMD
Thread-Index: AQHYJR+qUOfXagHVfEujp222vc98OqyZ96IA
Date: Fri, 18 Feb 2022 23:40:43 +0000
Message-ID: <d801f210-7b01-8d20-921d-8ecc418e6fe3@citrix.com>
References: <alpine.DEB.2.22.394.2202181525440.239973@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2202181525440.239973@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aec26dcf-c287-493b-ab74-08d9f3381468
x-ms-traffictypediagnostic: SJ0PR03MB5807:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB5807611966896CCF817D5BC9BA379@SJ0PR03MB5807.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZagtdV8KdqJh7uGsOJUooxAAYhKORDzBoL11c82Q7tnfKPOfqZQYN8kNxNKJsG5WDu/RV8S41mh9EQ8opocZMCdutq026CzGsYxqIqqvL25cvVNuN8SiwIftw/sJq3mJiGixE9FT4CEU36VcrLHz/HD1Pn0w02S8i1bXEiR3RZAKRCAZwUrmr5kUP14dJnliw4277O85So3ybD84TT+3iDCijX37QcghAqFWSJ/PPOWxKo9cbEDZRF+BPYqW4As0dn5ihignXS9/yZ5XdxF8TWtaJ1R5xlbacuT4xHJ0JW48jFGC4h3Ub0P9u47tPY/4Imteer42hIJeupUtoECD8G8MJGhTTQxBqAE9mtX2J5GH5ItJ3oNUAW+xZBdZFRm8+glyHvzYDYQSnBXZhaOQk+ef5hdbSqktewWa7t+Oynn2gz+6cr9d1/dKwsWKgxoQI5bW7EmxEOl/0+SzNO5++Ba8s7OoFTkfAMiZp+GtVY8mhRxdfWZQtT70WhKL4FfgZCNTV4H8ydvdIbmXr1WA/95kLr7pvbIGeC90rzDGstHNT53wz4Wief3gtYYMiQKYe86OmN4MY6cZDHVNQE+GTuKGeU3ApKt+YvUN/d5TnlKLW53XimSUOq5cMevG+0r0ADnrGjdQqPHCk1smjY+B3nzc99N4z+jknSRJuAqK/RWsqpqQgTcyQ+du/mr6mskR8BBI6j7ab0PFq21Gi+blhtr7yG1ZrYzsaRB6qXWr5q7q5As/KsHa4AFPhJZ0DFcbTFcaVlxADOsQbTpQT1zK7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(76116006)(8676002)(91956017)(86362001)(4744005)(4326008)(66446008)(66476007)(66946007)(66556008)(31696002)(186003)(8936002)(5660300002)(26005)(122000001)(316002)(2906002)(38100700002)(82960400001)(110136005)(38070700005)(54906003)(31686004)(6512007)(53546011)(2616005)(6506007)(6486002)(508600001)(71200400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0d4d0hSc3RSYURmcVdPbHhYU2ZsK1BHOU1oRm9lSWw2bUREb0pvWGZCRXdm?=
 =?utf-8?B?Y1ZsdGduVTB6MHFXY09ESmg4V05ianJVRTNlYUdabUI1aFRhTWJrKy9mdUh6?=
 =?utf-8?B?eEpsQmdacnJVNGZTME9jVHlUa3cxU1ZVblgwR0pFNmgrY3lTeDh4R24ySHlB?=
 =?utf-8?B?SmFhZE5ybTQ3cS9wRWZaMzJBTnRweWN2TytZZ1FqM1BTRjNEOUYzblptclp1?=
 =?utf-8?B?a0pxcUsyZGx3SUMzSXQ3MUV6S0tSNDU1eTNHUTk0YzhPamhtcWh2Z0h1U3Jp?=
 =?utf-8?B?Z2g4Q0d4UGlSbktCODc0cHZQYkcrVllERnRkZkFuSDllQWNieG9POGltL3Zj?=
 =?utf-8?B?ZjhxSFpJT3V0WktpNzZ1VURVSDNJUU5TQ0lHQkhadmdNbFUvN3B0T1pVbXhP?=
 =?utf-8?B?b0trYmc1SGNQUlZ1Vkx0SEFHMnF0ZVBCcnRRa20zY3BOVTN4UkVPejNSQldW?=
 =?utf-8?B?UGh0bnBVMjhXVVY5VmJEVEtmZ3daNmwrVDNvNS9RK0tKejAxdlJBRXFEMjFs?=
 =?utf-8?B?SElMa1dpN0ozU3BkWmpPTloxYzVFUVFNYk1INDBUeHYwSDZVM05ZeCtHVm1Q?=
 =?utf-8?B?OHJ0Y0xadlNQQ1V3VVZQTXdTdk0xbU5JN3lUMDYwbTBGT01FWmVJdUNBRkk2?=
 =?utf-8?B?L0FLTmoyR3h6NHczaWxxVWZXSElNemx6bzZpa2F5Q0FCSWF5V00zc01oUm9U?=
 =?utf-8?B?WFB3VDVQbDlydHdJMlMza3hMQjUwRXMwT0l0SmVmWVB2NHBsTEQ5SldFTC9U?=
 =?utf-8?B?eFFQRFlHWFFrbGlGalZxb2U5bm1mWjlXMU1TRmlCWDFieFIyQzVISzNjUWpT?=
 =?utf-8?B?K2xqNU5FRVp3Z1V2dm5ST3lSTG55a0xyOC8vdGhaWUZJNnAyUXFJS2xBVjVR?=
 =?utf-8?B?b29KVEtYT2E4U21yVzhsMHJvYlE4b09nQUQ4TDZ4QlkzODI0aCtLYUZVa1RY?=
 =?utf-8?B?QmR2MHRJQTBaT1c1SkR1eFVuMUMxaGRVM1pNWCtKVCtnSlJJZWttTm5QUWk1?=
 =?utf-8?B?Tk1IOEpnMlVPb3gyWW9mKzRKTEpqano3NFMvaG1kT0FLVklHc2diRCtjRSth?=
 =?utf-8?B?VWFLZGFURitibXFxRGpzbjk4ZWxGT0lIazd1YU11M0FENHU0RSsvQ2lqdkpm?=
 =?utf-8?B?cFJ2WTdrRFdhWnRBK3pBTExoTDJTVDZIQVEwb2w3SUFYR0dhRVJkcDJPdlUv?=
 =?utf-8?B?N3V0YnQ0ZnJhQ1ZhSXVPaS92Rjd4Q2o3OGJjd25OVHkzc3M1clNUQ242bXBn?=
 =?utf-8?B?MGhzOGxkTUpsamhFTWNUalNIbXhobi9KQ3pXRjJvR0dJbUV2ZDVJNlhJazFt?=
 =?utf-8?B?YkYydTgvaTRYV1U2bXNjVnQ0WDFKMXdYKzBxSkQydDdHczMvRjF1eEo2VVBI?=
 =?utf-8?B?SHJVRnBhaEFNbU01TXdxeEJKWEVyY2ZKYmVJMXZoNWZYMmtWb3IrYlcwVzZi?=
 =?utf-8?B?UlNrUUx1V1ZOTXF1MnRYd1BjNzlvbTFyTW5reDgvc0Z3MHlHdC96WXhlQ0cy?=
 =?utf-8?B?ZUJvdlp5SEhyOE9HY1doNWp6TG51djdjMzNxZzVyeEZSUEhibDZPVUc5cnhZ?=
 =?utf-8?B?L0REakZNcXBMeVRkRjZycW1nOXdQWVU4ZFRoQnprZEdMai81M0FheklpcWR0?=
 =?utf-8?B?b0J0UVFka1FpRkdQdEphWEphRWpkMTJwQTVmNDhSMll5VXF4QzNSV1RDaldF?=
 =?utf-8?B?WFhOSnBVRUNsZzZkWStZbHd5TEZLeU1xTzBSR0N3eE9iYldIQVpiT1ppRlE3?=
 =?utf-8?B?SnRCdEVqakczYldEMGlPaVpsNlJ2OEM1NWxiSmdCUGJnQ0NzbzlVWSsxUTI3?=
 =?utf-8?B?SHA4NnR0bGtwR1Q3Ykx4NDNob3VmcFFKdlBkRHl4ajV1UHZhQnFibDR6ZldW?=
 =?utf-8?B?Znp4ajNVWW1YdUYwL3hnL2pKci9NRExnYmM3R1lCaG9ES0t3UDM3UkdVNW5N?=
 =?utf-8?B?UWpCc0QzbHViR3FvRDRBVC9PMGduTEdDZ2lhOXloZGVrR1NFQU96UHhLZjMw?=
 =?utf-8?B?Q1VBN2RyNWg1WVh2bXJJdFhrZWNEQmlSS25ObnJJR2lHaENRZHJZQnQvL2ZB?=
 =?utf-8?B?dDhoaG1NdWozNVJ1LytRT21tMnR1YW5KbGdORjJVdTdPajRadW5KZkdWUERn?=
 =?utf-8?B?VWlnZmZRRXBPbERvZHZkN3BLVTdUc0w5SzJobHdNSlNpcmZRRjl5aGFoUFBP?=
 =?utf-8?B?c1l4VXFkR2wvNUd5TDFGak1vZnlucUFLS1I5NHAzRXhWdzFVSnVrRHZZcFgw?=
 =?utf-8?B?QzVvSk9hQ05ERXZnUkswbnNMTlBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BF94C25C9B7EC48A244319BD56BDED2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec26dcf-c287-493b-ab74-08d9f3381468
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 23:40:43.3414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vdn5y5cOfXbUFDfJx3JrnmNhCQ6lJdwNCDHh2ufmP0jbO9hjm9edx11SSq5cQhxHsFdLz0gjELLZhi+QZ7QO8GslinkWAZpu7iT2PVHJUxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5807
X-OriginatorOrg: citrix.com

T24gMTgvMDIvMjAyMiAyMzozMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBXaGVuIFhl
biBpcyBjb25maWd1cmVkIHdpdGggLS13aXRoLXN5c3RlbWQgY3VycmVudGx5IGJvdGggdGhlIHN5
c3RlbWQNCj4gaW5pdCBzY3JpcHRzIGFzIHdlbGwgYXMgdGhlIHRyYWRpdGlvbmFsIGluaXQuZCBz
Y3JpcHRzIChlLmcuIHhlbmNvbW1vbnMpDQo+IGFyZSBpbnN0YWxsZWQuDQo+DQo+IFRoaXMgY2F1
c2VzIGlzc3VlcyB0byBkaXN0cm9zIHdoZXJlIG9sZCBzdHlsZSBpbml0IHNjcmlwdHMgYXJlIHN0
aWxsDQo+IHN1cHBvcnRlZCBldmVuIHdoZW4gc3lzdGVtZCBpcyBlbmFibGVkLCBlLmcuIFlvY3Rv
LiBUaGUgY29uc2VxdWVuY2UgaXMNCj4gdGhhdCB4ZW5jb25zb2xlZCAoYW5kIG90aGVyIGRhZW1v
bnMpIGFyZSBleGVjdXRlZCB0d2ljZSByZXN1bHRpbmcgaW4NCj4gZXJyb3JzIGF0IGJvb3QuDQo+
DQo+IElmIC0td2l0aC1zeXN0ZW1kIGRvbid0IGluc3RhbGwgeGVuY29tbW9ucyBhbmQgdGhlIG90
aGVyIHN5c3Zpbml0DQo+IHNjcmlwdHMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+DQoNCkkgYWdyZWUgd2l0aCB0
aGUgaW50ZW50LCBidXQganVzdCBiZWNhdXNlIHlvdSB3YW50IHRoZSBzeXN0ZW1kIGZpbGVzDQpk
b2Vzbid0IG1lYW4geW91IGRvbid0IHdhbnQgdGhlIHN5c3Zpbml0IGZpbGVzLsKgIChBbHNvLCBJ
J3ZlIGJlZW4gdHJ5aW5nDQp0byBwZXJzdWFkZSBBbHBpbmUgb3IgR2VudG9vIHRvIHVwc3RyZWFt
IHRoZSBPcGVuUkMgY29uZmlnIGZpbGVzIHRvbywNCndoaWNoIHdvdWxkIG1ha2UgYSAzcmQpLg0K
DQpUaGVyZSB3YW50cyB0byBiZSAtLXdpdGgtc3lzdmluaXQgKGRlZmF1bHRpbmcgdG8geSkgdG8g
Y29udHJvbGxpbmcgdGhpcywNCmF0IHdoaWNoIHBvaW50IGEgcGFja2FnZXIgY2FuIGNob3NlIGFu
eS9hbGwgaW5pdHN5c3RlbXMgd29ydGggb2YgY29uZmlnLg0KDQp+QW5kcmV3DQo=

