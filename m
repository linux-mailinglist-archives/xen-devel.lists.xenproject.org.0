Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B2E4C5517
	for <lists+xen-devel@lfdr.de>; Sat, 26 Feb 2022 11:11:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279735.477539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNu2e-0005cD-F7; Sat, 26 Feb 2022 10:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279735.477539; Sat, 26 Feb 2022 10:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNu2e-0005Zb-Bw; Sat, 26 Feb 2022 10:11:08 +0000
Received: by outflank-mailman (input) for mailman id 279735;
 Sat, 26 Feb 2022 10:11:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5OK=TJ=citrix.com=prvs=049eb39b2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNu2c-0005ZU-Rj
 for xen-devel@lists.xenproject.org; Sat, 26 Feb 2022 10:11:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 677716ef-96ec-11ec-8eb9-a37418f5ba1a;
 Sat, 26 Feb 2022 11:11:05 +0100 (CET)
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
X-Inumbo-ID: 677716ef-96ec-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645870265;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4g/a6ZyggbsjwJL1akrPwZf2umvPUlvePw6p8Yh0cHM=;
  b=YdapEDaYrrIWLitD4N0HcgIhnqwUJACGHvGOKp3kGOcu33+bN/C5O1CT
   mYCy0gXB2wS1Cohvjub5Egm0LmuNzXJ2EFnW+Je/y/Zb/9oqQFyxhsDWm
   P9NlzwVNDT4jfxGfyQdNaCCiDdtBDNGPhxD7KU4pgpdgaKLT2REaUm9Jf
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65044976
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p/uT+awpKIAmRAIOk416t+cTxirEfRIJ4+MujC+fZmUNrF6WrkUPx
 zQfXWzXMvuJYWumeI8jPITl801T7ZGAm9FlTwA4/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYy24bhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npln66qRkApZ7L1nMsPYSdCTQIiFu520eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J0WQaqPO
 JRxhTxHMxrKbSN+MwcuLJM33/2wq2PBXiZ+twfAzUYwyzeKl1EguFT3C/LXcNGXQcRenm6Du
 3nLuW/+B3kyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYDUKVVqg5/iizEfmX8lYL
 WQb/yMvqe4580nDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyyyrHGdDTmdeUdgJpv0IX2IJi
 nTKr/q8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBj3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEgjpU
 JsswZH2AAUy4Xelzn3lrAIlRuzB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGP5FwNvcMOZCPyNcebhr5d7exwnMAM8vy/C5jpgidmOMAtJGdrAgk0DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBgXcGm85EML7XbSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74lxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:7584tKAxL983dlflHehAsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dC/DDEytHRuQ639QYTcegAUdAH0+4WMHf+LqUgLzM2eabRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJunfwivZv3Evoz6hNO6Ws19
 60Q5iAq4s+PfP+TZgNc9vpEvHHfFAkf3r3QRCvyBLcZeQ6B04=
X-IronPort-AV: E=Sophos;i="5.90,139,1643691600"; 
   d="scan'208";a="65044976"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt1DMACTBmW2ynu/LbTzWh6HZf+QxPKEqkm50ukBMw4HtLooA1owFczweJWxSlh36fwycIc4aNdttJ3XsDyfbo41IJzpel6Zk9djPjzvzZ1wKsx13sJVJdwqc0e8DeIvaMHB51+rnGIrEbD1Waot1aOZvOoQnTasa90DXzrTd8l3T0q/VwS3p/CNJjL6Dk2wuf6fjbhY8VVsNxvnTyo8xfaZdaz6tFlGaaio4dPiE0S1dOxQh0A03Z9peCV+do2OwkHz0f45OTr+Z3SD6b8+PPOI1YF9wE8UAW/7Puq9VpEGXoKJipCGSVpYD75hIqmVMkrr9v0fNjUmZlhN3qWkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sfGT9aN9+pb2i5D8lPbDuH8UbgfNsQRBEc0pbhJY8c=;
 b=b+BdRelRZ7/3ZzW6vgq+ms2oZ7/4g2NRonXOzpsctnqworgH+J5h30lKoJM1EDNWm+gF+bz/p+Ki52dcitoL4FqBACS5+ZJwzVT5X3v9DeRxFIY9QVs867SMTlK69TqFx2vy7v+yKRa128Ax5VaBKtVnzLZWp1mA4z3C38SKu2Nf+Ardv757y2Upc6NqMw8vlZMaXtA39CLml+qcNXXRwu/dWNS6ID5BKESoxRijfeajWKm/jfvjpcnom2XzWSN3n/cuVLcs8drdIO5JyAcnK532giZ0mTIBKtkkMgOjMnBTHmrZW7kFJli7rusA4QfX0wIJpLweSi2TBSrzizUMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sfGT9aN9+pb2i5D8lPbDuH8UbgfNsQRBEc0pbhJY8c=;
 b=pa3XxBuB+6UKuUEx1Psj3ibDK7XbVPeYCHgOJm/Y1FGvcZ7jj9TdoyNqjtiTotQuwMtMaD7SqD1Qcg2b6/01MtPN9DfcduqGGSqdqvQg0bUmOpZHI22lqOE0lewvnT+5whRS0IZMif1F7BehlJwzySyO6k/cBV3BMHs2dLPIx00=
Date: Sat, 26 Feb 2022 11:10:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alex Olson <this.is.a0lson@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/2] vpci/msix: fix PBA accesses
Message-ID: <Yhn8rzRIC/TNiPv2@Air-de-Roger>
References: <20220225153956.1078-1-roger.pau@citrix.com>
 <20220225153956.1078-3-roger.pau@citrix.com>
 <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
X-ClientProxiedBy: LO4P265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b49d248b-70ce-41c0-9152-08d9f910497b
X-MS-TrafficTypeDiagnostic: MWHPR03MB2925:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2925B01BD50D288236AD37868F3F9@MWHPR03MB2925.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VoTzfeUlQbzRTha4iTMGo15XcSR/pMKg0L17mPkGfptrzWZOlXYZeTMaDylt7tj0vR+40chd6PWtAry5TTdYNX6IgmM5w/Y8jRmao5BnyQBcJZKFyv+NPGOnLCnE7IEbovhhuWDXtybCXALhNlFAonY5peI5VNoH7RajJbrDiLi7z0P3s+alR4gC/te2lplNRowPiSb+mDWGcISNyUOer9DHu8qFvJwusRJ8F617coOIMKluGYvvcAATXeoSRm4m1DPsBPVvI0dOWybIQy9ss4lG0JVC32NhLbSFP8dkmPtpviJ+lndTUf/DJ2umpAYf+A1nLHp1ik+qBLicZIyrStUX8Up8jEz8kDg1JtUFXKDnZncCDJfXFmNFFoUGYbmA7fqqpGnip5f9RXroMZM+oUaLvZGNsP4pm+G8p7dosUd2BxQ7XAJzYjhkVVPCuAVzoC+Y6+zYg2VpKaKuqXJI7xvAYeowIJT6ZG7HerGJP8a+BEEu9WHlhZjhrwxQ93Eqm98vKnXbakY5uMGCuExtJyRAPoQ/W6MyZcfQzh7T7QJ0XbUxKTQNK92UrkNc537462fC553MV8j5z2MOyreORrOZ8H/bz2EBok1yRj4ZVewp7lvDYnT9W25jyL/6JAMByuwGQOMiGatuoxjT34EBUf5pKWmWh3+6cJiZ5ktFsJRPLYxlC/zbEDBFdhDQXJvRYNM21muq9Infi5mro6UuvyRyxyFpgcBBXekzR6dnFzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6666004)(86362001)(83380400001)(4326008)(6506007)(85182001)(8936002)(33716001)(5660300002)(316002)(66556008)(66476007)(508600001)(8676002)(6486002)(66946007)(966005)(186003)(6512007)(9686003)(2906002)(26005)(38100700002)(6916009)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVhGZm4rYnk3MTlCeEFINi9melh2QTR1VXlKbWtxaGtFTCsxdmRQWXdrR0tE?=
 =?utf-8?B?TWdvbGl1V3plZVdOWkV2ZngrZXlXK3BEOXdCYXRiZWZueTIxM1dhNDQ4WVhq?=
 =?utf-8?B?TDZ0d3d4MjRVbEVXaXVhMzh5N1oxNEZjR0NpNnFKQ1RKaFYyRDdwRTluSXNt?=
 =?utf-8?B?S01qM1BTaWFqZ2JmS3JZMHY0cXQxSFZiS0hLekJCMkJ6dHpJcDlCaEpXUXlQ?=
 =?utf-8?B?T0sxZzNvV3ZveTlsYmxqWFFSTDlLQkdsWWF5Ti9NUTBoNk1hWEhaV1hadVox?=
 =?utf-8?B?MWx5b1lLTUZZOGZTV1V3SUdQSG1UaWw3Sm80V3Z6dDFTQWVIRnZMTkNhTkhy?=
 =?utf-8?B?VTQ2NW1POUYxUk9MTStiQm4rRFlQWFVoNXA3WVd3SFQ0a2RjSEphU0t5M1lZ?=
 =?utf-8?B?RklSM0N3WXV4NFlpN0lsNi9CYjFFK0tQbDRScnJlNFhzcjhKY050YUh5M3da?=
 =?utf-8?B?QUM0aDVkWVhGUm9BdXdUaXMvak5iYTAwQjVFNWFabUJNVDVxZmNNSS9OQXBQ?=
 =?utf-8?B?QzVYL2NOZW5oRWE4OElncFY4bTNyYy9FRjdra3liTXpHMzFwS290VGVQam5m?=
 =?utf-8?B?TlNDbmpIMGU3K1hsMGdGSWM0NXUveklMWkpsVWU5WDJ2ZWV0b1pVbHZqT3Jy?=
 =?utf-8?B?SVl2eVF2U0YyVHNoNDBmWUxkZ2FNbk5wWWNDNjV3VCtqMlhwU0M3c05WaHFt?=
 =?utf-8?B?RnZNaFgrU2FyNHpTQ3dENllqR3BHTktnSjhQWlN1ejRxM2E2UXVYMjFNZ1pQ?=
 =?utf-8?B?V2ZDaHhyWUZjQmh4MUh1RUlPTlFQOWNkMDFEUjhnZnVWWk9lK2pBYUV6dERV?=
 =?utf-8?B?Ky9hb1RpS0puTVF0aWtZaE8vMWZlWllBWGV0RUsrQTg5QVJSR0xIVTJmbERW?=
 =?utf-8?B?blFLbW56YXNGcGlyRnVkTnBmRkIvMGJFaEJic05HM0pERVJCOGdLVWIrMEYw?=
 =?utf-8?B?WDkrMDVBM2krNHo2N2dNWENYS1dBTGdscEVFQllyOHZHQ0pQbk50QnhMbVFI?=
 =?utf-8?B?SGpyU0FuY1lYMnQ3UzVMNm5iSCtvL09LZnZvMWpoK2JmeXk3SlEzZGsvQi9w?=
 =?utf-8?B?NkxKMWJZVUtWREJoVHcycFA1eGtBTzQ1VHdXWFRmZFNMdlhCM1pBS0svYkda?=
 =?utf-8?B?TFhUSTJsNUVPRnBXSU5FbnpaVVlEb0tUekJ2S1dHeWlUNWZTTjdCRUZUN1J6?=
 =?utf-8?B?dzRZTXVRTk4zVmM2MmNyUnNBTU1zaVJRTGUrWTBmbnh3MXZBOU1TNDRzTnlT?=
 =?utf-8?B?aXVPRGFGZWNFY0w1bkliMFEyYlNZOEZRWHJwSUJaMW02S1IrM001OFpQOTlk?=
 =?utf-8?B?WWRCbk9yb05uYlpZcVMxUXQrUFhlb3RJNUErbjl2ejAzbThmenJoMCtGZjlC?=
 =?utf-8?B?Mmh2MmZIZmFxa29MV3dNdU40TGN3OStUdTZhd2JVRkpHZW0wanhFUEpzOGV2?=
 =?utf-8?B?dUVpZExLSzhCMkcrOGN5NDA0Ri95V21xeXpEYVppMjNiRG5hVkcvSlVWNDNx?=
 =?utf-8?B?ZG0yRWE0UjIzekE0MCtCVThKNGNnVkxVZmFJTExaVGEvKzVabTl4NGJWWDF3?=
 =?utf-8?B?WDdYOTZjK1BnbzdSU1ltVUN1VWhjaXZPaEdxZ0NnRk9ZdVVIblFnZ2RQZ3Bn?=
 =?utf-8?B?Szh6MEhJeHprbVdGYnZLY0RNVklDR2JMb3hZRm9Wb1pXUGFRbWJ2MFYxeFY5?=
 =?utf-8?B?VEpDdThFVlhQWDRhOGU4cG51eXVZVzdIeFJOa0dNbEEyeTFtNm5HWVI0S2JK?=
 =?utf-8?B?U1N0TzU1MUxwRlc1RHNsdklSTE1MZnRoMHlhWVhuMUtMRTlXTnBRelFCbDlD?=
 =?utf-8?B?UXJVdmhjWVBFSHhEZ2tpc1NkM2w4WjVxUkJHR0VLMHdVMHRuaFplUlBQb0s4?=
 =?utf-8?B?N3I5emdNREFmSnhJUUZkUHRqT2lXa0QyckM0aWlSTzlBdmZZbklsM05ua0ds?=
 =?utf-8?B?Q05XUjFYOFJ4YVcrYWxHZ2ZaTk5yQ1JCalExUktvY3JSWnExQUpLNUxhNmF1?=
 =?utf-8?B?RXZtWDBqNGsvOFJ5YmR5RnpXS1BaQXRUcDhQZzZvQ2srTDVpWXZlRWZaYzVC?=
 =?utf-8?B?QVhtUzlKZzZ3M0ZRVXo4RDFYRHl6WTZFaUppamhiRDNVVndDYW4wOUN2cmdC?=
 =?utf-8?B?TXdYbGJMalg5bllFYmtOcUdRQ084V25TRXFhOEE2cjNHb3pJZFVtNzBOcVVn?=
 =?utf-8?Q?qbDJ1CqQW2WTKCRsJ28D7Zc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b49d248b-70ce-41c0-9152-08d9f910497b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 10:10:59.9606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeqWj18R2Phb5qdT+KpEvoRian8y/tuSJU0PLg56sIYhJTc9NHzzukYSxY1y3eHjg1XECkgqUY5rAwq9iiQVlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2925
X-OriginatorOrg: citrix.com

On Fri, Feb 25, 2022 at 11:57:05AM -0600, Alex Olson wrote:
> I think there is an issue in the spin_lock handling of patch 2 for the
> "msix_write" function as it results in the lock being taken a second time while
> held (hangs). 
> 
> The lock taken before checking "VMSIX_ADDR_IN_RANGE" isn't unlocked for the non-
> PBA case and a second lock is attempted just before the call to get_entry()
> later in the same function.  It looks like either the added lock should either
> be moved inside the PBA case or the lock before get_entry() should be removed.

Sorry, was in a rush to send this before leaving yesterday and didn't
refresh the commit before generating the patch, v2.1 should be fixed.

Could you provide a 'Tested-by' if it work for you?

> 
> On my server, upon loading the ioatdma driver, it now successfully attempts an
> PBA write (which now doesn't crash the system), but I'm not sure I have a way to
> fully exercise it...

Urg, that's weird, PBA should be read-only only according to the spec.
Writes to PBA have undefined behavior.

> 
> I also see a different (related) issue in which modify_bars is called on a
> virtual function seemingly before the BAR addresses are initialized/known and
> will start a different thread for that topic.

SR-IOV is not supported on PVH dom0 yet, so that's not going to work.
I've posted a series in 2018 to enable it, but sadly had no time to
work on it anymore:

https://lore.kernel.org/xen-devel/20180717094830.54806-1-roger.pau@citrix.com/

It's likely not going to apply cleanly, and there's a lot of comments
to be fixed up there.

Thanks, Roger.

