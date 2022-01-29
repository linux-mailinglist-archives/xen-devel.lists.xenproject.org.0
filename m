Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76864A2AE3
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jan 2022 02:10:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262181.454358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDcFC-0001ks-Mj; Sat, 29 Jan 2022 01:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262181.454358; Sat, 29 Jan 2022 01:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDcFC-0001j5-JD; Sat, 29 Jan 2022 01:09:34 +0000
Received: by outflank-mailman (input) for mailman id 262181;
 Sat, 29 Jan 2022 01:09:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOZR=SN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDcFB-0001iz-IZ
 for xen-devel@lists.xenproject.org; Sat, 29 Jan 2022 01:09:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b4e645d-80a0-11ec-8f75-fffcc8bd4f1a;
 Sat, 29 Jan 2022 02:09:30 +0100 (CET)
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
X-Inumbo-ID: 1b4e645d-80a0-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643418569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QnKEPdCpG8jWWcCViSR22MoKTp3jDlGlpgl3YtgJBj4=;
  b=hl168RNSN2kVRCznmK3LAPgR0ChrSBAqhzattPgwCyAY053iFok6l904
   BStCuYArGqPQWJAPJh+TWJktPrbcRK6t3EY4lkShvwHNoHBEHJB98diug
   POVP/j5XSTvCDyO2EnQtzAWI/OTkvJ7yINwzMXgI7B+J+DG6pbi9H7jOq
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yH9fWa9XX1qavvS4oDbJvQbJnqBZ9fea/tojkOL9ZVCUCwPEHwjiV2o/Qj/7PoG0PhdFgdTYBj
 BNrJFLN++H7JmPxtQHl1TFIMQvqNdVBY3VCx2Bkq/3+TuhHyBiCoLEnc2sT/HJv+60kpQ9o3pk
 hkGlVO+Myyn1/k3QTPk+0YTcse+NBPnpIK3ektIzixVGzqOuQA3frl8ks840CljsJbx/s6fM8o
 NifuE/PzDpNtDWVLCCqf95RAGt+OUk6T3m80/DkrWufzrgvLJQ3GfEu6yukJKgAR36GH8FKpVa
 1t/1LZoIEqS9HWXm6TH7SZF6
X-SBRS: 5.2
X-MesageID: 62495119
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5ouYfK9DsbYQqWzten6+DrUDbXmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 GZNWDyAO/jZNzbyLo10PNmx9h8F7JLQx4IyHgA4pCw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj0tY16TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhex
 YRiqaerZTsoGZSVv/kEeShHOHthaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4UQaeDP
 pNIAdZpRAjKYg1FBQ8rMZE3trmmhj6nNB93ll3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0dNcBPPEB8y2xy43tuiGEH0I1URUbd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb5
 hDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0lfxY0a5deIWK2C
 KM2he+3zMUPVJdNRfQvC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhTcyBjW8iq+pMGHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:EF5dua/0nPg2M98e1NZuk+F8db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFr7X5To3SIDUO31HYbb2KjLGSjAEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadh/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHjWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNENyMIv/MmTvKe0Tt8gDg06t
 M644rS3aAnfC/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvtn+9Pa1wVB4S0rpXW9
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wuK4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fqd2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLH3QIwFllu5EU5HHNcjW2By4OScTepGb0oYi6+XgKo
 OOBK4=
X-IronPort-AV: E=Sophos;i="5.88,325,1635220800"; 
   d="scan'208";a="62495119"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItKzzg8PFopGq2LbGH0Np8izHdjpE4AhbFwuC8s5Yg+ZZ2X+ce4fRszG9SqUs6IjKzq0rz7uLab4fDEJzxOltCcs1gaDsoVgMOuGcysh8nQAcXBQLZd2HerNjsZQaTszQDk+Am0sSsY4GNsaaX26JU+s7H3MR89BNqUpj90SpkES22yaJHNYcgjhhKSZspvOqpeY8gokDnvWDniPVI0pujxBWsSZqc0qJ147V0X4LQfk8DRyuDAA7eNNas/vh8P70lj033llysQ1lntayKOvInFyMLdOutlmISk9psH0GiMTL8DjdcL324sqWZpIplcVs5Zo9lyfyw4BoxUL5MXLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnKEPdCpG8jWWcCViSR22MoKTp3jDlGlpgl3YtgJBj4=;
 b=FInQseF98iyYKCt5vk3hFglpnqA2FYWckTiHGEnNMugAga3kFAUVjEoAEUjZw/rGVTjgEwEJF3luhYU5Ykc3823+TlAXZCrzeikdPeFy3CLFox/X8LgMnUL3XX/XzcZw8TXOXALEzgfvymft5XaUDJlimZLfdzZo3QHhWWa79+INYt2R8ikO6rf3meOSVg4v73c3cPZREquMGrmoWjlpjum48mtrZrJt2vbF1NX5479RGfW96aLfCw984HZjKWq1LhPPjAJV5zw/ma3uSWrwSfYZJg5uh/tFGDgnZJ4Um6OVbTD1AyOQ2GJQiHEawHJ4ISzGJPxBFHwDtVNNvhClyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnKEPdCpG8jWWcCViSR22MoKTp3jDlGlpgl3YtgJBj4=;
 b=FIESlZNXcXhaUmnQ0G1qmAmUiy6/bq54ingntAzLopoTX2SrqkmzyhjdAR6KLefY/Ga8r9803wMycXu41Izdf/LAgSaemXxas3I9jOBtkcMQkA+sgVuzDkIGiyGdx+zSi20xE/sN9NuHNz5GuEh7Qt4TWnZQ0bu7aHyvvgD+QIU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 4/9] x86/spec-ctrl: Don't use
 spec_ctrl_{enter,exit}_idle() for S3
Thread-Topic: [PATCH v2 4/9] x86/spec-ctrl: Don't use
 spec_ctrl_{enter,exit}_idle() for S3
Thread-Index: AQHYFEslNylcZ92lUUmGXdMcKHF6zqx5MROA
Date: Sat, 29 Jan 2022 01:09:15 +0000
Message-ID: <236d45c1-a067-829b-1a77-85cce2cd8c4f@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-5-andrew.cooper3@citrix.com>
In-Reply-To: <20220128132927.14997-5-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 942998a2-2535-47b5-8848-08d9e2c3f80e
x-ms-traffictypediagnostic: CO2PR03MB2405:EE_
x-microsoft-antispam-prvs: <CO2PR03MB240500E30D94F556D86746EFBA239@CO2PR03MB2405.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C3bxCYaSMS+Qezwux6wOoBI+dYxJrNcKq4bk+VY+TXujMa+/1pZJNHWe9rBHFhzSnh+nXsqWtb08H0T2Iyfg5Z4t1fuPiSLaPI702E/Pe5XbuLmVdTItf+3e1ApZDBF5fCBwaVpHLs7e7TWE8W5cOi5bufezOjrXx5B/JtpW5ojZuB8VuhKa5Bj6V/9r57eGWtTxU0Y9vQllJ/eLvMR/bErDdbr96VNvRL9oZ6uxnS2Xz/jZAzTt7YnyaIXq4+bJJz2fjWshqZsUBKgwNn0u4LZx8SFaOfR4qMBoJyLRLaZ6x16iaLcRK6YeyOaQ13mtXaVrd0z4R0/7XA8z9Z5ZjbRvJNkyWJRUkyYSL6oBqDGGk11CRWISEfNKG/VXci4HW5t/XBgXgsd/Hs2NHmqg52gnIgbJVug29eA0Lp5RysMxgK2EwFlrGfuv2Kcw69G1xEE9UvyhroxDBfKLhFeGMv/O+CYD7P4Ez3bIrjVqyWzJAUW6hCynsElgRZOEUYlDL79LYDguw3qTFHnA8O9vxH3Hbv9egwMPXYGkY9bmYYes+IVC1tpuTcTH8owx6K2jHE08AkwZHEa6YxrXGwmPKaZvgU/uiEXEmdzFvIbJYq5lpvlR2iUc9Ga4ec/x4eyuoqqc/S+F/9xA22QB51v64eiaAYiMSu2gPb43Qsbbfrf1yjgoTT6AfvLJ3QAlUB+bjDxgROMnXO2jL1DY8NaXDqqU7ZdxQI8vrub1QWvpZXvq/las3rhVoDPkxBcAIXSVokiyWdWyHSYpFm5Bi5uPFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(26005)(508600001)(6486002)(186003)(83380400001)(82960400001)(38070700005)(6512007)(2906002)(6506007)(71200400001)(2616005)(53546011)(5660300002)(91956017)(6916009)(76116006)(66556008)(66946007)(8936002)(54906003)(8676002)(64756008)(66476007)(66446008)(36756003)(4326008)(31686004)(316002)(31696002)(86362001)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFVWV0R2bEFKeGNTRjYyUXIyNjhFWnVSU2ZPZ0prcHg5QVJaNmtkbVdxT1Y5?=
 =?utf-8?B?bW9QOXZxMkRPQVBBRHNaK1ZUZ01MdDdPMnBFQWg5L0FzUkwvSWQ0SmtWeDgy?=
 =?utf-8?B?QU9xNUp1RFlVRElQY0szbEpIZVlBU3hRdktlUzdhd05DeUs4ZVR1NHNxaEMy?=
 =?utf-8?B?dVd6SXY2K1FRclp3Y3ZwZk5ndTl0MTA3cStyaUtqdm5Od0hncDhHL1lUN2hj?=
 =?utf-8?B?bmJiQnQrNW9YS1FLZG5FaWN2QWNwRjFWQ2Y3a0pkWFQ3Y3M4bXRwMldwcDFT?=
 =?utf-8?B?dGhkd0FEUXMyOGM1WjVNZHliaGF0em5YTU4zdUxKUXJ4WTRZck9TcWZ1dndS?=
 =?utf-8?B?dGRtNUR3YmtRemVJWXRLcXJGcnN2MkxlNkFVRWN1NWNXaVpveEsycGtUOTUz?=
 =?utf-8?B?LzQwWUJ5THdWaVhSZEJsS0wwdng0SkxZN1AxZGFMMUthM2NGZEtoQXErNGlL?=
 =?utf-8?B?RWtLKzAzZ21SUDFmeDgxS3YzZmwrMWxRbGhSdTQvYml0VWhPUmt4dENaSEhU?=
 =?utf-8?B?aDlEdWwzZllqSVpSVkh3TTBEenliRmtQRnZZc3NuaFIzUUZ4aFIweDkzV1lr?=
 =?utf-8?B?QXovbHM4aTR2Q3RkLzNwUzQwQis1KzJjMU55RW13QWpwelNsMnRzNHBUcFJj?=
 =?utf-8?B?aVNGajdEdUxKT3dtSkVDRU15Vmc5TWg5eFgzMm1NTm5DdFgrWDRUYitHZmZI?=
 =?utf-8?B?UEdTYk1DVWsxNmFQcWJIL0dQUFFrNkl3RlYvL084ZFR6SlhEWThVcGZjYkxJ?=
 =?utf-8?B?Z0FadXhoRGdjbzZ1djV4clYwZEV4cndGTUwrZEptVlpjUGlna09XY2Rmemtm?=
 =?utf-8?B?alFvaUE1OGE3M1QxYWJ5M3FPZTdJakxHVFNZWTY5dHB5UU13dDJCRldmSU5Y?=
 =?utf-8?B?V1BkSkUwVDNBcmhyb3k0MGxObTAydWdseFJmVzRZS1grMkE1UThpRmFGVmcv?=
 =?utf-8?B?aXFERXVMZkhMR3VDTWtJcTFkNXNjYklsSFBEVXZzZ0llbEI0VWZONjQzY0F4?=
 =?utf-8?B?c3VvMklwTVpIclNaM3g3a3VhaWlCQUJ0TE5MTDZEUWtibkc0UW1heHFRL0xV?=
 =?utf-8?B?ditwMWloT3ptcUptS1MxY0IvZkErOWlucTlwMG8vNTVybVJaZnBudTlTZHp4?=
 =?utf-8?B?NUV0ZUJzSnJ5Qk1Pbis1WjBoV1ZvdDFFMHoreEs5cll6QjdHYk1PN1B4anFB?=
 =?utf-8?B?WFdLN0NEckJqblh1RkM0ejk3MTFQclpXdkRjMmpHaXRuMGN2cjdaUXV3enFv?=
 =?utf-8?B?d09UTjliRm9lbDR2b3hYWDRyN2JmQnVlS3g3Y2tjTkhzSEg2emNnTDVrN3p5?=
 =?utf-8?B?cWZnL2xML1l1dGd4czc4enNoYzhMZTNaa2hmbmcrVFBydStabzI2U3huQnlF?=
 =?utf-8?B?K2Z5WWNVYVFZS0kyNy9GVkl1Znlva1J2Qkw0VktGR2ZmOW13aVh6TkJBSUU1?=
 =?utf-8?B?eldYa3NWMkFQU0dzVzdFVzRMOG15KytvUUNRWEwyamxjcWpPTFpXcnRXZ3Vw?=
 =?utf-8?B?Y1lkTnFiQSt2M1BWV09vYUVBeWNJdTNUWVFRYkJFL3Jzdmd0WmxseEdEbUhy?=
 =?utf-8?B?YTNSV25CZzZQUDd1ekdZS2tRdGxaalYwRTFyT2JSSTdYbTc2RmZ4N1ZHVDR5?=
 =?utf-8?B?ZDFpVy9Mb1JjUityWXpVdTdNb3NwU3U4eG9aL1FRRmtUSFlVR3dxWEF1aDBy?=
 =?utf-8?B?VTloZW9uNVVNRkx0N1hQUFMzUW9meTVjWWszZG9DQTh1dmlyYVJ1Qlk4S25h?=
 =?utf-8?B?OG01cTFYWUF4MEtrYzZaWVFnWkdENGhPM2Y3dVNucUd3U21vNFF0RjVWdUsy?=
 =?utf-8?B?K3o4aUttZGh1dDVxaExTRHU3R3ZzSzJOVmw1OVh0V2lCd0RkSnMraUIyYVhj?=
 =?utf-8?B?RG8wSkxLdXkwdkdVa0Q0V2p3UGRxUEF5cUhXWXpGV0FweHlCUGtRWi8zc0Zm?=
 =?utf-8?B?SEc0dDNYT3crS1IwMWZZZU8wSmduSXY1Y3ZkelRGSUF6bjc3dmMxRGdyZEF1?=
 =?utf-8?B?QlVzbEVKS1BKcGNjWVNiNVFGdStFL0JCWXI5NWR6bHZnQ285M21nMnJZdXJK?=
 =?utf-8?B?ZDR6bkw0V3hKU2JENWozMnR1SnN0RU5mcXU4RW1ON3U3dFBKUlVxQ1FTSTFQ?=
 =?utf-8?B?eTd2WnkvZnBMQWNEaUNTcEl5LzB0WElGbm5HMWxrQzhubXpHUVVwdHRGKzFS?=
 =?utf-8?B?aUgrWEZ6REk4SnFWZExYVFBSb0cxVXB6OHkxYlZUWUxGSVhya1QzbFNDNGxG?=
 =?utf-8?B?ZDNZemFrUjE3S0ZNUUJIbUdqQkFBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <600E59CE2C2FBF46B939C2A70ABF952C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942998a2-2535-47b5-8848-08d9e2c3f80e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2022 01:09:15.6900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mz44Ih4mhPnWSqNxf7lQKHk6cTabX0hw4KPpQC2ree7XdRJoMLLrkDNGwyVIE7EiFs85XfSGpkV+b1gqPg+QlCWmM4rNGDVtiswNGUdZrqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2405
X-OriginatorOrg: citrix.com

T24gMjgvMDEvMjAyMiAxMzoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gJ2lkbGUnIGhlcmUg
cmVmZXJzIHRvIGhsdC9td2FpdC4gIFRoZSBTMyBwYXRoIGlzbid0IGFuIGlkbGUgcGF0aCAtIGl0
IGlzIGENCj4gcGxhdGZvcm0gcmVzZXQuDQo+DQo+IENvbmRpdGlvbmFsbHkgY2xlYXJpbmcgSUJS
UyBhbmQgZmx1c2hpbmcgdGhlIHN0b3JlIGJ1ZmZlcnMgb24gdGhlIHdheSBkb3duIGlzDQo+IGEg
d2FzdGUgb2YgdGltZS4NCj4NCj4gRnVydGhlcm1vcmUsIHdlIHdhbnQgdG8gbG9hZCBkZWZhdWx0
X3hlbl9tY3Vfb3B0X2N0cmwgdW5pbGF0ZXJhbGx5IG9uIHRoZSB3YXkNCj4gYmFjayB1cC4gIEN1
cnJlbnRseSBpdCBoYXBwZW5zIGFzIGEgc2lkZSBlZmZlY3Qgb2YgWDg2X0ZFQVRVUkVfU0NfTVNS
X0lETEUgb3INCj4gdGhlIG5leHQgcmV0dXJuLXRvLWd1ZXN0LCBidXQgdGhhdCdzIGZyYWdpbGUg
YmVoYXZpb3VyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KPiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4NCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBD
QzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4NCj4gdjI6DQo+ICAqIE5ldw0KPiAtLS0NCj4gIHhl
bi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMgfCA1ICsrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2FjcGkvcG93ZXIuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMNCj4gaW5kZXggMzFh
NTZmMDJkMDgzLi5lYTJiZDhiYmZlOTMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3Bp
L3Bvd2VyLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYw0KPiBAQCAtMjQ4LDcg
KzI0OCw2IEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQ0KPiAgICAgICAgICBl
cnJvciA9IDA7DQo+ICANCj4gICAgICBjaSA9IGdldF9jcHVfaW5mbygpOw0KPiAtICAgIHNwZWNf
Y3RybF9lbnRlcl9pZGxlKGNpKTsNCj4gICAgICAvKiBBdm9pZCBOTUkvI01DIHVzaW5nIE1TUl9T
UEVDX0NUUkwgdW50aWwgd2UndmUgcmVsb2FkZWQgbWljcm9jb2RlLiAqLw0KPiAgICAgIGNpLT5z
cGVjX2N0cmxfZmxhZ3MgJj0gflNDRl9pc3Rfd3Jtc3I7DQo+ICANCj4gQEAgLTI5NSw3ICsyOTQs
OSBAQCBzdGF0aWMgaW50IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkNCj4gIA0KPiAgICAgIC8qIFJl
LWVuYWJsZWQgZGVmYXVsdCBOTUkvI01DIHVzZSBvZiBNU1JfU1BFQ19DVFJMLiAqLw0KPiAgICAg
IGNpLT5zcGVjX2N0cmxfZmxhZ3MgfD0gKGRlZmF1bHRfc3BlY19jdHJsX2ZsYWdzICYgU0NGX2lz
dF93cm1zcik7DQo+IC0gICAgc3BlY19jdHJsX2V4aXRfaWRsZShjaSk7DQo+ICsNCj4gKyAgICBp
ZiAoIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9JQlJTQikgKQ0KPiArICAgICAgICB3cm1zcmwo
TVNSX1NQRUNfQ1RSTCwgZGVmYXVsdF94ZW5fbWN1X29wdF9jdHJsKTsNCg0KVGhpcyBsb2dpYyB3
b3JrcyByYXRoZXIgYmV0dGVyIHdoZW4gaXQgZ2V0cyB0aGUgcmlnaHQgdmFyaWFibGUuwqANCmRl
ZmF1bHRfeGVuX3NwZWNfY3RybC4NCg0KfkFuZHJldw0KDQo+ICANCj4gICAgICBpZiAoIGJvb3Rf
Y3B1X2hhcyhYODZfRkVBVFVSRV9TUkJEU19DVFJMKSApDQo+ICAgICAgICAgIHdybXNybChNU1Jf
TUNVX09QVF9DVFJMLCBkZWZhdWx0X3hlbl9tY3Vfb3B0X2N0cmwpOw0KDQo=

