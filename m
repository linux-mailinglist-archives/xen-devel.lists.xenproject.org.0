Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205814464B9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 15:18:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222416.384590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj038-0005bY-ST; Fri, 05 Nov 2021 14:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222416.384590; Fri, 05 Nov 2021 14:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj038-0005ZX-P4; Fri, 05 Nov 2021 14:18:34 +0000
Received: by outflank-mailman (input) for mailman id 222416;
 Fri, 05 Nov 2021 14:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VR3F=PY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mj037-0005ZR-4S
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 14:18:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f211296-3e43-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 15:18:31 +0100 (CET)
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
X-Inumbo-ID: 3f211296-3e43-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636121911;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9qzAvhEkB9Z+n4IkV/g1ObOpirm5X4OpzbyV2v96Bc0=;
  b=OkGIPb3EoJJLCbVgMXW0e7ZdmTznSFnMR2rJ4uZDVAixuI0LiIkKSAY9
   26LeHYY3KqoZLuQkXKMLX6gMXqHrF+CdYQmTh6LokHUAfcWtxBlkrWXqv
   tvPJvJumBLWazUupGwlc1+xwN2SyHtEOlGMLOfxpOeC1yHTmHX4UIXGFu
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LcTrzB4gCCyFXKk33tWGuoUhiITI55oEn7mJNKTiIhyKzIiG/uZsPMpGoEppYFWtK1puQkPO+d
 qNZS+mnJjOnWXlnVHAzqSl3x3B9AKgWjzoNpNQtWkm//kBITsZ1agKRMz1Yw+R5dgNUyrdhj/s
 0r4tFoTrlkbtZ28yLjJZiCj5PvQAaNOVeQLND8Mfu6aveR/1OQjvJCiwi0tIwtwA8gXXKfFRF5
 jxKkK8NtwjVhna6LBgIO+WNcwcDIxL2ICVLCIKdybmD0CyAQJKwXix5dqJCJ5hiaBDiqSIt1P7
 w0cnEvqVaebSLmKdK5N0nsOG
X-SBRS: 5.1
X-MesageID: 59114375
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rSEyB6p+e3XgGfzYGvNZ5JfFJkReBmJ7YxIvgKrLsJaIsI4StFCzt
 garIBmOOqyNajGkKI10Pdzg9RxQ75HQmtRqSVM+qS1gFXgV9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2IDkW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnY7pGBx1OK2RotYQQyECE3wiJYx2o5aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ptAMGY0M0mojxtnF3pOOJAjtuSToCfaTjIDswPNirIN/D2GpOB2+Oe0a4eEEjCQfu1XlEuFo
 mPN/0ziHwoXcteYzFKt7XaEluLJ2yThV+o6FrKi8eVxqEaO3WFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQN05tucmSDoyz
 FiLktj1Qzt1v9W9QnKH96yIqiuyNDJTMikJYSYeTiMK5tDipMc4iRenZtR+FK+4iPXlFDe2x
 CqFxAAAgLEUgd8Oxr+M11nNiDKxpbDEVgcwoA7QWwqYAhhRPdD/IdbysB6CsKgGfN3xokS9U
 GYsiZHP97wIDcy3piGdeL8NQe2xxsbeGWiJ6bJwJKUJ+zOo8n+lWIlf5jBiOUtkWvo5lS/Vj
 Fz74l0IusIKVJe+ReouOt/qVZx2pUT1PY29Dqi8UzZYXnRmmOZrFglKbFXY4W3imVNEfUoXa
 cbCKpbE4Zr35M1aINuKqwU1jeBDKsMWnzq7qXXHI/KPi+f2iJm9E+ZtDbd2RrplhJ5oWS2Mm
 zqlC+OEyg9ETMr1aTTN/IgYIDgidCZgW8ir8pcKKLHbc2KK/V3N7deLnNvNnKQ/zsxoehrgp
 CnhCie0NnKm3RUr1jlmmlg8MeiyDP6TXFowPDA2PEbA5pTQSd3H0UvrTLNuJeNP3LU6lZZcF
 qBZE+3dUqUnYmmWoFw1MMiixLGOgTz23GpiyQL+O2NhF3OhLiSUkuLZkvzHr3JSUXbu7JNWT
 n/J/lqzfKfvjj9KVa7+QPmu00mwrT4anudzVFHPOd5dZAPn940CFsA7pqZfzxgkJUqRyz2E+
 RyRBBtE9+DBr5VsqIvChLyerpfvGOx7RxIIE27e5LewFC/b4mv8ntMQDLfWJWjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRC7/UfxrJQtQasd
 FiI/91WZeeANM//SQZDLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIeIsYo0/w
 OontMoH0CCFi0InYoSckyRZ12WQNXhcAa8pgY4XXd3wgQ0xx1AcPZGFUn3q4IuCYslnO1UxJ
 mPGn7LLgrlRyxaQc3c3EnSRj+NRiY5X5UJPxV4GYV+IhsDElrk82xgIqWY7SQFczxNm1eNvO
 zc0ax0pdPvWpzo41tJeW22MGh1aAEzL80P8/FIFiWnFQhT6TWfKNmA8Zb6A8U1xH7iwpdSHE
 GV0EFrYbAs=
IronPort-HdrOrdr: A9a23:DK1066lpMY64hRKdnjJy01bbVqXpDfO8imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IObuEYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtJdBkVCe2Gm+yVNNXh77PECZf
 ihD6R81l+dkDgsH7+G7i5vZZm8mzSHruOqXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6S60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKcQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOifx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Ss1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgv/DWVZAVwIv66eDlGhiTMuAIm2EyRjnFoivD3p01wt67UEPJ/lq
 P52qcBrsAGciZZV9M6OA47e7rDNoX6e2O7DIujGyWUKEg5AQO4l3fW2sR/2Aj4Qu1D8HMN8K
 6xJ2+w81RCIn7TNQ==
X-IronPort-AV: E=Sophos;i="5.87,212,1631592000"; 
   d="scan'208";a="59114375"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyAn620+EonpPUf9zr8Tg3vmBLph9NjcV/pLqJkQ5oZ56qWaR5WjA2uh2DSxDyKhGLf5PTLG2amlS8ZQjc4xTaF6dilUa/rnON3N1bfNkQxx8AlUEXShaktH/Fk3MYzEQsADI9z6HQR3jDX2SBxM4yuwBO//yDs7v164hp1OjYFBFmEIvX7911H2Ktk+nzokBJZ9ZEC9I8HNHdNXJWBKW8nmvxC4DEbUspQUHcFebH7T/g/D4OdUup2/d2cV5l8yrrQe9AZ6lW2liJr9bhERcwf+NuDe1GnDTdZ4fh0kXmBDep14HAxuk64Mj+tHi2Esnm1rgPX1gI8QAyECf2Fc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M+TudPcWuv2Qlh0V/XNnt8gaDo4/za+cTeiDqELojU=;
 b=Us5HpKnF1ShgTnBAyp2CS5MUePYMlJqnwurL2OqPHmsSJPkiCGKx4UANRb7X57uXGn9fOnldW0ckvEoN0NWh9khTWOk6CAnu+2J7xrxoa/gCy4w87ShAN/DateBPV2uBlc68zfCp8t3HpA81y3kbHQPmIyzDNqDaqXKK6s4TIhuJZ2yglbYDBsrMIaWrqxAfHxjn4F0y/wYeNNaB+AMz11OjVwiXMMJpgn3XtvmabrQInvfvaf1sp7aL/SqrAwaynPRGfAWBu/7WF/9tJSWs7JSgyOl7pURDzGX130gF4wY2Al1Rp7r2FahBVYReBedbO8sls8rTf+7ffHom/8dhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M+TudPcWuv2Qlh0V/XNnt8gaDo4/za+cTeiDqELojU=;
 b=qYsus32Ub5EVaEtDKOXAqPStxrQstW/LWq9K/1TU8jSRRH26xw2+n0JwQRETgmR7VmDLD2lbuAixlMZG7ROaUxT1DtvnlBmzeEnrip9PTejGsnBlpQcAPPNrXYwKMguQ3A8hbpZOZsIeRj3JFPNeiGaKBr9LPyliOtnWWU/IH9s=
Subject: Re: [PATCH v2 00/15] xen: drop hypercall function tables
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Ian Jackson <iwj@xenproject.org>, Christopher
 Clark <christopher.w.clark@gmail.com>
References: <20211101152015.28488-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ddde3565-de0f-f025-f762-9d3e08a5c2e5@citrix.com>
Date: Fri, 5 Nov 2021 14:18:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0361.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ad09954-ee4c-4a5a-1a67-08d9a0672161
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5949:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5949ED2DD9D8D2CC5DBD9262BA8E9@SJ0PR03MB5949.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: En6Ttf3FdToNFznHKWux+IyPTjDplPUFim1hFuYKEG5H2slMYYPwa/j+S6JnrRPjU9Sz91s5YvvKSqikPKKjYmEYcKSEkmrdYBCOUvYY1eTm12ZQg6wK/ge2x6Qbd/AXAeA9i1B17GIyaUXO+j6UfCt3eW4mtd3+uSf1Pgpi+AuUGEJ8Wq5LcAu1YFQkfoxYmYv3zZIHyXpV7RostLV2/9s71s228UiGoBiTO04zBoh64j86ZoyGWigepNB5Xf5D1mKxI0oZIj7D2oV5wKBqcLeb7Yr0zEM+3ZVB1Gby0f5cfX1tyHMHeND24XQODXPAjCEqzzvkFn1BLRD0uh3P93SB0wgefcDoY+1lRG1JaBJFxrnfoyPIAY9fHnB6SNvnCR7aIxy+wGwMEdS4lA7vfKEOMxnYmyYn8hlhW4di6tEbR5kT0ZApYyBDl19+z8IMjLqrZEWhKyuQc1HTop19it5v/rGWzjKq0J6nxM10V5rJufgfqg7O1BfOof+AWUO2tySzxT59EkPE6h3z5Pzisk1hONkfF7gBaO0WT47I8Kw/ZCH0am9jZFmL5Bo3iR4E0rflF8w7DWA0HNhauXt+HOAOI8ZWTowamlGGu8OjivmwK6Dv3bLXYK6Fke71EjvtWgNfJ2kuQaA/ZJRiTm49sMjPQALqeNhR47gxvwPVMQjrRykgEIYFhz9A6xc5pdzpwJwVUa70H1LehZr0BwrWZXTsnWdggDt+1Z43fClY93eqcxQtGc1vdHlqmD0lJDKd1DWyEebu6KTMG+9fmsKNzVuMNDhJEywk1dOLF+SrGvGLwzeHV1cAkEN621AWrpuF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66946007)(956004)(5660300002)(966005)(2906002)(2616005)(66556008)(31696002)(53546011)(83380400001)(82960400001)(38100700002)(31686004)(54906003)(6666004)(36756003)(16576012)(508600001)(186003)(8936002)(8676002)(6486002)(26005)(4326008)(316002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGw5V0QxMWZwNTI4cXBOTEN0RHkvTW94b1dMS3hTZ1BuKzE5d2xyN1kzU3Ny?=
 =?utf-8?B?TTFjYVRCVHJGaVZ5SmFQT1FRNlhhYWNiYVFCSWo5ZjlmZlpMQThVUDBxSUNw?=
 =?utf-8?B?RFZ6ak1OcUhINUdxdEExVnJQL2FRQ21WUHMzb21kM05zSUlMc2xKbmNCMnVH?=
 =?utf-8?B?U09yamFvRVhtY3RGV0JnYk1RSWpLUmtIcjlNVm5QRTYzU1BPeFNXMEdCMUo5?=
 =?utf-8?B?UUt6UU5rTGo1WE9nbm5LQWtFNUtwZGI1NWhOMXBZOWs5U0NuclVqQ2lRQXhM?=
 =?utf-8?B?OUF1VkFOMXFMUDBpNm4wand3VENTbzVqcWVNTytLcHN5ci9mZ2hmdHgrVzBO?=
 =?utf-8?B?MUR3aDZOTmY5aVZuNFBMZ1ZmR01XQ1dGalZBUzlRNXNhcjZobWNqSDJlTGVl?=
 =?utf-8?B?aTh2aUptOGRNOVJqTGthWlQva3RaZTZmRWpZdkdiRWs5WnB6dHNRMVN5YW9W?=
 =?utf-8?B?MTkxdk5iSFlINFJZVWkxRjNRRmRwbURPVDV3N0l2TW1hQXc2c2YzdTRnMzhq?=
 =?utf-8?B?ZC9sZ1NGWDRJdXFCMDRObTAzd2NiMlJiNUFSYWMyeXVOOGFMektDQmZZRi9R?=
 =?utf-8?B?ZnpwV2tHRis1Q3ZJalRtNkNOcTAwZWhhTUlUcGwxOUFrRlhDRlhkR1lIMUhr?=
 =?utf-8?B?T2xmdzJGN1ByTzdOWElNelhXVUE2MWxwcDZHS1BZenI1UlNPWWduWUcwZ1pP?=
 =?utf-8?B?R2FBVEFDQTYxY1RZM1M5c3ZCWFp4YzBRamJqVko1eDBNaW5xTFdnMDJzTzFM?=
 =?utf-8?B?N0dZUmJROVQ4UmFpc3dnbmkvalpCZUtPYWhTRGw5ckxDb0F3YkFLS2Rhdnkv?=
 =?utf-8?B?eGpsa0pnRUtOSkZZTGh4NldpbmxCdDNXS1cxU2FEdlVOK3VsS0JPYzB4R0Vu?=
 =?utf-8?B?eEZsR2NreVZkUVRsa1BhZHZHTTNZcVlOZ3VvWWJUd3E0VVBSa2VjME81S0xl?=
 =?utf-8?B?bXN3U3luZWdIRnJ5RUZzdDFPSVd5Y3duMXNiaXlxelYyUmk0UFdxQVdkQU9M?=
 =?utf-8?B?dW50a1lmNFkraEpvSnVqZHZHTDRGeU56a214TXl3SEJkb2xKSGp3ZE1oM2Ex?=
 =?utf-8?B?VlY4VlhCaElueDR6QzJBY0xsZWNORDRDVW95cHpzcmk5WGxZU3ZIaTl5Ujhr?=
 =?utf-8?B?M0k4VFdjL0ptTXVDNGN0ZlBpNTZNZ0R3aDRTeWZmbWlTMnFZZ3FRUTJHclBi?=
 =?utf-8?B?MHk5WWNRTXRFMEszd1NBYjFmeGR3YU1TMHJLNEE5YUE5Tjl2NGRlME9ZcWRG?=
 =?utf-8?B?WkF4MHY2VUU1R0ZXN25tQXlqc1FBTHV5bHNMSTJ0ZmZNbDJuSFAwcWQ5Sks4?=
 =?utf-8?B?a3h2aEphWVV5L0thTUgxcE5tY3JxSkR6MUhJODIxVlVEQnNvZk43SUE4Z3BP?=
 =?utf-8?B?eENpdGRPZy9kQm9UUXQvOVliVmZqTm5jNEJ1Szd6V09qVG5TcG9jaHpFWjFY?=
 =?utf-8?B?akNPUTYvRCtOQ2NLZ01NMm9TZHhObFcwRk5ZMVM0K2RRNDZpeTNHSFpKZTcz?=
 =?utf-8?B?VGxyYk1ibEdCOW45blNYanhnQ3pPTkNJeEIwS3p2ZTZ0WlMzekN6SWFOOEtn?=
 =?utf-8?B?YjhITGgzbGdkQU9mK3ZLY0lmaTdEK3pnNFhPb3dwMUEzT09ON2VkQ0VibmhI?=
 =?utf-8?B?eDJuOUd4NzZaQTZhWVFOT2hVTzMyRnRsbmRZa09NMmsxTThDeWQ1R2Q4c0Nk?=
 =?utf-8?B?SEZ2dWxEREptV0RiMVlXOUhwV1dZK1g4MlF4U0pQY21SdmpIbnBncndiYkZL?=
 =?utf-8?B?bmpzT3RGclJvNzQ1c2o2YjZpYVRCZUtYWEg4NEVjbmN3MzU1eTlWS3lpYThM?=
 =?utf-8?B?VDhpN1E4S0xUMm9sQlBzSWxkaEZaSHhwK1RyODlUMFpzbW9MNi9paFE2ZWQz?=
 =?utf-8?B?SHI5QWdpc1hTTENiV1A3NHQvdGFyTEhzV2VLQWpqdlJUeUVEa0RSRU1aRFg4?=
 =?utf-8?B?Y1Q0RG9RS0o3cVNpTERXTmlkRVFYWmo0N2RxcDJMNjVGU0QyTjhVRlVWKzVV?=
 =?utf-8?B?dCsrckpTcTVTTG9uQTlCMndVYkc2WjgxRFRmS2Q2YUVacFNQWk9RMEdlRXZu?=
 =?utf-8?B?QUJDdnIrT1p3RFZROS9zYlpwZ0ZOb2trNE8xOU9uQTJzR09NVFF6S0hMVGtU?=
 =?utf-8?B?ajBKVzB2OERPUlFDdzI3S05LVmQzU3N3T0lJczZRejFNSU82ak1QZm90YWFh?=
 =?utf-8?B?S01DZC9CeHN5VUdvTDZrMTNDUkRXUHBTOHN5VDNJNXpsN2tSTmUrU0FYTnBq?=
 =?utf-8?B?YWNuRFN1MzdEK3Q5K2Q0Z0ZPKzl3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad09954-ee4c-4a5a-1a67-08d9a0672161
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 14:18:25.4361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMO+Bpz676Zh9wvhhpCfpLpceC5EJUhSKZt2eGHNSMGTX98ifJfMJmLweZFJPFCzlSc+apeKtQeX98A8hFoa4WhdbJlamwSA4Erj4muAhRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5949
X-OriginatorOrg: citrix.com

On 01/11/2021 15:20, Juergen Gross wrote:
> In order to avoid indirect function calls on the hypercall path as
> much as possible this series is removing the hypercall function tables
> and is replacing the hypercall handler calls via the function array
> by automatically generated call macros.
>
> Another by-product of generating the call macros is the automatic
> generating of the hypercall handler prototypes from the same data base
> which is used to generate the macros.
>
> This has the additional advantage of using type safe calls of the
> handlers and to ensure related handler (e.g. PV and HVM ones) share
> the same prototypes.
>
> A very brief performance test (parallel build of the Xen hypervisor
> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
> the performance with the patches applied. The test was performed using
> a PV and a PVH guest.
>
> Changes in V2:
> - new patches 6, 14, 15
> - patch 7: support hypercall priorities for faster code
> - comments addressed
>
> Juergen Gross (15):
>   xen: limit number of hypercall parameters to 5
>   xen: move do_vcpu_op() to arch specific code
>   xen: harmonize return types of hypercall handlers
>   xen/x86: modify hvm_memory_op() prototype
>   xen: don't include asm/hypercall.h from C sources
>   add .gitignore entries for *.[is] below xen
>   xen: generate hypercall interface related code
>   xen: use generated prototypes for hypercall handlers
>   x86/pv-shim: don't modify hypercall table
>   xen/x86: don't use hypercall table for calling compat hypercalls
>   xen/x86: call hypercall handlers via generated macro
>   xen/arm: call hypercall handlers via generated macro
>   xen/x86: add hypercall performance counters for hvm, correct pv
>   xen: drop calls_to_multicall performance counter
>   tools/xenperf: update hypercall names

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/1752237172

Something here causes

hypercall.c: In function 'hvm_hypercall':
hypercall.c:174:23: error: unused variable 'r8' [-Werror=unused-variable]
  174 |         unsigned long r8 = regs->r8;
      |                       ^~
hypercall.c:190:22: error: unused variable 'edi' [-Werror=unused-variable]
  190 |         unsigned int edi = regs->edi;
      |                      ^~~
cc1: all warnings being treated as errors

I suspect it will be "call hypercall handlers via generated macro", but
I haven't investigated further.

~Andrew

