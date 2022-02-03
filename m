Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF00B4A818E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 10:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264562.457691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFYXp-0005rN-Fx; Thu, 03 Feb 2022 09:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264562.457691; Thu, 03 Feb 2022 09:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFYXp-0005pB-Cf; Thu, 03 Feb 2022 09:36:49 +0000
Received: by outflank-mailman (input) for mailman id 264562;
 Thu, 03 Feb 2022 09:36:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mjBt=SS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFYXn-0005om-H5
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 09:36:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cac41739-84d4-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 10:36:43 +0100 (CET)
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
X-Inumbo-ID: cac41739-84d4-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643881005;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=23t8jwQQX1AC/xtblucynRKJC3J7+0r7n4XTehgwPWk=;
  b=XmBxMwQ92IW91UXteyttbLazbA72qe71SL7HD2mHqVC9vHjP4j9g3gvP
   y4/i62BQHCS2aLMqjpL/v0MmWo/fX3TiK7nih+yPLPl2UkTXnQeLf6/To
   Lx5gESGsQbZ2XKZWlocbLltk8OTn0kX37Ml7GIhhd3DpGbn5zUR2dCaSk
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l5b5qyWC/UGO678GvSjBi5ReUhs9KgIE9zX53NTKmV3YG66HmYGuQfFmPPbuI9WTLuuJVvF1vj
 i/yQxb9ryMF9KKTtf8GHkVGokZUJnBq6OP6xyk2QpsJjqvqQIsTpJit9tkJKBUhhS1ZXIkwczV
 s7LV5wVXA7Z9g/3xsfN1dkjZJ7YbAK53t/t/lZs6DHU6tYD+jQZXtQRbblzG3o3GWwSFL+OFVY
 fa+wsEp8wTL3sPdskN4XaNlPBW76ilGJqq6SGICmg+kz3DBM3L14AbxSMj10CFcp9s6pxTx9ag
 lNSUkLv4K1AYlyF3c05ouk2L
X-SBRS: 5.2
X-MesageID: 63311779
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WZH536MjaB1NK3rvrR09kMFynXyQoLVcMsEvi/4bfWQNrUpx3zJUz
 TYZD2mHPf+Ka2X2e9x2b4rk8UpTsZWBxtAxTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500o4w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoz7Zsv1S9
 f5CjMPqFA00FIfDtfsnTTANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uRvoYBg2hh7ixINejzV
 4kpaTl9UAXnXTF3F04HEK5u28790xETdBUH8QnI9MLb+VP7zhF10bXrGMrYfJqNX8o9tl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntTz/cJIfEvu/7PECqF+c3GsIEzUNSEC25/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8pmOfFAsoBmA7OnVZRxYvydbOv7stp0eaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9HwsTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF8r1xBGFb5JOi8BQ2Swm8zaa7onheyO
 CfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlPcrHozOxPBhD+2+KTJrU3ZE
 c3AGSpLJS1CYZmLMRLsH7tNuVPV7nxWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cA5WRVBmW8Geg5EHJ4arf1s9cEl8WqC5/F/UU9E/90ijvr2Wr
 ijVt44x4AeXuEAr3i3ROy06NeOyAc0ixZ/5VAR1VWuVN7EYSd/HxI8UdoctfKlh8+pmzPVuS
 OICddnGCfNKIgkrMRxENPERdaRuK0amgxygJS2gbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK3d99WpHuJyE1B0BW7e6brqZyDW8nD6md1LUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozvoK9qaVbwwJoGGTwQ26qUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SJ6oOiHXEFVM0XegSBRNuIoYoYsw
 ONns88K8Q2vzBEtN4/e3CxT8m2NKF0GUrkm6c5GUNO61FJzxwEQe4HYBw/3/IqLOodFPUQdK
 zOJgLbP2uZHzU3YfntvTXXA0IKxX3jVVMymGLPaG2m0pw==
IronPort-HdrOrdr: A9a23:mRlzRaxQHnWZXXUxSB6TKrPxyOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WBxB8bZYOCCggqVxe5ZnO7fKlHbaknDH6tmpN
 tdmstFeazN5DpB/L7HCWCDer5KqrT3k9HLuQ6d9QYXcegDUdAf0+4TMHfjLqQZfnggOXJvf6
 Dsmfav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,339,1635220800"; 
   d="scan'208";a="63311779"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLeZYa6fQhtEZiiiS9PHjS+TNPSyrHDXJdCWtm/GvA5ZPbGDRzDAq5IuT1/6PhbH9syUeauXmyx9svb2ziZgirNeRJbp9EniYTK2dK2BO8hQNvsMhZa7dUN35OJ+5cWciR6wTPzpu+XwcrDNq1gpj2SjjMBoDAhgzio7RuTo6pgeEgd/2UoKhc478iGS7uCEezGvhkD/nhuRglxDYUh15y5rZqOhrwsfzQ37vtnHKE9FGmtshwOremj7BThXSg9OyIAxYCmbPD8bP0gc8Q8KkDF5Br71ctqTrDS41ceMhvV5nE1nqg5/nNTCnxGn1BMxfcLhcYmnG8disCH1YqP0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJJE/ITSJDKPmZHIXrBeGC0SyS/eYpEwZlP5PQ9vkRE=;
 b=V9laSaGxriuNp8HPi3YX1j8fkiUKdmFbSbHhL15fce2Gfz/kvKcsisjA2YaG/7rio8E+on6cNAarqCqfmkWkjWBP2DLKKWfQAV0whfesg5Uljww3SLRNU8WJh7scWYgJ6hHdwXQUdQe9qBzPiXGUfkMzSWnv6h/CqK8mWFAzdkybFJzXT34dLSW6IgqQ53uy6nW40f2iFo4elXBQ7jRg1P9RvVofsDsu2E80Cyqu0fqW8v/4KdKSJpWHzx8A+x1HOjmknLhrHhiv7Q4RTDI6Ev2P18n1EHBOyi0hyZ5RUt5YVDwY2bgUuPEf+wLmTC0cgQh2pbZNhXqH1LvncM/8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJJE/ITSJDKPmZHIXrBeGC0SyS/eYpEwZlP5PQ9vkRE=;
 b=OLJ5DKJo7qBXMWtXWfJz9XEPvWaORME/1Xl2Jys6rXpEHmGDMbv3Hi2cdCwY9jSx/b2y+S9TWiQthkIbPbLcfl4rhAlRxoLFwqyAY/kmElhrW9me0m/WHDnTd6LAIG7XdTrq77MQQ30z1Z7PLOKkCmRH+mgJ4xhSZ+dU0ytmMxk=
Date: Thu, 3 Feb 2022 10:36:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs: document patch rules
Message-ID: <YfuiFCrF1VJsX5gU@Air-de-Roger>
References: <20220202114448.8608-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220202114448.8608-1-jgross@suse.com>
X-ClientProxiedBy: LO2P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9b33f32-9e67-490d-c149-08d9e6f8a56e
X-MS-TrafficTypeDiagnostic: BL1PR03MB6184:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB61847EB8F79E6E601C5512008F289@BL1PR03MB6184.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H37cchXQ6gM626JB8mSOITM8j8PPoXmF64ibZOkqsGUsicLpRjTr3MV8oFEJHwCLRI/0hmSLgo22wvovXct+lQH4bEsDyyzgFWUDYZ87WtP8Qz3Tlgogsdj3X5kVCu9TD7yE+bjpQGFY4ZBTtR6jJCPLyc/To/jep3qAmqz78ztP6MkYufeLj1S72c1XcicKHbIKSXxQTolK0HD7Wbi89Oz9K4QAZyw9MYwFdSId1d2Pdti57KBDDxPzLDKhY4cPlzMXtRUziU0YTU01HTw37mIctvD9U7q2iArI+tohByF8dAp8V25iZwt0ydz4or68L3Yca/j/6vMKceky23rnwN8ePmjnqYwLiQYMV/IE6ZO+gzAXQJCYfDFBRaH6/AAR2wZist4TsHfyAv0cNocrizms/SzdSml9J3Y6/SToBtROZC9SyAM4Z/cnVpFLc/kaeHbvvaUvEQ4Ia9J+f2LmgJO9D2lEsKlVHRQ4j8Kp/4Xbu6ZxhlNf0t3BuqcoWOJFiBDML57CNND2BCnGXGzhuI68jCsHtkBB1qM/6XLcZ//1O6x367rzPdVOjXkNYBpwZ/UA2KUvtgkG0W6uum4pVBQwmhemNb38Es9WYyQIboO25b4Ietis6Oyq6H47tSZsqodzVBlQIA1EDh88C/e3SMbqj+13jJ2hcpzbJUOCH5XFT4ZrsHwZKCTkhfZXdRoG2/8DEUXSZW4poeY4oE/QUqKNfCg/K8qrcRBzFv331+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(85182001)(33716001)(38100700002)(83380400001)(6666004)(9686003)(26005)(186003)(6506007)(6486002)(6512007)(5660300002)(2906002)(82960400001)(66556008)(66476007)(4326008)(66946007)(8676002)(8936002)(30864003)(86362001)(316002)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm9HUTNQVy8xWWxTSzRDRjN6TGY5c1BpWXJKTitZNVRlRk0rUzErbk1wQWlX?=
 =?utf-8?B?UDZmU1hGbU45QjlJc2JycW9GWng5WGdhWktza0RSM0JDY2YwRWVYUHhsL3ha?=
 =?utf-8?B?ZDNsOVVmdVhxaTJVL1lmMXhtcU1EMEZmZFdObjVHTGxzaTBVWVY5d1VwZmg3?=
 =?utf-8?B?ckNmZldYbVA0RVJqMTc0WWlRMTZYbzBmenRGQmNoRHplZEtkcldxaTFFSHlm?=
 =?utf-8?B?YURLRTlpOXM1WXRJRnNLUGpDbk4xUVZqZ1pTRzlPeWljQkloYVNxNTlmRmtI?=
 =?utf-8?B?cDFIb2RNNzQ2OXNPVE5IRzN6M3hHeDdBZVZxZzBtandRaTZVb0M1Wk5oeHlK?=
 =?utf-8?B?dkxrazk1NXdSdlhiVXJDcWpTWEkrYkFldFI3VDdsRUdmMUlCak5IRlUxVGtz?=
 =?utf-8?B?bU80OFhMTWozYklCNldkdTFQbitjUER3NUVwUkIvZmE3cExvcndON2hRREsr?=
 =?utf-8?B?eEFoSFhld3RwQlJzSk1iSDBUeUxJTFRVV2lnVXpIdUhlY2dLVGFzRk14ZDdy?=
 =?utf-8?B?Q0o2bFB4eFNlcGhKd1hwbTB6RkVhUUh4ZGRDV0hVaEFCZWRMVlNiWTVBM2ZE?=
 =?utf-8?B?YkpaZEk0clpaMm1TRUUzNSttTmM1ZDVxTFVXT1o4VUdOdDE1d3IzUjExQktC?=
 =?utf-8?B?WHNQaVNNeXlBcEVwckJOMlErbExCaFF3NDErbC9BUWxSTE5YV04zZ2xTWUg4?=
 =?utf-8?B?dUEvZzBJQzJRQkhyeXZocjdGTjhuQkh0d1owT3FmQXlQbVJaZWg1RGFkZFR3?=
 =?utf-8?B?UFBweFVKYzYvdHZIMXNWWm9hSWFLeDc1SGNpZW8wRllGSmhCMVRHeG5jU0Js?=
 =?utf-8?B?RkQrb25HUUxrMDM0VmVXUkdEaXZXSk1YbXV1SkJDd2RnYU9XZTlSQW9oOGls?=
 =?utf-8?B?cE01ZjNrUW8vZ0FvQjhkTWV2bll1MHhOSkt1RURwMG92Wm5ha3hVVVp5TVZj?=
 =?utf-8?B?V3Zod3V6NzFQQWt4bllWUjEzZ0R6YXR3VDRRa3lYZ3BEYTF0VDZ1dzA1VkN2?=
 =?utf-8?B?RWNVSWZaSytWbmV4dnU5Rlk0V2NjT1V6eWVoLzhsSXNzbmFNS25ITEdLUUR2?=
 =?utf-8?B?M3p5aFZTV1kwZkJ2WFdFd3V0ajR3VEdpMTlPdnlqSE41aUNEdzl6aGY3dGZx?=
 =?utf-8?B?eWIyNUtCSmpDZDYybERZWGYyQ3NBcExHZkN5bjVRSFVjSUZ0ZFN6SzNQOUxW?=
 =?utf-8?B?dU1McnFHcU82MjlGNmtJeGYwNGF6TFpxd2xFK3B2aW4zRUZ4cTVMeGdZMkVp?=
 =?utf-8?B?TGpWMy9GbFlBTXhEOVFYTG44azFGL0VWbFJUR3FBZ1gvdm5vNitrY1hiVS9l?=
 =?utf-8?B?d2V0eXlOZ0MyUVpVY2tWeTJ0QzR5VTgwcTJvTFN6WUUvSTJJbkwvMVpJdklB?=
 =?utf-8?B?VEVQNUY0Vkg2QlFiQVpDY0RPLzNmaFZaTFl1N0JFTXRpRUo5dkc1YWUvd2lz?=
 =?utf-8?B?a1FTbTZ6aVJJS2VlZUxwZzZYT2hFK0tKbEpHcnlicVI0MUo5R2xhWVZ4UXUz?=
 =?utf-8?B?UzRZczFHV3BUVUROWjJKOVhpalVWWFl0SE53UlNsakRQMXQxWXZyY0hZSTV4?=
 =?utf-8?B?NU5DNTBaWDhGSWkrN2NBYUFrb1JHUHZpUnJHdjdjN0V3ckxZN3NyaGZvSzFq?=
 =?utf-8?B?dlZLcGwvU0orZ0k1VlFlS2VZU1hFWEIvYjRBQ1pzSk1jMzRzdFpjdE4zU2Er?=
 =?utf-8?B?RTQ3UjRRWFpjRFFOM2Y4MTBTSXpZYmhDdDRWUHpSaWhtS0FLYk5xRFJpczdS?=
 =?utf-8?B?RitrOU9rYnpCQisxVE5mYjdOQ2NpUXh3Y1pFb2dQejZQMFRzSGhWTVR3Q3lO?=
 =?utf-8?B?L1BQRVg2UmtYRWw2L244bFB4Tmdybm5LcDl3VFNwYjljS2dscSsvSG81Smp6?=
 =?utf-8?B?NGoxU090bnRwc0NOYURpbHp2c2V2MEVUUXRRQ1NVQWpvSkxYYzRqbEZKL1d5?=
 =?utf-8?B?RTlXWXpweEExRnJqMjA0VHVMTXhiTm9nTVI4a2orQlU2aWdPdTJLRDRiK05l?=
 =?utf-8?B?Tm1nNERRSGovWHdueUhMbE1QYXJMU3JxZTBEMGlSUEZTS1R6QWw2azhuRHhx?=
 =?utf-8?B?ajVsL0xpQmMxRk1RQ1AvT1V5STZkYnplU1FIS2I1K2c3U2JabTEvNmlneXBJ?=
 =?utf-8?B?b3FzcXhnSUd1TUZpUi9rVWd2REpFNDVaNzUvby9sUUhPUGRYc1NGWWJqMzhi?=
 =?utf-8?Q?94RI06GW6Xua8hzcBCKtiys=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b33f32-9e67-490d-c149-08d9e6f8a56e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:36:25.3599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpPZMt7KGGYnBfu5cCo17+qqURxkUgvwPBmShTKYacXrVFq3jTL6GKngI3wY1YqcSIOa1EqCliF06xJm2IQybA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6184
X-OriginatorOrg: citrix.com

On Wed, Feb 02, 2022 at 12:44:48PM +0100, Juergen Gross wrote:
> Add a document to describe the rules for sending a proper patch.
> 
> As it contains all the information already being present in
> docs/process/tags.pandoc remove that file.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  docs/process/sending-patches.pandoc | 284 ++++++++++++++++++++++++++++
>  docs/process/tags.pandoc            |  55 ------
>  2 files changed, 284 insertions(+), 55 deletions(-)
>  create mode 100644 docs/process/sending-patches.pandoc
>  delete mode 100644 docs/process/tags.pandoc
> 
> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
> new file mode 100644
> index 0000000000..4cfc6e1a5b
> --- /dev/null
> +++ b/docs/process/sending-patches.pandoc
> @@ -0,0 +1,284 @@
> +# How a proper patch should look like
> +
> +This is a brief description how a proper patch for the Xen project should
> +look like. Examples and tooling tips are not part of this document, those
> +can be found in the
> +[Xen Wiki](https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches).
> +
> +## The patch subject
> +
> +The first line at the top of the patch should contain a short description of
> +what the patch does, and hints as to what code it touches. This line is used
> +as the **Subject** line of the mail when sending the patch.
> +
> +The hint which code is touched us usually in form of a relative path inside
> +the Xen git repository, where obvious directories can be omitted or replaced
> +by abbreviations, or it can be a single word describing the topic:
> +
> +    <path>: <description>

I would use <component> maybe instead of path, to explicitly note this
is not usually a real path inside the repo.

> +
> +E.g.:
> +
> +    xen/arm: increase memory banks number define value
> +    tools/libs/evtchn: Deduplicate xenevtchn_fd()

Mostly a nit, but since this document is about style: I wouldn't
recommend using a capital letter after ':' by default. The above line
should instead be:

    tools/libs/evtchn: deduplicate xenevtchn_fd()

> +    MAINTAINERS: update my email address
> +    build: correct usage comments in Kbuild.include
> +
> +The description should give a rough hint *what* is done in the patch.
> +
> +The subject line should in general not exceed 80 characters. It must be
> +followed by a blank line.
> +
> +## The commit message
> +
> +The commit message is free text describing *why* the patch is done and
> +*how* the goal of the patch is achieved. A good commit message will describe
> +the current situation, the desired goal, and the way this goal is being
> +achieved. Parts of that can be omitted in obvious cases.
> +
> +In case additional changes are done in the patch (like e.g. cleanups), those
> +should be mentioned.
> +
> +When referencing other patches (e.g. `patch xy introduced a bug ...`) those
> +patches should be referenced via their commit id (at least 12 digits) and the
> +patch subject:
> +
> +    Commit 67d01cdb5518 ("x86: infrastructure to allow converting certain
> +    indirect calls to direct ones") introduced a bug ...
> +
> +The following ``git config`` settings can be used to add a pretty format for
> +outputting the above style in the ``git log`` or ``git show`` commands:
> +
> +        [core]
> +                abbrev = 12
> +        [pretty]
> +                fixes = Fixes: %h (\"%s\")
> +
> +Lines in the commit message should not exceed 75 characters, except when
> +copying error output directly into the commit message.
> +
> +## Tags
> +
> +Tags are entries in the form
> +
> +    Tag: something
> +
> +In general tags are added in chronological order. So a `Reviewed-by:` tag
> +should be added **after** the `Signed-off-by:` tag, as the review happened
> +after the patch was written.
> +
> +Do not split a tag across multiple lines, tags are exempt from the
> +"wrap at 75 columns" rule in order to simplify parsing scripts.
> +
> +### Taken-from:
> +
> +Xen has inherited some source files from other open source projects. In case
> +a patch modifying such an inherited file is taken from that project (maybe in
> +modified form), the `Taken-from:` tag specifies the source of the patch:
> +
> +    Taken-from: <repository-URL> <commit-id>
> +
> +E.g.:
> +
> +    Taken-from: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f093b08c47b3
> +
> +All tags **above** the `Taken-from:` tag are from the original patch (which
> +should all be kept), while tags **after** `Taken-from:` are related to the
> +normal Xen patch process as described here.
> +
> +### Fixes:
> +
> +If your patch fixes a bug in a specific commit, e.g. you found an issue using
> +``git bisect``, please use the `Fixes:` tag with the first 12 characters of
> +the commit id, and the one line summary.
> +
> +    Fixes: <commit-id> ("<patch-subject>")
> +
> +E.g.:
> +
> +    Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
> +
> +### Backport:
> +
> +A backport tag is an optional tag in the commit message to request a
> +given commit to be backported to the released trees:
> +
> +    Backport: <version> [# <comment>]

So we already had a documented usage of '#' in tags, which I think
should make it a better candidate for the R-b scope limiting.

> +
> +E.g.:
> +
> +    Backport: 4.9+
> +
> +It marks a commit for being a candidate for backports to all released
> +trees from 4.9 onward.
> +
> +The backport requester is expected to specify which currently supported
> +releases need the backport; but encouraged to specify a release as far
> +back as possible which applies. If the requester doesn't know the oldest
> +affected tree, they are encouraged to append a comment like the
> +following:
> +
> +    Backport: 4.9+ # maybe older
> +
> +Maintainers request the Backport tag to be added on commit. Contributors
> +are welcome to mark their patches with the Backport tag when they deem
> +appropriate. Maintainers will request for it to be removed when that is
> +not the case.
> +
> +Please note that the Backport tag is a **request** for backport, which
> +will still need to be evaluated by the maintainers. Maintainers might
> +ask the requester to help with the backporting work if it is not
> +trivial.
> +
> +### Reported-by:
> +
> +This optional tag can be used to give credit to someone reporting an issue.
> +It is in the format:
> +
> +    Reported-by: name <email@domain>
> +
> +E.g.:
> +
> +    Reported-by: Jane Doe <jane.doe@example.org>
> +
> +As the email address will be made public via git, the reporter of an issue
> +should be asked whether he/she is fine with being mentioned in the patch.
> +
> +### Suggested-by:
> +
> +This optional tag can be used to give credit to someone having suggested the
> +solution the patch is implementing. It is in the format:
> +
> +    Suggested-by: name <email@domain>
> +
> +E.g.:
> +
> +    Suggested-by: Jane Doe <jane.doe@example.org>
> +
> +As the email address will be made public via git, the reporter of an issue
> +should be asked whether he/she is fine with being mentioned in the patch.
> +
> +### Signed-off-by:
> +
> +This mandatory tag specifies the author(s) of a patch (for each author a
> +separate `Signed-off-by:` tag is needed). It is in the format:
> +
> +    Signed-off-by: name <email@domain>
> +
> +E.g.:
> +
> +    Signed-off-by: Jane Doe <jane.doe@example.org>
> +
> +The author must be a natural person (not a team or just a company) and the
> +`Signed-off-by:` tag must include the real name of the author (no pseudonym).
> +
> +By signing the patch with her/his name the author explicitly confirms to have
> +made the contribution conforming to the `Developer's Certificate of Origin`:
> +
> +    Developer's Certificate of Origin 1.1
> +    
> +    By making a contribution to this project, I certify that:
> +    
> +    (a) The contribution was created in whole or in part by me and I
> +        have the right to submit it under the open source license
> +        indicated in the file; or
> +    
> +    (b) The contribution is based upon previous work that, to the best
> +        of my knowledge, is covered under an appropriate open source
> +        license and I have the right under that license to submit that
> +        work with modifications, whether created in whole or in part
> +        by me, under the same open source license (unless I am
> +        permitted to submit under a different license), as indicated
> +        in the file; or
> +    
> +    (c) The contribution was provided directly to me by some other
> +        person who certified (a), (b) or (c) and I have not modified
> +        it.
> +    
> +    (d) I understand and agree that this project and the contribution
> +        are public and that a record of the contribution (including all
> +        personal information I submit with it, including my sign-off) is
> +        maintained indefinitely and may be redistributed consistent with
> +        this project or the open source license(s) involved.
> +
> +### Reviewed-by:
> +
> +A `Reviewed-by:` tag can only be given by a reviewer of the patch. With
> +responding to a sent patch adding the `Reviewed-by:` tag the reviewer
> +(which can be anybody) confirms to have looked thoroughly at the patch and
> +didn't find any issue (being it technical, legal or formal ones). If the
> +review is covering only some parts of the patch, those parts can optionally
> +be specified (multiple areas can be covered with multiple `Reviewed-by:`
> +tags). It is in the format:
> +
> +    Reviewed-by: name <email@domain> [# area]
> +
> +E.g.:
> +
> +    Reviewed-by: Jane Doe <jane.doe@example.org>
> +    Reviewed-by: Jane Doe <jane.doe@example.org> # xen/x86

I think you should mention in the commit message that we are also
adding the R-b scope limiting in this commit? The commit message makes
it look like this is mostly moving the existing Tags into a new
document.

> +
> +In case a patch is being resent an already given `Reviewed-by:` tag can and
> +should be included, if the patch didn't change the portions of the patch
> +covered by the tag, or if the reviewer already made clear it would be fine
> +to make specific changes and no *other* changes have been made.
> +
> +### Acked-by:
> +
> +Similar to `Reviewed-by:` the `Acked-by:` tag is given by someone having looked
> +at the patch. The `Acked-by:` tag can only be given by a **maintainer** of the
> +modified code, and it only covers the code the maintainer is responsible for.
> +For this reason there is no optional area possible. With the `Acked-by:` tag
> +the maintainer states, that he/she is fine with the changes in principle, but
> +didn't do a thorough review. The format is:
> +
> +    Acked-by: name <email@domain>
> +
> +E.g.:
> +
> +    Acked-by: Jane Doe <jane.doe@example.org>
> +
> +Including the `Acked-by:` tag in a patch is done under the same rules as for
> +the `Reviewed-by:` tag, with the implied code area the maintainer who gave the
> +`Acked-by:` tag is responsible for.
> +
> +### Tested-by:
> +
> +The `Tested-by:` tag is another tag given by someone else. The one giving it
> +confirms to have tested the patch without finding any functional issues. The
> +format is:
> +
> +    Tested-by: name <email@domain> 

Trailing white space.

> +
> +E.g.:
> +
> +    Tested-by: Jane Doe <jane.doe@example.org>
> +
> +Including the `Tested-by:` tag in a patch is done under the same rules as for
> +the `Reviewed-by:` tag, now limited to the patch not having been modified
> +regarding code logic (having changed only coding style, comments, or message
> +texts is fine).
> +
> +## Patch version history (change log), further comments
> +
> +When sending revised versions of a patch it is good practice to include a
> +change log after a line containing only `---` (this line will result in the
> +following text not being included in the commit message). This change log
> +will help reviewers to spot which parts of the patch have changed. Attributing
> +changes due to reviewer comments will help the reviewer even more, e.g.:
> +
> +    ---
> +    Changes in V2:

I would use v2 (lowercase 'v'), because that's how git format-patch
places the version in the subject line.

> +    - changed function foo() as requested by Jane Doe
> +    - code style fixed
> +
> +In some cases it might be desirable to add some more information for readers
> +of the patch, like potential enhancements, other possible solutions, etc.,
> +which should not be part of the commit message. This information can be
> +added after the `---` line, too.
> +
> +## Recipients of the patch
> +
> +A patch should always be sent **to** the xen-devel mailing list <xen-devel@lists.xenproject.org> and all maintainers of all touched code areas should get a

Missing newline.

Thanks, Roger.

