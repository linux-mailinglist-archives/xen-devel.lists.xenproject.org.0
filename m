Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F34923AC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 11:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258421.444995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lYS-0002by-3l; Tue, 18 Jan 2022 10:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258421.444995; Tue, 18 Jan 2022 10:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lYR-0002Zr-W8; Tue, 18 Jan 2022 10:17:32 +0000
Received: by outflank-mailman (input) for mailman id 258421;
 Tue, 18 Jan 2022 10:17:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pp88=SC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9lYP-0002Zl-S6
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 10:17:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d59f760a-7847-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 11:17:27 +0100 (CET)
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
X-Inumbo-ID: d59f760a-7847-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642501048;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QSO95uZ33vLAtqE8pOLwgTLAXlhRTAIR11A3x1gWmHI=;
  b=LEmxUUbi7mQY3P6A20QpJ41EY/JggcZ2ARChUMs+1ZSypGGhqEhhvMON
   sCiCovJMqVdLblp7PizAgqRkScu7YcTkghDh2ThsbsZAIIjK+oqag5Hkq
   AIpwQwdmSG5kZIGDwOS1wx+olo+zSBvtpc4jNfRUcRET5KeeDcW9t2kFO
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NM58ZcSebPjYaGAFHeHC8AHP7xiFqvCnXtdz0wsQBYaqNecmVoDPGUwDlDmD+/2s1bB/p3+cQa
 DwFnWtl+bXVp/SagXAG+qxJjdJH6uuYRlTzDse1pDsIDl3shy+3K8qCIsGQZP+W5GWZWHyBiT7
 ZKuYHsjzRG+r3FfqUmuFigGrfhuqXWVdjOtVWs0j/FEa6pi4g8k1dsun67nr5QXO4Es/qjRs59
 11OgJouQ7+qN0W/IqA6m7bUlP1hdGK7fY+WubVxq0+rd7aqeK8u2qr+DUUDfTIqufbnEeGq2hT
 C4YhMOS2ZPIBKUtjxotDwQa5
X-SBRS: 5.2
X-MesageID: 62200197
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wyTAl6kXm2akHGSM/6Iy9jfo5gxgIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJUGqFPPmKZ2qmcttwPdy08U1V7MPUz9UyS1c/pCFhESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29c42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PVmh6yzFzooBe7doehCSDVSVD9TAKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glq3JgWRKeBD
 yYfQT5ETUTnaDxzAXZJVI5im/j1hyP9KgQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsnjUua9kOLuwBqxC0xvXPzwzeGEU5QWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdbNi2+AswGzARN8wGCxFAbpU
 J8swZn20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mum0ieBY3bp1eJFcFh
 XM/XysLu/e/21PwPMdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dgFVfSNlVMGv+6S6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMdsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:Jav6XKCJ2pUyj0blHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62200197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRiTqo7371f/gz0A5jNYLf9ZMBwKlel/gATTrr1JPR8U12FIZ0jbmRzk+mF5h3rCsPGUagJ437DlxHXFoKk46ZivBfBsIE3F+J1yHsh8AS2PmXhPJSkHAoWbKdcSGPnkVQgZb7LGKZgpVwLSyFTQ8JoQXima3bMyWJROvtJ6IGvBiQi0Ts4Ck5D85TCv4QYDNpjcM9bVFhEuCGADZK+H6HQVyxJ82JAEkwIfdORWjIGsUOZ71Sh1P0vh/9vQxwZjmdF+a2AKVuQ3TWJH7IbBhTmT3o8iNKIy6/JluRVlKl83lAewO32YncDf21aI8tH1X+t6q9ZDN76y06y0uM6Xhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qw3wDa9wMxqYSpvwIpNB9KZvGJXGKQSUl51dLxhgRAM=;
 b=A4WmA40eQcHBdJqxyP1DhESSmWvUHdoyh6VmL5GU3p3Dudog8c9jUFMR5D6m5XPufTjndRb5Wh8wiApySfzdyRgG0VugRAqZ5GREPvqnhnqIPFKJDm/pXSJl7zEvxvQgM88z5X1kS3W8buNrwgxJVazakWv92A97IN12iR14vjRQq6uwM4KM9K1ZvZEBZbLIWoM8Plhnrk6/ymVxb/uZLVjxWyR7jPWgrBKOTzICh2l3h5Ad8dIm7BPRnF5EWrCvePccAHZQARHBfNVtEuNWzMLcNlGbMWNYJuzB8voqlODgrLJgl4UYs1FiCckKKMfagr8V8kZGzFBzmJjKV6N9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qw3wDa9wMxqYSpvwIpNB9KZvGJXGKQSUl51dLxhgRAM=;
 b=psajJ+BvoHCee7mVm7OST4M7HHT78lhidrZHMd2CR2EnivvmvsQOOAaIsK+FR/y1DZOVzoVNA+nWbCm93SHyS3nnM1BNX85xCzUH1z/ZVGi4rP2UkT6lZfIbSblU1fbXgbz6XamLD+lepyo8u2g4zT+TY9iQ50HFdPDwuYfiq6I=
Date: Tue, 18 Jan 2022 11:17:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/5] x86/mwait-idle: add SnowRidge C-state table
Message-ID: <YeaTqyt3ZoFTx/Ee@Air-de-Roger>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
 <b21c106b-b852-b4f0-efa9-fb5c465bfdac@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b21c106b-b852-b4f0-efa9-fb5c465bfdac@suse.com>
X-ClientProxiedBy: MR2P264CA0182.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::21)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 766a341b-0490-4623-64c0-08d9da6bb740
X-MS-TrafficTypeDiagnostic: SN6PR03MB3952:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3952AA5A20D2BFDA28E541948F589@SN6PR03MB3952.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vsLFzLF9K39Dy14bUQdJIxURgUy5aULThOp1hB++sd/hD4q6ZaN5bxswf4f6RdtkXlTIoJBGbZ66fOVjFScjri+FujdXkoCWjU+FNS2Gva+zP1J5CtlXq+CCcPEfNIqOs11V4X4J7Z+9wdNDLtLS3dT9nopO8/I5wvLZTtTs0wS/nZn1VwAYltnFWMtYV0eD8WyUXX50hlvIPY8zvcmUThIR/Zrj42Gy+EPZa+lpZxt/6v1qT5rWvUJheYIyRHTYUBh2d0JxPjOJ8T3IRVtnYF5KtKaA46jrSiseyIgjSkFNygfT5AzFEyRFJtefy6lYTB0Rks63HoKPWPHra/CpZjBO1R/iSkIGHo6og9v7OuINGvPZGpgtbxATYHyZ9+b43/FHctgWZbmFg0Z+49d41bekMISSK7ZFy9mOCzeVBwKOlTpzRF31g4Jq9aPi3YaQIkr8ZKQ+NAVuxxKWvVmo7vOsmHhM27R1csLolBPrY68ibLiwvqNZ7NjhnP22+AIV1450/zCHBg4FUviEIyXt0mK5ymk2ofq4Ww6FWgedUNnK/47Q/2AwaRSIgeWS76PSVWhz42XwQx/Jt6ffoXB7v6VapTAg9/Z/UJJIOL30y5s6NbQkR4lmWiYpS5QOX7ku7CvfgZgEqN20GVPUOxCl/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(82960400001)(33716001)(2906002)(86362001)(85182001)(186003)(54906003)(316002)(38100700002)(6486002)(8936002)(6916009)(26005)(6666004)(4326008)(8676002)(66556008)(5660300002)(66476007)(66946007)(6506007)(9686003)(508600001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0gxTjJrZEJsZTE2TGZnb3dTYTBOVWQrNGMxL1NEd1JjSktjRmVjNGVTc3lv?=
 =?utf-8?B?NCtxWG9NTUhGSWRUT1pwbmJ3WHNpQS9rSmJyZFlITC8wcXRoS2wrNTllTzlj?=
 =?utf-8?B?V0pRNkVPTGNzUnZCaDQxclNpNHpuaFBjcHVqVEJJWURLMmRIU2FkRUQ2bEh3?=
 =?utf-8?B?ekJIeGpCNDQ4dzZYODJORHl3Uk4yanF2YWdwaTJvR3kvTVo3Ujd1L2E1eUxl?=
 =?utf-8?B?M2FFakMyV3Bha2RJa3krS253Nys4RG9YM2NhNHJtYjZpeGh3VnV0SEIwUWtk?=
 =?utf-8?B?bS9taW9HVUFUbTFIUFpyL2NkYTEweDRXZnF1aVU0T0ozYkM2SUYrejhheHIr?=
 =?utf-8?B?cXFVc0l6NzkvM3FQZ0RSRW1VTmVPRXp6YTJDZVk2Y1VXdk0wUmVvZWpYdTRX?=
 =?utf-8?B?WlErbzNnMTVoYVZVZmlkeTRJdnNEeUplWEZnOEh0ajMwMG5pMjFYZitHTXZH?=
 =?utf-8?B?R2duMTY5b3pIMmRLdWNsS3J4UWJBWGxQeGdiWkZBR2RVRGRnMEV5dWNUcmIz?=
 =?utf-8?B?QXJHVVk2YnI4bHBwTUFIQVFLQWRjYWdKS0QrdTRNZ0Jpb0p6eldyWm54dmxU?=
 =?utf-8?B?d3BDQVd6NkpGNElZb2gyanVrU3VXeThzNE5mamNlTkVGM2Jua0xCa2RIbk5P?=
 =?utf-8?B?ZjZRd2ZhRXdISlNMZjU0djN2YW1YOVZlazByNUMrVXlQOWpSTXNydUJDVlg4?=
 =?utf-8?B?OUVDVXFOd3N3NitLL1dZenQwbURZNmIvZ2VDSmllclhZcEVET0UzMWJucEZI?=
 =?utf-8?B?YkpxZHNCZGRJZDlCWnFxc0RUYldCMERwT1VqdGEvUVBCNGVLQ1NNQ2pGWkFI?=
 =?utf-8?B?VVExZmJsbWhIb2pjQ0g3eDVhRHpHOUtNcVp2MXhLbUZ2RUIzTWs5cENZeXJm?=
 =?utf-8?B?WHBhWUpsVU1xSnVpU0E0N0luUEE1VUFYNm10NERiNmpBVUVuYnV6QWllZU5G?=
 =?utf-8?B?OWlkNEpzd0VHMWdNSUgrakpYb1F1dHF2WjdST2hzc084TWw2cFJHM0N4REV5?=
 =?utf-8?B?ejVYWEFKRExqeWZoc1kxcURKdHp1KzZ4OWg2ZTNQTmpPLzdHRGdrMTAwWUZv?=
 =?utf-8?B?di9VMytIbWlTYjQrNENiQitFOWhpUFRwM2xwbXo4TWFDd3pTbWtuNDl2UlJR?=
 =?utf-8?B?Ym5ZMjJINkRPVzlXTXpja04xazRlZFFSK01taktXSmJQTzFJUUw4S0tGeGZ0?=
 =?utf-8?B?UEQvMmxtQXU1NGNjVUorbE9tT1FnUmZaMFFoT0hIb1FqWUdVUGNOdXlXRUM1?=
 =?utf-8?B?a1VWV2R0cWc1ZERrbE5ZRUlJaEozOWpUMERTRDZBdDgxaVgrQURlUjJXTmM4?=
 =?utf-8?B?K3ViViswWHAyblM0UElPdUlBL2VleU53UDlnbmhwOUlPOUsxN0o2cDhzNHdG?=
 =?utf-8?B?SDZkTlpadGdlZjdacEh2SmJvZThsSFI5T1YxZkpDd1JSczZZTnJSL0Y3aEwr?=
 =?utf-8?B?WkdjVXdsUEpxZzV6b29iYXFjNWVXTVlUOGFrKy9tN0JIYk8yRTFKcVVGbms2?=
 =?utf-8?B?NzZ6a3pmamM2REJoams1M3B3MExEbHVWRXMzN0E0M2hTNC9YajR6TGorc2ln?=
 =?utf-8?B?eGx4M2NVbU5NU1J1cDZNTEczREpoOUd5U3YrS3NzMGJ6R1FiRk41MytPOHI5?=
 =?utf-8?B?cW9qTlNaSURtcEsvVE1ha0VxOWZmaHJzMXNmSE1TbG5pSUdrQW9lMkJjVnF6?=
 =?utf-8?B?bzdsT3BKZjRqUHg0MnlpVXM1Z25sa3lIaWFhNkpLeXpSRFVOZ2l5YXUvclNP?=
 =?utf-8?B?YVF3MW96Wk52UjM2TXRxUnU0QTFGcklObnRhb0JOb1VsL3M0NmxBOFlQSXY4?=
 =?utf-8?B?N3NwYUdTQmNwRW43UzNSRERIWE5zVUFuMmVjeXFibGhjR3RraVRBdWRZZEFD?=
 =?utf-8?B?ekF5czI3Vi9UWHpEQUdmSXFYRnlIMTh5QmZ0VW5acVBLVlAyYi9NNUFRbG80?=
 =?utf-8?B?MlFZdUFjWG1nY21FWnp6Y1F5T3c2QmVHZzRCTnF2dGdJRzBRUk5ZOTBpVnJ4?=
 =?utf-8?B?YXBTSndjdXhXKzhpaVMwNG5DNlFQUDJ2WXNZaG41TUZySzhyUDVsOHRCR2lQ?=
 =?utf-8?B?MTVRamx0QW1ZUTliUERFT1pxczdQNzlvdGYzdDZtVXhaNWFEMkNWeTJPdkJC?=
 =?utf-8?B?eUV4c21hdUd1am9peWd1L1BEd0NTOUxQQVJXVlJmZUZqNnNKN2JSeVluLzE5?=
 =?utf-8?Q?WbrtOSJ/6gbgKOyF0KnNd2o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 766a341b-0490-4623-64c0-08d9da6bb740
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:17:22.2786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rcgFm9lZ9C++vTUwnBtdAksH2kprMl9+emNo1YlkyVx3Yn5XBQKTMW6+yqi8kSFP1iW42FZaDKudOeyNcQutA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3952
X-OriginatorOrg: citrix.com

On Mon, Sep 06, 2021 at 03:00:46PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Add C-state table for the SnowRidge SoC which is found on Intel Jacobsville
> platforms.
> 
> The following has been changed.
> 
>  1. C1E latency changed from 10us to 15us. It was measured using the
>     open source "wult" tool (the "nic" method, 15us is the 99.99th
>     percentile).
> 
>  2. C1E power break even changed from 20us to 25us, which may result
>     in less C1E residency in some workloads.
> 
>  3. C6 latency changed from 50us to 130us. Measured the same way as C1E.
> 
> The C6 C-state is supported only by some SnowRidge revisions, so add a C-state
> table commentary about this.
> 
> On SnowRidge, C6 support is enumerated via the usual mechanism: "mwait" leaf of
> the "cpuid" instruction. The 'intel_idle' driver does check this leaf, so even
> though C6 is present in the table, the driver will only use it if the CPU does
> support it.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> [Linux commit: 9cf93f056f783f986c19f40d5304d1bcffa0fc0d]
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -742,6 +742,32 @@ static const struct cpuidle_state dnv_cs
>  	{}
>  };
>  
> +/*
> + * Note, depending on HW and FW revision, SnowRidge SoC may or may not support
> + * C6, and this is indicated in the CPUID mwait leaf.
> + */
> +static const struct cpuidle_state snr_cstates[] = {
> +	{
> +		.name = "C1",

We usually use names like "C1-SNR" or similar in other cpuidle_state
structs. Is using plain "C1" intentional here?

> +		.flags = MWAIT2flg(0x00),
> +		.exit_latency = 2,
> +		.target_residency = 2,
> +	},
> +	{
> +		.name = "C1E",
> +		.flags = MWAIT2flg(0x01),
> +		.exit_latency = 15,
> +		.target_residency = 25,
> +	},
> +	{
> +		.name = "C6",
> +		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.exit_latency = 130,
> +		.target_residency = 500,
> +	},
> +	{}
> +};
> +
>  static void mwait_idle(void)
>  {
>  	unsigned int cpu = smp_processor_id();
> @@ -954,6 +980,11 @@ static const struct idle_cpu idle_cpu_dn
>  	.disable_promotion_to_c1e = 1,
>  };
>  
> +static const struct idle_cpu idle_cpu_snr = {
> +	.state_table = snr_cstates,
> +	.disable_promotion_to_c1e = true,

This likely wants to be 1 because the type is bool_t.

Thanks, Roger.

