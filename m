Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11D84A7088
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 13:13:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264101.457079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFEVk-0007CE-64; Wed, 02 Feb 2022 12:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264101.457079; Wed, 02 Feb 2022 12:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFEVk-0007AN-2o; Wed, 02 Feb 2022 12:13:20 +0000
Received: by outflank-mailman (input) for mailman id 264101;
 Wed, 02 Feb 2022 12:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFEVi-0007AH-AO
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 12:13:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f7fd35e-8421-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 13:13:16 +0100 (CET)
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
X-Inumbo-ID: 7f7fd35e-8421-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643803996;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5VSuoYYIRLnkthysacxmvjpKuvKYPQAjYtm5ea8sqoY=;
  b=NdA98NMD9woS614NldH8+cZ8ePKT/pxMyjvXZOsrKNSGpkXZ0GG8k48B
   D5MmpqmqQYFhgVMT8ZeBrpAkBL6EuC8b8yewsa49gSFwxbA277cUi/E90
   6WvTSdarpSeq4ddFuNRAcQl3vM5lv3MYSv9vKphkGkHflzjTQz3npSq3U
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NutfG0mFnQDs/QMpkKUbO/t0aahJKnxr453SVZ4IoVYmkUQsqT9CTzC0KWU30NViCNHKHFWDtJ
 HQkyBBYep9uk2Pq4TKwKytiHdNVHdd9Rtw4r1tjMPC9c8umaB4pNCm27u5H9dCVoKyVPCVP33R
 kFJ6UseTiD3UhrsQhS79rSOiDw+LeoYA9WVIpUIaUkRgTwFBsI5pa6EncLFEXSupiaICO4sTRM
 I+/XC7oIJ/t4v9ZWsx9Im0w9WHrS/ITQ8261hiDbkL5KwfDukScFnZnm67VgA3nq85nLWbd11m
 LC2E7kZ9/1e34iRZhQ2SY2bQ
X-SBRS: 5.2
X-MesageID: 63719973
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:y+pM9KqnHatkz2GuNsUJIfxPNJ9eBmKQYhIvgKrLsJaIsI4StFCzt
 garIBmDa6mCN2P8eNtwO4rkpBhT65GDztYwSQdspSg2FyJE9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24DjW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYPoW0QrOqzUosMmXiIBSS15I/Fe+KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4VQq+PN
 pVCAdZpREnaRC9/awtINMIdg/eSj0bjcWUEk3vA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt6nuxgsffkCW9X5gdfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbiy6bG2wFQzhpeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9MjcQJi0ATBM/xOLum9hpghXREs5jD/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxasYdO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb/LOi8AxkkfS+F1/ronheyO
 CfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlPco303NB/Nhj69+KTJrU3YE
 czDGftA8F5AUfg3pNZIb7t1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3eLmaZOcwFiBSVrVPje9p0MHsbec1UOJY3UI6KLqV/XU9Y7z/09eyah1
 izVZ3K0P3Kk1CCedFXXNis+AF4tNL4mxU8G0eUXFQ/A81AoYJq17bdZcJ0yfLI98/dkw+IyR
 P4AE/hsyNwWItge0zhCP5T7sqJ4cxGn2VCHMya/OWBtdJ98XQ3ZvNTje1K3piUJCyO2s+o4o
 qGhiVyHEcZSGVw6AZaEcu+rwnOwoWMZxLB4UXzXL4QBY07r6oVrdXD816dlP8EWJBzf7TKGz
 ALKUwwArOzArtZtotnEjKyJtamzFO56EhYIFmXX9+/uZyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64clSuRl16Mz4dfrtoR29AU8ESWZdUmvB5NhPmKCgZtFuJpSy+ILogCxQ
 E+OpIVXYO3bJMP/HVcNDwM5deDfh+oMkzzf4PlpckX34Ch7oOiOXUlIZkTejSVcKP1+MZ8/w
 Pdns8kTslTthh0vO9eAryZV62XTcSBQD/R57skXUN3xlw4m6lBeepiNWCb57aaGZ8hILkR3c
 CSfg7DPhugEy0fPG5bp+aMhAQaJaUwyhS13
IronPort-HdrOrdr: A9a23:V3dF+K2Ex4KiutrO4GU8tAqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W1Dk1frsA6ciYnV9MNOA4/e7rFNoXse2O7DIvAGyWvKEk4U0i92aIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.88,336,1635220800"; 
   d="scan'208";a="63719973"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9q+5JgozLD0V+8Vqc2X2ITwCtfBGz/GpTBy/8sJx1ThtzLN7I/3KaKn74/AfW+md1u7RmgFyshdxSLVIglgSqe69+HeZ8+D8/KSCGNxHre+8USwpATdghUl1e3xpiuzW+XBvWDCcM5QM6Vsx2HzxxR9mYHzl2THtYinct6nLqoARCRvzRK9GFsIATufx2vx19uMjGeLzOaWeNxVN4eyxqOpLprNAOQXeTykRXpdli/ojz/U/XJ83AILYmy+/BszH5qwz7CS5ztT0JI/Mkudgnrch4poSRSCxz3OhXv9R5RelzDLgl2ChAxGOOR5iIMKfrYunSft5HVyaw/VyF+oCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bH0J20QjsZiQMz+fLCrHrEdzdiz/5UYpEWCXb66QQYI=;
 b=PzgWFh25zV0LKhoJbf4uS+xtjSptqVFfcJeB3CcYB+Z+KCiThU3pzB5ZrIfWe3CrbeoMSuwdxZMgLmM6yw6WXph0D0sSjDHvAgfm9yYMJhSHi58ybQq9b4MquIZzOFYaQMz7dCy8vRGHFwW2ZNGbfYJ7z1MauIhDq5SqQYhBuH+SX+ElznGymNpVB78S0A5q91/fL5ApTp5Iq2mDJws5rTR+YVnixx2f6i6vbqpqPP9j0L89QcMXD+H1sKXrCE+Syy5Q+fuwgkIA/BHXm5e0OkRStAODqSRK8s3oq0PVVU+XArmFLt7e/UBn3ufKkPhpkxXPp1H84+ZFZMVSOSpKOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH0J20QjsZiQMz+fLCrHrEdzdiz/5UYpEWCXb66QQYI=;
 b=LPIDKeWpp7dCkCopcwRjWJ/4X98ZTaV9ePUSScopPnFRkCixe3Kfx9mYoi1Jhun9PHR5sMX+/lb8X4q6HNCrJ2R+Zr2r3xamw0peYolxJKCgihqkIktYRGvu29DYVzvwCVO+VCcor3a2KB6iFyeMa/QMgQmk8ExZvjKtrvdCbM8=
Date: Wed, 2 Feb 2022 13:13:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen/pci: detect when BARs are not suitably positioned
Message-ID: <Yfp1Unn9rIrwf78I@Air-de-Roger>
References: <20220201124551.2392-1-roger.pau@citrix.com>
 <59685ca1-0587-a975-bf5b-56058b650c3a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <59685ca1-0587-a975-bf5b-56058b650c3a@suse.com>
X-ClientProxiedBy: LO4P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e116e578-5294-44ef-e027-08d9e645619d
X-MS-TrafficTypeDiagnostic: BL1PR03MB6133:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB61335ED11C944E2852B765408F279@BL1PR03MB6133.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4LHKR45b3a99/+JyEEN8RESvHW7Rghp/MysPVSbiXoqrWNo2S2xQkvlu/O/KMwqMp+A9O4lJb0L8ANfrfL/5Yqsf6uLvVAyDIhPGNJ9bxUZNOI387Q1Kmh6Co+os5Zvf58dW2W6deB+fRyL6CnOhSmkPpFo7Tikimg7t/N3p2GhLt/MbLXGelo4in+PTsOj48hYONDDo9K592UxDEeOsVqR8m/His5NeDfJmKULCqUm0NKM329NHP2wEnpihRyTrDHSqAjuazfAmje1+x9BVLZvLtbo6xG1g4zW9gwAHvDX3Cqdmzf4wWz3/d883X/u+7lLhvxQupEwwBBcKdQ0EdoWbvR7IkbxvLjr2NmuRz/ghmBH5SKL1SGhXwIu9Pj4Lm3Rsv5XWvAo0I0xN9Ftuf8bVJiFllHtl1mYgsPX2iiRZMbBafK7ZTVekTOUyD3gmFS4tpqjexLE1cQk7+j17mnmPK4LcJm4LYUmRHovAo7mmTEFoOBxNJsfSDbnDCX8uugsiMaUf4wOkN2cUgQD9K18rr3pWV21digF/Imynpa/qSl5NonsIYqVbs3876Rzs+sZlOs5ioT1O6OzMksjrfdjKBWjBexrha+zIm5TVRyKFfRSp+X0UaNbEJ9M8DaLS1ojZL0JsLk+EeeLT330dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66556008)(66476007)(8936002)(8676002)(54906003)(26005)(186003)(4326008)(6486002)(6916009)(33716001)(85182001)(86362001)(508600001)(66946007)(38100700002)(2906002)(53546011)(316002)(6506007)(6512007)(6666004)(9686003)(82960400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlBZSWJOMkV0Rnk1eHUxQ3Uwc1U3R3ZQQ2FuSEsySGQxVVM2Y1BSMUNBWmFI?=
 =?utf-8?B?eVVqQmh6eFFPaFFWdFRDa2JEVm14WWtWWEZxQUZLam0xNEJJd1B6Z0loZGtT?=
 =?utf-8?B?Y1hKSzc3L05ZN2JmWU9lSDFhQUVUMk0xUjlZRjB2NFhydjFoS0VyVWFsNG1B?=
 =?utf-8?B?RzJHRitTYVg2aktxYmRUZWh5OTJ2eWVGNU9CNHo2ODFFRS9FYk5HekVKcHAr?=
 =?utf-8?B?aWFpVUdESmp4dFZXajR1RnVlb0hpVEZTN09vTjFQZEpOcTlmblBMZ3BQZy9S?=
 =?utf-8?B?SzJqZGFpU0NMdVF5MFlaWkwyY0FPdlZUV0hNcVJHTDFyL3BoM0g4bmUvZUIx?=
 =?utf-8?B?ZzVYa2JjeUhNTlNXaWxzUSswQzhJVUUwUjg2MHIyQmw2bVp6Z0VncEhORHB1?=
 =?utf-8?B?YmwzOXYrazZMY0x2VFV3VTNUemtXTURoRDJaZXUyU1h5YmFrb1JyUW1IUEQy?=
 =?utf-8?B?a29pV3pnMzJ3T3dxaDJNSGs3Ky91aVpZQ3cxQ09RNzl1MHFId3pLb2p5a255?=
 =?utf-8?B?SVZpamF0Y0xvMUIyMVUxTXdka3RUWWRZVmJUQnllTDhhQ2d6N2xtOVFuMjJj?=
 =?utf-8?B?RHlwTDhCK0dacDhYYzhFSllPUGlkTXhlSzZLQlJHQW1Fa212aHV1RWUrMUdX?=
 =?utf-8?B?eml2UXZyTFZBVVNQUFgzZVpPU3ZMSEIyN1RtUnQ1M2g0ZUh5VU16bG9aQzVY?=
 =?utf-8?B?WStoV1R4M1lvYWtNVGg5eUttZlFPd1BkNkYwMGExOUo0cHBTMU5WcnYremVW?=
 =?utf-8?B?YnhMMDZpeHF3akVlWjI4cGo0NzUzZ3JiUjJGeXJIYzVGWldET2NZWklPR1Bo?=
 =?utf-8?B?WDMvSmZPR09Ec28xZDdPWTlaMmtRelpRVTQ1L1lIZlJmU2NDTlVzcDZlMzNo?=
 =?utf-8?B?Q1hBN2FyRnpBSkJEVjh6UEpEamtNZjdJeE5tZzdDQ3BtME5ZcHpVSklNbm1Z?=
 =?utf-8?B?NW1FT1dIdW9RZ0h3eFBqekNxby9zOUl0ajRBT2NIN3dMNGdFaHd1ZVBvYVRi?=
 =?utf-8?B?N2RUOUFoMzBsVjFyRjJ3ZUMxQnhQTzdabnJHRm9QUDNPVCtFQjJiYjk1NmRp?=
 =?utf-8?B?TnNxNysxSklFRXBzZmlWZmhweUVqZ2pPbnFDU3VEWHJoT2ZrOHg4cG95Uy9U?=
 =?utf-8?B?dVplbGdsRHdMZnFwUDFhZ0xtZ1dDL241ekpBdk9RY0ZBMGp1ZkpheVBMZFY2?=
 =?utf-8?B?Q0JxWnRqMG5uZXZRVEM0MEF6VThHQjBuZ2VnMG4zN1RHbVFDYmJHWjRmT3Ba?=
 =?utf-8?B?enFWQUJVSmFUUlRXQ09KajNJY3dYM01oVU8ySlB4aS94UlJmUHU4NStmRlBs?=
 =?utf-8?B?TVdrMEVXQXpDNUo4US9LNDlMcHRKbTNDWlZZY3Q4ZEFsVnRoVFBjZmxoZ2p1?=
 =?utf-8?B?N3ZDdkdoS25JelZub3hpcVFvYVM4M09FSThGblRvK0ZEWjhWUHJPaWJpNkdM?=
 =?utf-8?B?bnNCZkdmUjVwZWJXRDJ0WVFyVWFVMEI4RmVEbHhVRFY5ZHc2dUdJbmU4TnNV?=
 =?utf-8?B?aU01b2NndUZkRlZ3S3RmRTZBVU9jYmc0a0hXQUFuSW5COU5Hcno0QklkcWdh?=
 =?utf-8?B?aElueUNXUGp4eEdQWkJITDA3bEZCQVVIdXl2SkluQnliRjF1ZnBob3ROMlB4?=
 =?utf-8?B?aEVSOVFWS0QyejhSdlo5SUlpdFg2Q0tRZWlxcEZleW01LzNKZ1pJSXZwQU02?=
 =?utf-8?B?aHROY3JTMTV5cjIyczBhMkZEZGZIUXBjUWhFZDFPdU9LYXhOWkpPemlqWkdZ?=
 =?utf-8?B?T2VLT0tMZTQ0amtWa2FMU0Ztbi9FSTZOb1JJTG1XcVhPeGdjOHdRWGdBRyts?=
 =?utf-8?B?NGlMUDJWNnF5ck4yVFpFcEc2RThOT2xWZzh2b0NwUFBSczFLWW9HMGRMN3Y4?=
 =?utf-8?B?Rjk1Uy9XMC9oUFh6MFVxSmM3VlpnYnQwNTQweDFMaVQ1NEVraHFSYWhBZW9u?=
 =?utf-8?B?NG5XbmF0OVRtUHpXS1VZM05UUE1ldnRIWUpPUktMZlMyR0RJNVJwaFg3aWQx?=
 =?utf-8?B?aktIdkNFMlF6Nzh2N1BGUGlhUHl4Z0VvTzJsQUJ2alJvczFrempNMTVqYkNG?=
 =?utf-8?B?UVJsZ1cvREVVcWRJNXgzNE8xVkhQR2lsa0FQUExTQ0V2Z0RUckx0TEJUZ1hM?=
 =?utf-8?B?U1lpZnRUZlpYRWp0b29sMnNjUWFFMDZXc3NoOWs0OE5UczRFY2d4bkRxYWVm?=
 =?utf-8?Q?rTJHTO6m31tOgtp0cK41uNI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e116e578-5294-44ef-e027-08d9e645619d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 12:13:11.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPSo+FiZwxrs/woZXiCeX3zdkGriEwIzkGGJ7rWRtK5vg0lIofVxuoSvY4/Dl/CLYoIpErpu6Ykndw0YSCgAfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6133
X-OriginatorOrg: citrix.com

On Wed, Feb 02, 2022 at 10:42:22AM +0100, Jan Beulich wrote:
> On 01.02.2022 13:45, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
> >      return (page_get_owner(page) == dom_io);
> >  }
> >  
> > +bool is_memory_hole(unsigned long start, unsigned long end)
> > +{
> > +    unsigned int i;
> > +
> > +    for ( i = 0; i < e820.nr_map; i++ )
> > +    {
> > +        const struct e820entry *entry = &e820.map[i];
> > +
> > +        /* Do not allow overlaps with any memory range. */
> > +        if ( start < PFN_DOWN(entry->addr + entry->size) &&
> > +             PFN_DOWN(entry->addr) <= end )
> > +            return false;
> > +    }
> > +
> > +    return true;
> > +}
> 
> Doesn't the left side of the && need to use PFN_UP()?

Hm, I had is using PFN_UP before and switched to PFN_DOWN for some
weird reasoning.

> 
> I also think it would help if a brief comment ahead of the
> function said that the range is inclusive. Otherwise the use
> of < and >= gives the impression of something being wrong.
> Then again it may be better to switch to <= anyway, as I
> think you want to avoid possible zero-size regions (at which
> point subtracting 1 for using <= is going to be valid).

Right, so that would end up being:

start <= PFN_DOWN(entry->addr + entry->size - 1) &&

Rejecting entries with size == 0 beforehand.

> Finally I wonder whether the function parameters wouldn't
> better be named e.g. spfn and epfn, but maybe their units can
> be inferred from their types being unsigned long (which,
> however, would build on the assumption that we use appropriate
> types everywhere).

I guess I should switch to using mfn_t for the types and convert them
locally to unsigned long for the comparisons.

> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -554,6 +554,8 @@ int __must_check steal_page(struct domain *d, struct page_info *page,
> >  int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
> >  /* Returns the page type(s). */
> >  unsigned int page_get_ram_type(mfn_t mfn);
> > +/* Check if a range falls into a hole in the memory map. */
> > +bool is_memory_hole(paddr_t start, uint64_t size);
> 
> While resolving to the same type, these now also want to be
> "unsigned long".

Doh, yes, sorry. Will convert them to mfn_t if we agree on that.

Thanks, Roger.

