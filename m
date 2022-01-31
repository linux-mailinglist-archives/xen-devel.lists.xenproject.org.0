Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D24A3F98
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 10:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262880.455306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETRF-0007oP-Gj; Mon, 31 Jan 2022 09:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262880.455306; Mon, 31 Jan 2022 09:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETRF-0007lx-Cx; Mon, 31 Jan 2022 09:57:33 +0000
Received: by outflank-mailman (input) for mailman id 262880;
 Mon, 31 Jan 2022 09:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nETRE-0007lo-LY
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 09:57:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 337d4e97-827c-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 10:57:31 +0100 (CET)
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
X-Inumbo-ID: 337d4e97-827c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643623051;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NlyMunx5978ZnGMiti2But+4VZZz3njJV6RTQBjCOIU=;
  b=ZjWHaEsZdHKrQ1XmL7RXZpvofzf74fawrATDvRICdIN01N3soZQlaJs/
   hkiepJ0+9j51ELqzzJTGjk1w6vi65VCRZN0vsX+r1UNKRUjmuOERxXzEK
   0eKWTC6Di2EafwZa1lu6UrjZinmMdAIAqA/VrAXAM86l3yoWqlnoKhaoJ
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l5s4xwbYLz6a/CEmXVpGDugQuaaovlE3joxvHrCvs3Qt+9kNLthzCSBWkDnvZdIYwwWwmpd9YV
 Up2teUFm0nwW1ee/cfx8taNZBBFamWW+3pH5566Q650vmmpa5DV8+Qt5LrvKUERwkHvHs6IseC
 kbJo9+ZKndIaNAZTvw+2+b3anslG6oz0KmeT0N0qNlcg2G5JFpOTn2AqiPwTYvHdylDeCMQjdL
 Nb40G3G06z/Nojexw9Qi3/hHdZx6XN480jy+y6Se/Huh0qPhYgZoU8+4wTS8GZf2hzgYVz8cO4
 RfLA680qUZIA118sldPiGwwp
X-SBRS: 5.2
X-MesageID: 63026794
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NzBHs6MpA+5pMq3vrR3vkcFynXyQoLVcMsEvi/4bfWQNrUokgTQCy
 2YWWDjQb/jeM2vwLd9/PY7kpB4H75HdndNgGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Ek6w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo3LVkNkr0
 OUQj6aPcSN5PJOTu94NWQYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uRvYUGg2Zs7ixINebUT
 ZI4dAAoVh7BQhFeNF5UBcwO3/j90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc8pWN
 kg86ico668o+ySDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL84QyUG2wFRT5pc8E9uYk9QjlC/
 mGOm9TlFDl+qoq/QHiW9qqXhT6qMC1TJmgHDQcGUA8E7t/LsIw1yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uTugzIimi0lsXzdDENwlXVYD2G1BNze9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yP7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiJNLKigbArLWdrGR2Cg2bKhQgBd2B3yckC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bFOS7KEedbYQffBgzc0E9iiF+Pm
 zq4H5DSoyizrcWkOnWHmWLtBQ1iwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNy4/AJuyA8cXhS9rbEQEYAfzs1B+MNnH0UvqX8ZtFVXR3LY9nacco
 jhsU5joP8mjvRyepWxFM8Gh/dMzHPlp7CrXVxeYjPEEV8cIbyTC+8P+fxup8y8LDyGtstA5r
 aHm3QTeKafvjSw+ZCoPQP7wnV63o1YHn+d+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvtMkQbZmxK4z/fX1oLpewlg2FXnHdQ3zWLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd8N7aNz/AZnDXW/M8ZGkSi6X8l5qeDXGVTIwKI1H5XIoxqPd532
 uwmosMXtVCy00J4LtacgylI3G2QNXhcAb4/v5QXDYK32AomzlZOPc7VBiPsuczdbtxNNg8hI
 yOOhbqEjLNZnxKQf302HHnL/OxcmZVR50wakA5cfwyEyojfm/s6/BxN6jBmHA1awyJO3/93J
 mU2ZVZ+Ir+D/mswicVON4x299qt2PFNFpTN9mY0
IronPort-HdrOrdr: A9a23:t5XWmK4D8ViiOkCq7wPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63026794"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+YD7f+Kfl6xxAl6sqD9oi2SNPU/4ek0CJ/hdrVve/Z3ue59sY03PvCAKZ0w8KkCobJNSbMwGweno9H566qL5RiCKnnNqeZYJW5loH0LW8+0TEjDd+FODioOxJsKOw7kXb4VwUJRTqC7/KDEcGg8ry/sO1rXgqbc59ibb7Vabj4K732/2B9cn1/MW/KbKdvHMzGuu7L8Q+NiX7UHN1TpM8OW7KeBqHeJsACJmkiRVnPjTSS4CIhzJWN2TxqJ9gfp5pH41Qltp11BQXBK4Jl8j4uJmUhn17r8B4Ycy+0bJK3+iaW9S2vECxUclOso79NGk4ScJ+46iuGKircRadYGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMwOYletfg1emNdwRApZqU68CzXOXzlVvuXR8NTHqBQ=;
 b=Pn3LvlT66Rq/xvbn09TysfMY4kyspQEOpsjAmPHFckt9yKx/XERYjfbMhQ40pTVVJxEvdK+Czd60yU+w7yv6d8lVc9KBNG6iG4cbc7rISJcjZUrHP7UbUnDHRck0WN8WBPFAf5SPUnp7chfG0iKgG19nOH0Z8Qk7iaXZ3HO1YfoJCLyqxNl/HBb7v4RNVfpas4uI3AeDRd5cxQhY0w+Bn+SjgjvXPRTIEmrEAy0r0lhpqAm4u/2MdEs0gE4snS2VS7jVELaLh0UqvUMBGFz1hQ/IXhxn0JaJO7grUaaKJLoM6dpPzAdKv+CXgCyp+7LuM5GW7e1ejO5xoIUXufnZhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMwOYletfg1emNdwRApZqU68CzXOXzlVvuXR8NTHqBQ=;
 b=q9xszWnmG1+06DjOvifiJceNWQBHuvK0UG0rCeZLvGOAy+o2AgJXkZiDnNci0RjMpVtQxMlU4GFeS3yoLnP2yZS9A4B7rtdTqCgqpXm/k075mtvHD54v4CI9vcXAOS9Zq80B1xsImQLPU9fqv7nrwokkBCDxApxu6zam1HXl6BA=
Date: Mon, 31 Jan 2022 10:57:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Message-ID: <YfeygYAp6FjXYGa4@Air-de-Roger>
References: <20220126122648.52275-1-roger.pau@citrix.com>
 <8537763d-2601-4092-f70f-1abbdd0a211f@suse.com>
 <YfFshcEanUtXUlK3@Air-de-Roger>
 <c7be91c7-6010-1146-b6fb-92d4793ad49b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7be91c7-6010-1146-b6fb-92d4793ad49b@suse.com>
X-ClientProxiedBy: LO4P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c83ff271-aea1-40a5-2f4a-08d9e4a0153e
X-MS-TrafficTypeDiagnostic: BYAPR03MB4181:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB41815E32E89B13001CD4AB8A8F259@BYAPR03MB4181.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l0EEa1OVTWQCOzfvTtcRzM8igympqQG4Va5YFMnBlV0CTvc2QOSPuqwafF5Eq7WL8ka/2tjgtfMtVMwqPiP9LdeYgMzZmyTI3HJugW8UCrvWYUTVBEdGsqcwbCY7Nt54FIOOOAlgyoMkDCRybsnqOQNTPsjSeRUUtA/c2j3mZ7ay/O75lwWy58ho7bXkC6CysEVLFdUr3qOLqW7nl41dXREkbjv/bQAIdEmGnfzNtjyJWKjxKNhvQYCWXITCOrAKGP0FXnbyauyNS7X+6B2Uw1G5pKN0VmdP2srumslv97jYRgFE3yXjuXKoucRrb8ogiPbhM03UetxkwUYYuwSeqQMnMZ9fL62Ap4kDcDTvOzm9bWnY7E+UigaKso4dC1JcTkzJlcnUC6vmpP/1kVv6nY9CK9MFIC2ippiKYzjsqSWCfR7ErgF7V8cqm9xxqMj+PFy5He78fk4Owr+lRdQ7/TUcBp5H41+78sUPAcaEVDolaiEJBMBhExrycxT3TQ0Nrc0a7VDtMBU6/LVvYAV6+HDRLRVJRPyPAZuETwAFsRIA2hBzFrB7FFJQNP9snnEQ8jPc9NJm9qTetTyy2vL1GwBDIbHfoHFhHlT3sEaxmu/8DgcpAdy6qRkjUXAZIJn4hhn4X76IXacJmkQ/BRIRwQ/tPTcqGiTU0jRhEyETYI4q7N6y/chkt3vgndwiy+PUs/2AA29ncMCblkUHhVrcfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(8676002)(66946007)(66556008)(66476007)(4326008)(85182001)(82960400001)(53546011)(6486002)(6666004)(38100700002)(6506007)(6916009)(5660300002)(86362001)(33716001)(316002)(508600001)(6512007)(9686003)(54906003)(2906002)(186003)(26005)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE1RQ0JKOVVDRkxkcjZ5TGZWM1JjcENzRjlJT2dzc2xRdmlzS1hBeW80Sk9P?=
 =?utf-8?B?bGc5VWRVeWZFeE5VN282N2NUa0djV2NBZGtyOTZvM2VvTnljUWoyMXFFQkp3?=
 =?utf-8?B?WWVwNlBlQ0FXbS94TktlQlFpRzVVUmdOVnFrUEZlRXpBSW5JSVdJdG1ybjJq?=
 =?utf-8?B?Q2ZDSUQ1ZG1tU3gvaE1qeEhhQ0pRSFFKM0hKeHFKSTczeW81UTI1WGVKMmhX?=
 =?utf-8?B?UVprcTJPS2tWK1NKVWpsMzRoMzlnUSsybUhvMmlCZ2ZVZG9RVlVQenRnYnJE?=
 =?utf-8?B?TGlsWTBjUEVBa3dPMTk2Ym95Z0ZXK3pIMEhmNDRYSDV2NlUzRXhSOXNPcUg0?=
 =?utf-8?B?bFlNMVlWcFNoQzBLU3hDcUs2WTlMWE5xTnFCdFJ3eTJhQXZwcUpqb05ONG5D?=
 =?utf-8?B?cU9OaVlLVmhldUNJamFlVTMwU0c3R01zeFZrbHhMeTBQR1pyYVFhYXRzVHB0?=
 =?utf-8?B?Q284STdPb21KT0dnNVBubnF1d3J3ampBTmRJRnRZbTN5UERyQno5ZHNWSzZw?=
 =?utf-8?B?K3hLM0Z0enRrbFhjQ2JUV3pYemRXS3phc2Z4c2VyMlhqOEZHbndXV2k0OHNW?=
 =?utf-8?B?NmNQTGxGeTJvMzZVRFh1dnJTR3lUL212Rm1SK1BJRGlYSjRZZDhaN3ErL3FB?=
 =?utf-8?B?NENFdWVmanUwQWZYQUk1RExuMDBiMC8yM3RyMVhNTndmS3FBRUNaVEFSZEdJ?=
 =?utf-8?B?cTZWRDdOdU1SWmlic3BnYmo2bXVaZTdEMzU3WTRaNUREVHBuUGxmNjI3U0E3?=
 =?utf-8?B?bmZ1eSs0c0FCSG9wSHlmQm9KOHpJOWFla2FMeW0xdUZ4ZmVlQ2xMTkl1aTUv?=
 =?utf-8?B?dlg5YkpFVjRtdVllY0ZFMDFMYnlGeFQranZLcEVVeUg4YTZZMjQ2QnkvdlBt?=
 =?utf-8?B?ajZkbzgvVU1POE1WencxRTVndWs0OHFraXRFZWNMQll1VEllRUtuMTlKS3A5?=
 =?utf-8?B?OXczWWtTNHlYTnhLMUpYNDR5aTEwbzFabm45b3RkOEVWWXluN3B0a2JrSkJo?=
 =?utf-8?B?LzNFb2htN0ZIZmFTTmpLMUxRcHFEZE00MGw5Z1llYjFNbCtycXFYbkxzOSt0?=
 =?utf-8?B?QWdibGZOa2ROQUV4ZWhoa1RDQ0xFMjg2cFRzU0Jzc2gvZm94U1pYdmJadkpy?=
 =?utf-8?B?bGlpdG5saHZaV0RESGk0NmdRU1EyaU9SdlE3aGs2Sy8wcS9hSVZlN0JmNzV6?=
 =?utf-8?B?Y3FpaXVnS2JoM21rSDdsNmlJK1Y1Wnc2RUUvM1VWOWdSTElnWXNBa3F0c3lw?=
 =?utf-8?B?M2NDRWkzL2MwUlZPNUw1a1prbk9NeUpTQWlhZ2J6S2xlNHZoN0QvVmhZZnF2?=
 =?utf-8?B?MTBDVWdTd1J4ZWVyNmMrdW5lOEtja0xKdnF0bW5tZkJ5Um9VdGowYzlPNmxj?=
 =?utf-8?B?RTlzVmNBN2VHdFNOa3JVOGlWWDJJTVYrYUxGRXc0aTB2a3VrZ1dtRkxhb1Fu?=
 =?utf-8?B?OWNYbjlnZ2l1Mm96TFA3VHg3Qk1Oc3VtV1dJWkpMU1ZaZ1RpeG95cERCb0NW?=
 =?utf-8?B?bjc2U3cvaGNhbSt6R25LOEpBRE5aMDA4VWdaUkhvV0VrR1pWbFZJd0w4ZUNI?=
 =?utf-8?B?b2xDY2ZFT1h6ejR6SHhQVHRjNkZDYkg4Y3VTRFUxQ3NFY1NmczloNDZCRUda?=
 =?utf-8?B?TGg4OUI4eDRrdFZJZEt2ZUF0U2ZNRGZqaXpLLzNDOUowUG1pRXFlc3lQVm95?=
 =?utf-8?B?cGlKVGNoZmxKLzlkeVJhVkhEajhyR3Z2UWc5QVVVSVF5dXFmYStKT0ZZSVJq?=
 =?utf-8?B?dnlCcXlnOFltNys2SDR1R3pqUlJMa0kzV1ZxcGhyNnVQNUFyWk1TTkNFc0ly?=
 =?utf-8?B?djFRMzhkOCtyelVZeitZdHZsdlUzQUI4TjRmUkVVejFyeEVpOTU4YzBwOHhl?=
 =?utf-8?B?RjF0MDVTRVNEWCtqN3ZoV0tIeGNTTzg1dDBIQW1TRmhueDl5WTJ5MUdDZVhO?=
 =?utf-8?B?VllLYk9XMHRnQ1NzREdkQmQvenJZbnI3enN6Z0ZwTHNFelhrMTVBc1dHWFlj?=
 =?utf-8?B?ejZyQUR3c0RTMmdaL3p3aGpyS2lMaGFPNHRLc1FOVlFSZTVvcExycDB0OEpU?=
 =?utf-8?B?U2FuemM0bWxjUUtBNEo1MmtWd0ZQaGpwRXNYd1VBNkZpL1BsbmJPeVIyc05E?=
 =?utf-8?B?bVBRWVFLV3BCbjlWLzloMVhuNFdZNjlqRXcyaEtsV0FyYk1YQzhwWjM5SnFD?=
 =?utf-8?Q?ineVcgeU876JztDyOu6jG+s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c83ff271-aea1-40a5-2f4a-08d9e4a0153e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 09:57:25.3808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXPbjiJ9FYvBpSZet+x7Z6hOdN2T9ZdUxvos8mcUUMmRxHz4e6uXaIT4+QAcK2EdWHwCADKR4y4CcRsIhQvoGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4181
X-OriginatorOrg: citrix.com

On Fri, Jan 28, 2022 at 07:48:44AM +0100, Jan Beulich wrote:
> On 26.01.2022 16:45, Roger Pau Monné wrote:
> > On Wed, Jan 26, 2022 at 03:08:28PM +0100, Jan Beulich wrote:
> >> On 26.01.2022 13:26, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/mm.c
> >>> +++ b/xen/arch/x86/mm.c
> >>> @@ -479,6 +479,26 @@ unsigned int page_get_ram_type(mfn_t mfn)
> >>>      return type ?: RAM_TYPE_UNKNOWN;
> >>>  }
> >>>  
> >>> +bool is_iomem_range(uint64_t start, uint64_t size)
> >>
> >> Might be nice to have this sit next it is_iomem_page(). And wouldn't
> >> at least "start" better be paddr_t?
> > 
> > (paddr_t, size_t) would be better, but AFAICT size_t can be an
> > unsigned long and on Arm32 that won't be suitable for holding a 64bit
> > BAR size.
> 
> Talking of representing the range - a BAR occupying one part of a
> page overlapping an E820 entry covering another part of that same
> page is going to be equally bad, I think. The range may therefore
> want expressing in page granularity. This may then be easier as
> [start,end], at least on the calling side (can use PFN_DOWN()
> twice then).

Yes, indeed, would likely be better. Then I can make both parameters
unsigned long.

I also think is_memory_hole would be a suitable name given the new
implementation?

Thanks, Roger.

