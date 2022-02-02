Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B885F4A6E17
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:50:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263946.456845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCHG-0008U7-SS; Wed, 02 Feb 2022 09:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263946.456845; Wed, 02 Feb 2022 09:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCHG-0008Rc-OE; Wed, 02 Feb 2022 09:50:14 +0000
Received: by outflank-mailman (input) for mailman id 263946;
 Wed, 02 Feb 2022 09:50:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFCHF-0007X9-3A
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:50:13 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8281c76e-840d-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 10:50:11 +0100 (CET)
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
X-Inumbo-ID: 8281c76e-840d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643795411;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hSW7uwBYLxiQutlbu2p75DF0z93hV46jP5cxJ1EP+Q8=;
  b=iIG8YsAj7oqqZzC6KUvBJPU3O/V7lHCeSZZTykZRNWByN69I/RsVPfbw
   JOTO+MFJTehI1FYQKZ7Z5T2x539jMq8MYBGC3nnCAmc7mhryoa0H/XPdw
   rLjG0GPJW8uiNs1usbvv46ZU+mwKYMge8Scf+9LAvRkFMOvT22f7/xSBH
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yU9N1HeSF/bzkFRSZauNJZqa1gdzcbF0TFRe4Enbh65xaAAjriQP9qLfKgqbzCaAr6nxnHJZpl
 QVS6uaUfCz/Mpah5IhC+6KObarxptJBglqY/rK5uU2pUyX3Bz+rIzOLnK+eOcu+sF1286fcOrt
 +xkSuuuSmvnw+fx0JXUz8tXyE5pPWhi1h0H+8gLznB+GazEU8RgO2FQiKOjKboN1sUdRI02ZaN
 rslyUzXyWujcwEydJ1fxZZCXWY16tKCGpx3psQsNbrHNzZeTJs+Rqe17C295N0wXdVHGOTz3SW
 pC+xeTGGfkiQPkcPQZkC0xIa
X-SBRS: 5.2
X-MesageID: 63218577
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9jjWVqLMv/KWqqR2FE+R9ZMlxSXFcZb7ZxGr2PjKsXjdYENS0T0Hm
 GpLX2nSPvzZZmHwetxzbo23pkIDvMPTxtRnGVRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7wbZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2jz5M20
 e8QmKaUEyR5MYzxnfkdDjZXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvoUBjGpv2aiiG96AZ
 5cZcAY1PSj9SDRFOQYNKaIDw7u30yyXnzpw9wvO+PtfD3Lo5BR4zbzFINfTPNuQSq19gEGco
 W7X+nXjNRsTPtef1Dmt/2qlg6nEmiaTcIgfDqGi//hmxlia3HUOCQY+XEG+5/K+jyaWXNZSK
 Fcd/CY0mqE0+Fa2Vdn2XxC+o3msswYVXpxbFOhSwBuEyrfQpR2YAGcEZjdbbZots8pebTsu2
 1ySltXlHwtzoaaVQnKQ8LSThT6qMC1TJmgHDQcNSwcfuYG7+Kk8ixvOSpBoF6vdpt//FCz0w
 juKhDMjnLhVhskOv42r8FaCjz+yq5zhSg8u+h6RTm+j9hl+ZoOue8qv81ezxe1bMI+TQ12Fv
 X4Fs8uT9uYDCdeKjiPlaOcQGLCk4d6VPTuahkRgd6TN7Bz0pSTlJ9oJpmgjegE5aa7oZAMFf
 mf56UAW/aUOEUGON4wnbKOMDtkqkIfvQIGNuu/vUvJCZZ14dQmi9S5oZFKN022FrHXAgZ3TK
 r/AL5/yUC9y5bBPiWPvGrxDieNDKjUWmDuLLa0X2ShLxlZ3iJS9bb4eeGWDYekihE9viFWEq
 o0PXydmJvg2bQEfXsU12dJCRbzpBSJibXwTlyCwXrXbSjeK4El7V5fsLUoJIuSJZZh9mObS5
 W2aUURF0lf5jnCvAVzUNis8NOq+DMsm8yJT0ckQ0bGAgCBLXGpSxP1HK8tfkUcPqISPMsKYv
 9FaIp7dU5yjuxzM+igHbImVkWCRXE/DuO56BAL8OGJXV8c5H2Tho4a4FiOyqnVmJnfp5KMW/
 u3xviuGEMFrb1kzU67rhAeHkgnZUY41wrwiBiMl47B7JS3RzWSdA3eg06Zqc5xQckirK/nz/
 1/+PCr0bNLl+ucd2NLImbqFv8GuFe5/FVBdBG7V8fC9Miyyw4Zp6dUovD+gcW+PWWXq1r+lY
 OkJnfjwPOdexARBspZmEqYtxqU7voO9q7hfxwViPXPKc1X0Ve8wfijYhZFC5v9X27tUmQqqQ
 UbTqNNUDqqEZZH+G1kLKQt7MunajaMImiPf5OgeKVnh4HMl56KOVEhfZkHeiCFUILZvHpkix
 OMt5Jwf5wCl00J4OdealCFEsW+LKyVYAakgs5gbBq7tixYqlQ4eMcCNVHeu7cjWOdtWM0QsL
 juFv4b4huxRlhjYbn4+NXnRxu4B154Ajw9HkQ0ZLFOTl9ub2vJuhE9N8S46Rxh+xwlc174hI
 XBiMkB4KPnc/zpsg8QfDWmgFxsYWU+c8031jVAIiHfYXw+jUWmUdD8xPuOE/UY49WNAf2cEo
 OHEmTi9CTu6Ltvs2iYSWFJ+r62xRNN8wQTOhcS7EpnXBJI9ezfk3vejaGdgR8EL2i/taJkrf
 dVXwds=
IronPort-HdrOrdr: A9a23:GQf6/KEJoJNAHZB9pLqFcJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9dVfYd1P7srhJJGdZc8qPSMex7wqDL3QSuvyAfcZek600ykke+D3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.88,336,1635220800"; 
   d="scan'208";a="63218577"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2nsDnJeRS9rDnoHUSUiDP/mBdKW8p7Md2o7TNj3fJhUHwygv/X07HHcGoAgIMFqywsy5CPiNVmWPK6ZoyY3J1uTs/e7aF+MSz41GrEPHn2AXedID6hxeKdg5nM8m9CzJTwkNCanKUaSvB6pG9WKq4xRrlg6AJUAB7Ez66sorC9rzWsb1gcvkRs8MxGmltxcSCGboBmHDKAqPmEessQjY5VBigSnchgQaO53WJn3L5xK9hZK/IjQjp9d+nFUja0xSi0tgxxBwSSlb6QMG0WKYMGsEN9HkIMp+L2xttWziA12T7JgNPau0ckNRpyi3pRmICQywuUwiqnTsKvzhNK3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMTs6TmJI+d5slk+yBtZIzCzL4m77upsgD/DgXXlER8=;
 b=P+gByGj8lc64SpI95TCEdJ+TD6Ee/lFhbe9VaR/N64OiJ+1iveuX8SNudSk5BE4BjvfXH/x2SXAwOB5oEYYAFz9b+318u7OoV6APFuzxUG/Eu0DitSsFD3DeEgakXxQCvRnIf6V/AcfE9jhD1cEdr+fJMiUx8463Xo4hnYRkTYHXd8AbQ463uARpxRz9ZEjunvG7xEU5EKNGQB6dJ+3sSDKNr+1U+ODRlj4jxcGPlnDA16p3MicinKjNuSS4uY5D4O9vMGq0qBOjO+x0xISgQ3NbLK/z1WGeJtmHFY1RoTmMYMJeGsBnbJFB/1/Z5sPUQcQRlB9dJVa9gauoVh1CoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMTs6TmJI+d5slk+yBtZIzCzL4m77upsgD/DgXXlER8=;
 b=xQVCIXQOWYoqL7vR117BB0esNuKiawmp56LTIHBftEa1Q/nx8Jau68FzHQVl6ppAO/kuzTlkaADGOOMER4E1A7SbxdypKb4QyaYnsSQ+DUeyR32mH3UOlOxvYTMFdy9ng62S0TCSjVarXev7MBwZlzEhv14RpDHmJpim4qp2YVs=
Date: Wed, 2 Feb 2022 10:49:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
	<xen-devel@lists.xenproject.org>, <julien@xen.org>, <sstabellini@kernel.org>,
	<oleksandr_tyshchenko@epam.com>, <volodymyr_babchuk@epam.com>,
	<george.dunlap@citrix.com>, <paul@xen.org>, <bertrand.marquis@arm.com>,
	<rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 3/4] vpci: shrink critical section in vpci_{read/write}
Message-ID: <YfpTxT+uylPGw/Mi@Air-de-Roger>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-4-andr2000@gmail.com> <YfpEiWT0NpYNSAks@Air-de-Roger>
 <5ed821ac-0a38-3c1a-a28a-c46295c2ffb4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ed821ac-0a38-3c1a-a28a-c46295c2ffb4@suse.com>
X-ClientProxiedBy: MR1P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62c9eaaf-d51f-47a7-0560-08d9e63161f5
X-MS-TrafficTypeDiagnostic: MN2PR03MB4911:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB4911F556240D4147A1C2B87F8F279@MN2PR03MB4911.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vj3k6TOXCOM73BkVosvtCbudCorqUlYE+84EWsr9UUBExS6nB3WqRZARYEPytAiiR5s4hCPowOk5sbBY5voGsCdaFwmA90ErvUWFE6dK1WTTX56B/i6O/3wBLtVkBvYK1zvyVV+zX9hutpJPadvuw19GeoifLHHdXjLiivM5KCqWaQrCGRiLlYSWMdSfKauMPrObHzBE6iLA2muwvRPAj7TVbUSbaowFgdEtcZa929UCLKXYBOq8Apk5fUGot/je1CcPW1Zf9pV5kg4QS7IxiQ3W/2QfAA5yWa/cBAfm/MMA4fc/wUqxI7bCiQcgjt30NzDg4gMISwrNsfXC1yBazEd+AohzEs2Lgv01snRFLnZl1VPTBOyrodtVRNT35QoqR/UfugEHQ5AwKd9loOuS6gX5sImXtlEd0xejselX8pnqVc49Kcmy8pOpLXHzzCcgs69oTcs4/hSBc59UYv4oNfRBRtXP6Ct18JNmrsKA6718v7V9GwM5ujK5bz+vLUTXmRP5YTwju+HW4fR5+BIUEfntpiFOlBLet2esGjLvqS1+Os5lIZupUeQfyxXTXwcmO+U27whvdTWSP/RRtff8T5VzVXQTbpSEmdOPm8n3qXI1lKSPYGXbA0kCnG67CsP+SDDa6s9Zx0Er0BvtYde8yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(38100700002)(54906003)(6486002)(6916009)(316002)(33716001)(508600001)(83380400001)(7416002)(6512007)(86362001)(4326008)(6666004)(53546011)(8676002)(5660300002)(2906002)(66476007)(66556008)(85182001)(9686003)(66946007)(186003)(6506007)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZjWmtxUDh6SDZaUmFxMVJxUmg3d3JlOTE5ajdidDk3TzY3cVpsQm5sY1V1?=
 =?utf-8?B?U0s3MS8xRitZclNjdUZtZFIzS1Q3MW9WRlFCZThjSWxralRRZVh2N29Qc0Fa?=
 =?utf-8?B?Qlp4NFhCbFF3SzF6WCtTYmRjNC9kdnlrQU1COGYyREdxYUpNV0xidW41UEFK?=
 =?utf-8?B?NHdOUWVDaUY4SU1oRC9FNzhWRHhXdSsyc2NvSG8wdlBEY0poZHdZMDNJYnJN?=
 =?utf-8?B?WnZpMGFuSXpFZ3VhVWFWdjRtQmo0Y01uU1ZRaG1TNUVJL0VxeHhmTWJSdE0y?=
 =?utf-8?B?MENPd3pvSHYyZmc3U2xHTXcyZ2k5WXpwcXlOYkJtT0VsRkhYNlRxb2RlTzlX?=
 =?utf-8?B?QjY5RjJLT0pwa0FMbmREV0ZyNHAxK1MzS3JqSnl0WUZWcXprU0JPdUlhRUtO?=
 =?utf-8?B?bEYwQUlwRVlacDNTR2poQVI1ZW5kZ0Q5bjhFQjZIRzBZWU9uYXpIR1BybjZR?=
 =?utf-8?B?ZlRtNVBGU1V3MHA1ekZhbjAvNXlSd2s2RzRkanVNYStSbzNXWEZnUldZbW5n?=
 =?utf-8?B?RkNBSUdiQ28zSDhVWk5nZytSWHliL2NabkdYTTB1cWkwQ0dQalFNMmRKU1Ur?=
 =?utf-8?B?dUY0Y1VDak4xUlBNRkVmaGs4YlFBbkcwVmtVRkt2aDN6d3ZXb3BBNkJrNWMw?=
 =?utf-8?B?OWU2V1ZHbjJFUkdCRU4xLzZQTDVDa25qWjZCN2Z5bUhoWDl2RVJHRHpTUTV3?=
 =?utf-8?B?a2s4V2dNNk5SeHN2S1VJNnZDUkxIMm1IUndJUHptYVJJU1JxMjVtZU1CczNV?=
 =?utf-8?B?ZnM2RmNmNEhQS056OHpZNjNmTkN6a0gwcDlURmkxQUJtNDFTL0twYmNSa3NO?=
 =?utf-8?B?WWN0TG12cEYxVGhLZjAyTXk4QktoYm1SYjMvOTVmbmk4VEg0eEhYOWRXWGxT?=
 =?utf-8?B?UUdubTBxVnF6UkJaamwvZ2o4STVnSGtsc2tUeVJtajYyUWlnWFhQUmZuOHhU?=
 =?utf-8?B?eFdDbnZUYkdPUnFPYlhqU0h5R2U0MDhUOXE4NzBmSXMya0Vzd1lSODUvQVNK?=
 =?utf-8?B?T3BnczFGYVB5NWk5NWNjeDY4LzBzalorWXZST29CalJoQ2pidVNSUXBIOWJK?=
 =?utf-8?B?ZkZxUk95KzFYQTcrNGVKRk5ZRmZDaVpGOFhHNktqTDRNeXNsNWdTeSszN2w4?=
 =?utf-8?B?Q3IvWVY0c2JnMG9lQzZRZE1mb3FJQ1lRaTF5Ym1JNTJneklRcFNmRFZMODJk?=
 =?utf-8?B?amtkQ0ZmVWEvUUQ5T0hRSzVzTGNUT2dxWTljR0JzUXBTcFg4TlpYVVEzRlRQ?=
 =?utf-8?B?akZsekZPck8xRVRsZ3g5bms1R0RQSFdTL1BISWVweTY3UzlkTW1aZ1ZHbjlq?=
 =?utf-8?B?MmRBYlhYTUFZQUlubFdnR2RMZDlVZGo2cEQ1dndTNCtYUjN4RVZWM1ptV3Fz?=
 =?utf-8?B?aHRtTzl1anF5Ti83ZWEyRW9VN2dYYlFxZU5FdW5XeDJpRG9uL1hMQStjb2tz?=
 =?utf-8?B?R1dLRmhVVi9nRy9ndmoxa1lVbm5GRWJWT1pESlE2c0doLzdjZ3RSTCsrZWEy?=
 =?utf-8?B?SUI0M3NGaEJiOU91bUNEcTR1NGNxblcraEhMeG5ORkNBRkIvQW5HZzVqdjFv?=
 =?utf-8?B?cURmcm9sY2YwQWpUUUc4SnlldWxQc2RPRWd1M3JJWmVpczNMcGZKZkZhL3lP?=
 =?utf-8?B?Vm9tdzNadkxvc1grUmZubFhxUkRROVk4WGsyVi9hVUJIc3FVRVJ0d3hQUVNG?=
 =?utf-8?B?bTRGaXlOYWJtam5XcUZMYkZXcWpKOE1keVNraFJ6TjlUUU9OR0NUN3Bhc0NR?=
 =?utf-8?B?bm5JYUF4OVVoUVRUWnRJekN0RjZ1Zi81QllRbEFFYWg4MDg1NlpJVjBIcEla?=
 =?utf-8?B?cXQ5bVpMcFgvZVRYTGJLbHJ2T3pLUklvSjZVNkVRaXVJVHJna2N5RmxVV1BL?=
 =?utf-8?B?eEM1Z201RXdRZUVGeTE1d05VQjBIMWpNQ0Y2SGNtWFFpNHNsKzFpUzhsdzdj?=
 =?utf-8?B?Z3dKbWh6ZkIwazRabHIyYkgrV1hvbytnZmZUdmQ2VVNxRlpzejRMeC9VaHdE?=
 =?utf-8?B?KzJabzFCblJpUStzWmhqNjJRK3RHdnlmN0NTaVJOeXVHQjQwM2ZSemh0c0h0?=
 =?utf-8?B?VjVzS3dFWFJsaS9QTlh5ckxjWTdzaTRzNnBIOUdwTkNtUVQrbnNmcDdtMXdQ?=
 =?utf-8?B?cVpZa0syd3N3RlhpaWE2TGpzQlBoWWFqcVZEYjBGN1pySi93dUJHK1FyNlV4?=
 =?utf-8?Q?s5nCJ5HukIlnXVvci+qQ72s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c9eaaf-d51f-47a7-0560-08d9e63161f5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 09:50:02.2744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR8LofVrSwakergg4Van9lYJxBUJvnU1m2w112kCVboqsLU12JSac1bEWiKALD3MLa8yp0q3AJ3oYg3INyrk0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4911
X-OriginatorOrg: citrix.com

On Wed, Feb 02, 2022 at 10:05:55AM +0100, Jan Beulich wrote:
> On 02.02.2022 09:44, Roger Pau Monné wrote:
> > On Tue, Feb 01, 2022 at 06:25:07PM +0200, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Oleksandr, can you please clarify authorship here? The rule of thumb is
> that From: matches ...
> 
> >> Shrink critical section in vpci_{read/write} as racing calls to
> >> vpci_{read,write}_hw() shouldn't be a problem. Those are just wrappers
> >> around pci_conf_{read,write} functions, and the required locking (in
> >> case of using the IO ports) is already taken care in pci_conf_{read,write}.
> >>
> >> Please note, that we anyways split 64bit writes into two 32bit ones
> >> without taking the lock for the whole duration of the access, so it is
> >> possible to see a partially updated state as a result of a 64bit write:
> >> the PCI(e) specification don't seem to specify whether the ECAM is allowed
> >> to split memory transactions into multiple Configuration Requests and
> >> whether those could then interleave with requests from a different CPU.
> >>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ... the first S-o-b, as these are expected to be in chronological
> order.
> 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'll take your unconstrained ack to indicate that you're also fine
> with this going in right away; see my reply to 0/4 as to the earlier
> two patches. Please let me know (soonish) if I shouldn't make this
> implication, but I shall wait with committing for clarification of
> the question further up anyway.

I think both vPCI patches in the series could go in when ready. They
are improvements on their own.

> > Would like to make sure whether Jan still have concerns about
> > splitting accesses though.
> 
> I continue to be a little concerned, but as long as the decision is
> taken consciously (and this is recorded in the description), which
> clearly is the case now, I have no objections. In the end well
> behaved OSes will suitably serialize accesses to config space anyway.
> 
> > Also since I'm the maintainer we need a Reviewed-by from someone else.
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm not sure this is strictly needed though: I'd generally consider
> a 2nd (later) S-o-b as valid stand-in for R-b, at least as long as
> the 2nd author doesn't scope-restrict their tag.
> 
> One further remark though: The resulting asymmetry of the locking
> (covering the "head" hw read but not the "tail" one) looks a little
> odd, but I will admit that I don't see a good way to restore symmetry.

I did realize about such asymmetry also, but I don't think it can be
solved.

Thanks, Roger.

