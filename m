Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA3414A98
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 15:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192748.343354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2MC-0002Go-BS; Wed, 22 Sep 2021 13:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192748.343354; Wed, 22 Sep 2021 13:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2MC-0002Do-8H; Wed, 22 Sep 2021 13:32:16 +0000
Received: by outflank-mailman (input) for mailman id 192748;
 Wed, 22 Sep 2021 13:32:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3we=OM=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mT2MB-0002Di-Cv
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 13:32:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bd1b71a-0f4c-455e-a74f-97d7c2617258;
 Wed, 22 Sep 2021 13:32:14 +0000 (UTC)
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
X-Inumbo-ID: 0bd1b71a-0f4c-455e-a74f-97d7c2617258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632317534;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FfkCmcAGjvXL3O0pC+0tNDIR1A3GzwRI2U1LyU76hZc=;
  b=e6QtR+oTA21KeijHw6L0fFTi8YFw/xN2PfvVEvuVMEYe2BguiOuvukuK
   dAZ0szLoeTM1GYi6wjAxFopgjdEae8aztz28EhL4DN3MQNxQnPZTRbdh0
   wDs/1wCtNEgjNqORZ6Uj6eyRCwhECTGuoh/yFcaxJv6RCzNI2Mm0LSw12
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aISvFQS+9GrrLuSrCmA5FOoN7oQh1KPlIFA1EaALcM8iJBpHn2Wnob1rf7sBfrZ5MbAtz4R9XK
 ynxwk5xl55PeiE0tPvZ6BaprULQMuD5HGNA/w2vw0YMVFg9InW5zck8lDacd74Hr4sKvDjPxta
 lWUP+aam6J3QYZqtLD97Prse78M+dd3RKLPuZei1RJzYLvGpzxhjDskjqN8kJrkcWg+4IEOHXf
 NZMOxrIkSpn46dOQFQF0uhgVb2DpnGjmNr96lerJCzw4ZzFMOKK0yDDnkCr7PadRCdY0DLnm5T
 kk7roPIKSUu94O+kOPgADfrw
X-SBRS: 5.1
X-MesageID: 52917235
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QwzW+KBMar0uiBVW/+fkw5YqxClBgxIJ4kV8jS/XYbTApDhxgzVWn
 GQaD2CEPvfYYGqjc98laIXn90pSupPTytYxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w00g7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/szu4ktR14
 9V0kcaqYBcTMbLjwt4XTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFhmZp2ZoVQJ4yY
 eI8UDdjPQ3FcSFFZAdIT81938muiEnwJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEhOXCgCf6U4I6D6Cj+7hhh1j77nASDTUGWF39puO24mahX/pPJ
 kpS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9im1xJvZ5wKyBlEgFCRoeOYpq+BsfzY1g
 wrhc8zSOdB/jFGEYSvDre3N/W3uYXF9wXwqPnBfHFBcizX3iMRq1EueEIw7eEKgpoCtQVnNL
 ya2QD/Sbln5pfUC0bmytXvDiiilznQiZl9ovliLNo5JAwUQWWJEW2BKwQOAhRqjBNzAJrVkg
 JTjs5LFhN3i9bnXyESwrB8x8FSVCxGta2e0vLKSN8N5q2TFF4CLJNgNiN2BGKuZGpldImK4C
 KMikShQ+IVSLBOXgVxfOtnqY/nGOZPITIy/PtiNN4ImSsEoKGevoXE/DWbNjjuFuBV9zskC1
 WKzLJ/EJWwEEp5u0Dfeb75bidfHMAhlnjiNLX06pjz6uYejiIm9E+ZdbATWMbBns8tpYmz9q
 r5iCidD8D0GOMXWaSjL648Da1cMKHkwH5ftrMJLMOWEJ2Jb9KsJW6+5LWoJd9M3kqJLuP3P+
 33hCEZUxECm3S/MKBmQa2AlY7TqBM4toXU+NC0qHFCpx3l8Ptr/sPZBL8M6Les96ehu7f9oV
 P1ZKc+ONetCF2bc8DMHYJij8IE7LEa3hRiDNjaOaSQke8IyXBTA/9LpJ1O99CQHAietm9E5p
 rmsilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLphVexvZxzac2
 wKHOjsipLHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxPaFVnFtOtIYgQb9nwbhnuonqrr5eiA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arXR3P4ZrTDe8PApLRio/yRw5reGDR1fMhTkZPax91ep3FfJG
 dschfM=
IronPort-HdrOrdr: A9a23:Farl3Kg9DFVC2g4hXhNskWTT+HBQX1R13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskKKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkYNDS0NykBsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGJ2IrT0JbjpzencGNTWubqBJcq
 Z0iPA3xQZINU5nFfhSURI+Lpb+TpDw5d3biVlsPW9R1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVkza71eUWpPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qi5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwblUdxPIgnBQ9u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTp2Y3a/pdVJZh6agkuG9FGpYJGyz3rKo9Fv
 N1Mc3a7PFKNXuHcnHiuHV1ytDEZAVxIv6/eDlHhiWp6UkQoJggpHFogvD3301wtK7VcqM0ot
 gtac9T5ehzpsx/V9M3OA5Oe7ruNoRhKSi8Rl56Gm6XYZ3vDUi946If0I9Flt1CR6Z4uKfauK
 6xHW+w5lRCN34HN6W1rdR2G1b2MT6AYQg=
X-IronPort-AV: E=Sophos;i="5.85,314,1624334400"; 
   d="scan'208";a="52917235"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwDVWbvrbjh2h+GONaKrGoEF7jksxeWDatv1OC7LeMhqPjmJgSfhTvyqm0AI9fDg8cSfMtq7yZH1mqJCQcJG1yAbSQHlc2yUWESt6SjA1MjbXu3GVFG07BXiSbJzI/586BKG15NOdVIyrzY2jgjMyE+Rq1H7t8v9aYiah20n0BT+CNRM09OZ1sPTq/mH7YwyuxWk6LG7UXQbg8GR4yKaa12YfMXvgclkRQnykbl1iq8McM7D8ly5JK6KSMGRofXMa8U3j8aPNzylC9Y8tYGZCqkbPau9DCUthn2QYpxg7eoJG6aClZG6ngTMzaXu3qH4wsBijvFjJ+MqHCByzvpCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Z8SPcLaS2dRzpusqtPbo+7FqWUmu2TaUK7JgsfBqOT4=;
 b=bIgwMPF59dyffWJSimu7g3CQReC5NKk5hepe992mPLbYRvY2+xZM6cUk5IKCTOFvnd3EnSaZMTHG68dsIY/c1fMgNtNaJ+iSNBVW2N2zmVY0o/WvFjpyLu1mS5h6b7tSllP4Pw7UCgKF6aHjY9WyH1GuCg2zG8azz7jfTgMSJd6PjFf9UDnhnOTGZIy4hlnUwxSkXM5RgdjZBjzSUPiZCRETI2i2vAjU4w9ohWW9xuK86IPkSbfKwdhYcOfBGXecaExK76PpscGeBVaJ1gvNUqPpyvNrLN+NBRvuiphW4TC7Xd93HXr9qfkvof0apOddj2TlEYa7MSfLDo1zfmUZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8SPcLaS2dRzpusqtPbo+7FqWUmu2TaUK7JgsfBqOT4=;
 b=DEhWn3CIsmZkbhD9aA408A7YwHNhHjC7ue++ANQKiD+u/CXidAgeGPH0F0nrg3lSRJ74kLhR+Nn6PgbKo+17qY0OOB8lgN76tkjbdXiFfzHoDk3vnYiLzr3enGU6T0GMrFuTE00ntqVVzYYVsmJKIyRkRY+OqS5xC3iDzdMJkVc=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Tim Deegan <tim@xen.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <25958e72-40b9-30ef-a348-6ac9ef02b261@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/9] x86/PV: properly set shadow allocation for Dom0
Message-ID: <b2a2fd30-225b-2b79-f160-8ed2e4ad439f@citrix.com>
Date: Wed, 22 Sep 2021 14:31:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <25958e72-40b9-30ef-a348-6ac9ef02b261@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0112.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50622a34-c22d-45ee-5aa8-08d97dcd5784
X-MS-TrafficTypeDiagnostic: BYAPR03MB4293:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB42931FCD0ED85C200A4FEBA9BAA29@BYAPR03MB4293.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89VE9oUk4XS5AdPWZpuC1BwOa8zPxOT1qNzIvnp0qywnnrdt3nmxzWWm/YfeG7byGxHgMlyDCdzPY72M6ioU+2Dt38LLZucksFk3ArZzE8jDVRQJTXeCvDkEzvkMRMp8x+Z2gc4L4U/SavCCSO6t7NfTKXCfVtj/e7xZp5zCqQiQe84sEeYORrP1K7Sc7jtZxnqTOZyBVOaSFpqosuoS4U9kned6+NP3Gi5dDAYYYeR/7MDOdV96mrjh1HEZOg6V4Dg0EqUjvpt2QtcvXGzCUOuK1NYPNYNTd5wxU8c7EO/uTqdjLWYFZc+Y9xyGQ6LVpDeYJgDxukI8sDUH9B8tmM8qtn36PScSalMaNqtFFswEWGwVHNiMg71BZMP2e+5zIeW2dNESrXB2ZIWntne29ti4ZHuQ92Klb5R6o45E8hd6KlJLZq9NTDesKa69mj8nDGCliqcrUJn+8N5jNTA+/NMLNzgQe+dZijKMUDUgootgM94q0zQ4tho79YrnYcifhtWh2dx52WzG78zAzu34AvENQMgyR0meILUIX2tGk/0jOtqdSFtpw3Zr9cbyWeFdgTcsHTeJIucT4nNnTiTbDdKaR8RLeME5DcU3grH/lU1SDzgS4KvDogI/OGCjUcwSEPiodoRi32ZsyYl8FhN7VthUOF8YVwjF/cbOMlFEuAeXMEJUmSxebDrTsbesUf5MTrDMEB5uFDEO8ci+ThKO6hLH0vrX4mCR0WkoXj5lQOpFTUldFCe4Bb8lUU82EfxI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8676002)(16576012)(2616005)(54906003)(110136005)(31696002)(956004)(508600001)(86362001)(186003)(8936002)(5660300002)(38100700002)(83380400001)(53546011)(66946007)(55236004)(66556008)(66476007)(4326008)(6666004)(31686004)(36756003)(6486002)(2906002)(26005)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHJNNFo4WGc1cDZxb1kwc3diSFZGK3puLzBHOFhXRTdsU3pRcGd0bC9Hdnlp?=
 =?utf-8?B?UHRubjBLdHdBQzhWV29ZVzVBQ0lPcnIrbVdSc1l6ZG1ENVU2VlpoRzR0ejRI?=
 =?utf-8?B?T1F1eisweEJZb0xQWGhkaTMvb3FZZ2NVaUFsenlJOEd3aGdCbGN6Rlg0cGpU?=
 =?utf-8?B?bEdIanR6UGJSNG5KUU92dlE1UStoUkkwZUxBYlZWZFREM2JJeXVuRXY4Vks1?=
 =?utf-8?B?MmNJMFlZcTdFaGdGM2FtWmJXQVhqYVlGMkNFcEo5QjRtYzQ3cHNIVHkvcEcv?=
 =?utf-8?B?WXhhR0YxZVA4WExweTIrdWJZOUVtbGxtOUFWQjUyTm9KVklPczgxYnZHVjl4?=
 =?utf-8?B?WHpCRjdibkZmSFk1ME5ZVmpDa0p3RUJFWmg4TlI3TlR2dVlEdEFoUDhiajRu?=
 =?utf-8?B?dXZoaXlvT3JER2hzSXFtYzdCRkgvNUREeDduSytjV0s3R3J0cTNIbDBtbUVK?=
 =?utf-8?B?NXMxSTdwb3B1UXVrdDZ6SlJ4QW1BQmJ1K0NQdFlUNy9JdGxaQVhCeEd0MHQy?=
 =?utf-8?B?MGVRSThkcFRPVHBNV0E5bFVhNXdHc1Rxc051ejhHRkhPVU9CdzN0WTAxTmNE?=
 =?utf-8?B?VGtYZ0N3VkxxMFg3UXNweTVpaGtPQml5VmY5eGIrS3BiVXByQXoyR291RG5K?=
 =?utf-8?B?TkpCMURCOXJIME5zY2NMOUVZaFhBWldVYk5SQWUyZFZBV1dxUjlVMlFPWjh4?=
 =?utf-8?B?RGxUMDZyU3UyV0dFbE41eFA5eXVqc1JTTTJoV1ZJL1ZyN29NNTFub0RqVEdI?=
 =?utf-8?B?TlBrTWNpckV5Skd1bTVSQlI5S1B0N1MwaFdnWWUxTzVBOHVWTUtXQy9tT0or?=
 =?utf-8?B?NTJRMHVTem1BTzEwSis2YjlVaXlua0lYVTBIQ3V2dVhSREVGWFlsc3Zac0JO?=
 =?utf-8?B?NzM4cVZOVmZWQWQwakpCajdpQjdvcVVCd3VMbDRjNTkrVzRMamQ2OHE1b0pG?=
 =?utf-8?B?cTI5SWJDUi9mZUM4cnRybzRXSG13UXZVazQvOVAwWTNTbjR2bGVaQ1VMTHNy?=
 =?utf-8?B?YVd5bW5RcU8zQkZzZGIrcmJVODdnUU9CYkFZbk9mbU11NDZzVllwRWNqazBC?=
 =?utf-8?B?MDJzY1o3b1lGYlVPaUZyYVJiMEF5eFdHMkVIM0ZMYVoyZ0FFSzVSZ3NBNzlh?=
 =?utf-8?B?bTlNWkw0S1cyNEt5aSt5M2VUT0YxRS9WbzRvMUhkS08wUTQyb0pnemxieVAy?=
 =?utf-8?B?SDRSN2tWZEZJOFRwdlUxSno5TE5oMW93ak90N3MxbTVzT0UyVmd3eFlTVzZ0?=
 =?utf-8?B?V2prS2IzL3hEZzR4eG9uTCtCdU1FbCtTaFd2VklXUmhOQmpCenZmNFBqVEFV?=
 =?utf-8?B?K0ZpZlR4YllKNGFTamxnVDFrdjFmeWRIWmcva2F4b25pQUx3ODJTUmEwWmFa?=
 =?utf-8?B?eVlzcUVBcTVwWkZhcFVQSWxvTmtvZ1krYU43V0IvaUJxNDRqdVl6aGxpY1g5?=
 =?utf-8?B?ZzJhRFdqbWs0WGFEV3h0VUFCK0ZzNmlHNUMrR3d4ZDY0cHdQWnJ0b3JBMGZv?=
 =?utf-8?B?MU9RL2pDWlZxeHY4YlJBUzBCSHkrTXZhaDFQM21zcEJsWWc4QXJ2bmJOQml5?=
 =?utf-8?B?VEpTTnlHMDY2TkJMUGV0VFFzeGo1dTcrOGFaOTVUZGc4eW5Ma2dJckNORXNh?=
 =?utf-8?B?M3p0VnU0MnM0aUVFNXdIRG1tQjY3Wi9JaEtZd3pIUlJIckFmdnlPMlZwcUto?=
 =?utf-8?B?MnlYZlZZckZKcTBicVpYZjAvNHpxenBsL3M3SStLVndQdDYyQnMxTkkwR29a?=
 =?utf-8?Q?AysXrXjyGHgGHjuRvDP/jlmGwck03WuaY4rnqY+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50622a34-c22d-45ee-5aa8-08d97dcd5784
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:31:54.1544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmHCa8gyWlV/oh/EEsGpiBk8PCGLXv29C+UMNF6hxj/PuiKNS2wFd/MdxUDYRv6zkkYOAqXmZmpUjlypzJWMqaRnygynr6+I8xVCpkOQfRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4293
X-OriginatorOrg: citrix.com

On 21/09/2021 08:17, Jan Beulich wrote:
> Leaving shadow setup just to the L1TF tasklet means running Dom0 on a
> minimally acceptable shadow memory pool, rather than what normally
> would be used (also, for example, for PVH). Populate the pool before
> triggering the tasklet, on a best effort basis (again like done for
> PVH).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Tim Deegan <tim@xen.org>
> ---
> v2: Latch dom0_paging_pages() result.
>
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -1298,7 +1298,7 @@ int shadow_set_allocation(struct domain
>  {
>      struct page_info *sp;
> =20
> -    ASSERT(paging_locked_by_me(d));
> +    ASSERT(paging_locked_by_me(d) || system_state < SYS_STATE_active);
> =20
>      if ( pages > 0 )
>      {
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -21,6 +21,7 @@
>  #include <asm/page.h>
>  #include <asm/pv/mm.h>
>  #include <asm/setup.h>
> +#include <asm/shadow.h>
> =20
>  /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */
>  #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
> @@ -933,7 +934,18 @@ int __init dom0_construct_pv(struct doma
>  #ifdef CONFIG_SHADOW_PAGING
>      if ( opt_dom0_shadow )
>      {
> +        bool preempted;
> +
>          printk("Switching dom0 to using shadow paging\n");
> +
> +        nr_pt_pages =3D dom0_paging_pages(d, nr_pages);
> +
> +        do {
> +            preempted =3D false;
> +            shadow_set_allocation(d, nr_pt_pages, &preempted);
> +            process_pending_softirqs();
> +        } while ( preempted );

This is still broken.

The loop setting the shadow allocation needs to be outside of this
conditional, because it is not related to early activation of the l1tf
tasklet.

~Andrew


