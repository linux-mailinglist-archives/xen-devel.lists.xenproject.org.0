Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658B034CE08
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 12:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102940.196487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpKB-0003Nq-Sx; Mon, 29 Mar 2021 10:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102940.196487; Mon, 29 Mar 2021 10:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpKB-0003NR-PP; Mon, 29 Mar 2021 10:40:47 +0000
Received: by outflank-mailman (input) for mailman id 102940;
 Mon, 29 Mar 2021 10:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM0b=I3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lQpKA-0003NM-0v
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 10:40:46 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e36b40d4-cf0d-4ecb-835c-2654cae3f597;
 Mon, 29 Mar 2021 10:40:44 +0000 (UTC)
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
X-Inumbo-ID: e36b40d4-cf0d-4ecb-835c-2654cae3f597
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617014444;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AUZd3BJ8D6mLn+HTz69TFxrw/AUmwVhAK8hcARUsSjI=;
  b=DqZPOUMyv+a3HEnINGFJDrILKR+dreAyPG3KeltPNH9thtp3p032xTkr
   Dhr7d4prmEaDgV2dFmYAJ/VcQ8Sytv3XRiVGdGghQQinzxK6rLVSzy2oR
   bbv8zCy7nQdHdAif6F0b4LW0u/7+PyGMD/UOgWCL56RoALj0XBzrmtSrl
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: egdK8+M02Aw8VBF9VclIbYsU2RpLYs4pJjsqL6RrKAbx4X9SkoUXKbenkdMSabNOhzdfzb0R1D
 ohSzavheA89vzlZjixHIQRpyajf89cpLtBI9q3/TCIoaYAgxeZbSQMN5ZVMpL4bKnZAX49bedE
 w4naB0etm9tpFguqb7TWIsFYyv34iquDj9lc5Boa2UgQ2pvFJVBrbrHXx5W4cRvQ1AP9SADMJX
 RsOKhaK1MBANF+wmUeUma9LMZHL69MTfgJD9hjnr7kFqWMke22vevPefIcZ60ewBPLasLm1Dtw
 ceY=
X-SBRS: 5.2
X-MesageID: 40485471
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4KhEEK6O2g/hosweogPXwXiEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbTqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH76GL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnk4j41VTRTzbA+tV
 XUigCR3NTZj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+2SVTat7XbnqhkFRnMiO7xIQnM
 DIs1McOa1Img/sV0WUhTeo5AX6yjYp7BbZuC+lqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmKzoA3H69fFTB1snEavyEBS6dI7tHBDTZAYLIZYsI13xjIlLL47ACn45Io7ed
 Meav302fA+SyL/U1np+kNrwNCqQ00pGAaHTkUoqqWuokZrtUE84E0CyMMFmHAcsLo7Vplf/u
 zBdp9ljbdUU6YtHO5ALdZEZfHyJn3GQBrKPm7XCVP7FJsfM3aIj5Ls+r066MyjZZRg9up8pL
 3xFHdj8UIicUPnDsODmLdR9ArWfWm7VTPxjulD+plQoNTHNfrWGBzGbGprv9qrov0ZDMGece
 20IohqD/jqKnarMZpV3jf5R4JZJRAlIYwok+d+f2jLjtPAK4XsuOCeWu3UPqDRHTEtXX66LW
 AEWBT1OcVc/mGmUnL1m3HqKjHQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOCTAqiN1yQG
 JOZJfc1o+rr2i/+mjFq09zPABGM0pT6LL8F1dDpQoANVLIYa8O0u/vPVx67T+iHFtSXsnWGA
 lQqxBc4qSsNaGdwigkFpaBPn+FiWAQ4FaHVY0VlKHGxcqNQOJ3Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzYO/jJIVA+nbX8JmgBiiJPNVrX63jzTemegfAl8gGxK+W8+ehggjAxBOgE
 dqzqMZiL2c3Qq0JXAHm+Q+Ol1UYGGxCLZLZT71I7l8q/TOQkVdXG2KjTuVh1UWdnDx/0sfvG
 DnMBaZYOrGGFZbp3Be3Jv76V8cTBTvQ2tALlRB9aFtH2XPvXh+ldWGYae+yEO9QFoPyON1Ck
 CPXRIiZidVg/yn3h+cnziPUUg8zpI1J+rHEfAIaLfIwE6gL4WOiIALF/JZ54xeKdjrq+MHON
 jvPTO9HXfdMacEygaVrnEqNG1Is3Eii+rvwwCgw26i3nIzaMCiVmhOdvU+GZW74GflTfrTj8
 k8otIxoOeqMmL+LvSB0rraajZfKhXV5U66JttY3ax8jOYXjv9UGZKebB7jkFdg9z86JN3vlE
 wfTL9giYqxcrNHTog3QWZh4lEtlN6zN0MlvQz9P/8mcTgW/grmFuLMx4CNlKEmDUKArjbhIF
 Wz8yVS+PHeQiuIvIRqfJ4YECBzaEIm7m5l8/7HX4rMCB+yf+UrxivxDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27d1BrLtTV2ZoJI/GDPe7L+PCu8XcpJ+ce9I1KCn++D59Oyli7+TX+DUHsj7L
 c1PHA4X4BkkTktjIo+zyi0ROjWmyse4iRjyAAisEXs1Iig6HrcBmdcP2Ti88xrYQU=
X-IronPort-AV: E=Sophos;i="5.81,287,1610427600"; 
   d="scan'208";a="40485471"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFHvRo3uANxE642aE8GEE7n0RL9gyzT05Jk332AowN8PUOiyD6dWym/wrZiqeQjxQxTIqGtMsZVXusaMNHwI7HFLN0EvwEb2nraJTHO3OUKkQh5gZcyf2v89M22wNpXh2g14RFW3S90WxpJcl2x8Ta8k/ZpxJ3A0h/GeNHj0gSIYNhLbVtMOqWS4WQASK3zAsj+Lfd0HRDQchbuT6tP6E+ytJquwV5ih1DRut9woAXSsK/UvlCoeWOnV9wZRwG+hxeXvcElVOcytlVYIxyQIS7DPVtdB3P/7IH5QrFL2axxblvsVyXaFhnfNLFZSKw/kvtU4DJlOcto2hDTDbjs1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uq1zSz2PA08osRpyXxWzQ3BZyN1WJhZGJ1zPNuzRHE=;
 b=EaQ5FjUAKufS21jaRPvAAgKOZXZ6tWb9bgkwRty2OwdJrID2v7wLWovNMG+CuvgY2IrD4yhInmJNgWrWsFBvIdAEi6uXD4fYqjjLhk1ihcdiiqe3Nv7iC8egjNVbjtcfpobiiD2VHkVpdPBrN1g6vJXQPWnb4D+KheIGfAUjq1RMuQoDx9VcAZfOKd3peFvfDe5x2LVyZVElj6P5CcxYHcjx29UbIrjBgo4WSB1QCtDTtlxj91I7f7BqMUSGf33b2Ylo3z2cyDJMDRpIVFUyVcsOTJCZyeU9tK+oC+SU1+IXPvgQy9d52D0KiVBqwsR+ic90HsgnJuLdFbKzNJnbzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uq1zSz2PA08osRpyXxWzQ3BZyN1WJhZGJ1zPNuzRHE=;
 b=f/ckZAUuCDxcclspcaC/epEvR+8W+m3rO58O906jTpUCsT4Yi0U+O4e9fk9e+5YR0lYWo4C7i3bQyOBDZ7Qa+AdssSfg8WhTAfzLEe/ocloFEXOpSuA2Iup3a6c+pgNHXAP+VJa7tLi1hCCF0sX2x/10/vb1FaLXhvEjDuAGN44=
Date: Mon, 29 Mar 2021 12:40:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, <andrew.cooper3@citrix.com>,
	<wl@xen.org>, <stephen.s.brennan@oracle.com>, <iwj@xenproject.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
Message-ID: <YGGuogF/3n9c2uNV@Air-de-Roger>
References: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
 <82868938-bf57-25c2-38f6-1ec8e9c92362@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82868938-bf57-25c2-38f6-1ec8e9c92362@suse.com>
X-ClientProxiedBy: MRXP264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dc1cddb-834b-4c73-a2b9-08d8f29f18c4
X-MS-TrafficTypeDiagnostic: DM5PR03MB3066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3066A30BCD7B4D1A413B61DB8F7E9@DM5PR03MB3066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ycd78HmlFtZmyB5Z+aAEZ1ckMO7y/pjrkn9z/wzwZxNc+InntcFHwqNnrsZeFNwIRpJPp8sqGw90F7BmIjxt/rxjB8S1dT5AgZNGcYCqA2K40lMLL3BJj+lmGTgve1wegqrj2pSnHNy8awS7hG7wO+sn/ATQ5IEVDa1t+qdmNqSveD2rQ8vfV5XFf2SauC5pxXqhaOj2qJeoxy+VBtH5/X0APpx+C8Vob/Ol4utH0QlQY2JptFBh2PEM58bb/UPEUj8SY7hsmRMtDLxJ80OP/07rm7NgZfhmFfthCJ2EIl71AAPnOr+JH4ktM/S9LGnjGQSaCYlyCCsbllp7dCtLDrRucEHsqIkm6z5Oed0d5vG4q9mmkm3kj944tubxZqLysmXWNe2GVX+918qk1La6z9C5p0K0zAIVEGlQRhfF0Y5uQEdceXFtS6+2U+n2IVfYuHZayjBs0RWEjQ/XjIyHf3FPZ2kNWhKT0TAw2YzlaEo5xK5El5brZA45RGdci6URF77dA7/Frc1ZjbNsId7iIbZ7FD9Hhtf1nlqbLuCWul3UEWLOMt12XxXJwlpcy+A0eWPMBecZEcQyj4Sjo4KOqDnNtB1s+uxkskRKDJaAHIUyyhtNA93NTGFBkUHUiA7EiRdhL6HQP/UQBK1zXoW7cwsO47YBj9Hqd+/XUwiQnyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(376002)(366004)(346002)(39860400002)(136003)(9686003)(66476007)(66946007)(6486002)(66556008)(6666004)(16526019)(6496006)(8936002)(26005)(956004)(38100700001)(8676002)(186003)(86362001)(33716001)(53546011)(478600001)(4326008)(316002)(83380400001)(85182001)(6916009)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YlRzeWpkaEJoakRrTXJiK3JFMStUK3VMQWNMNy9laWJnL1J4UzhOVXIwbU5F?=
 =?utf-8?B?RGd2ZWxMWDBkZGV5TVQwK2ZJM0FGUjFoeDE2UVhBSnB6eWNERTRBRyt5dXln?=
 =?utf-8?B?a2RuVVZJc0pvTG4zQ083Vlh2R0dNQUpCa3N3TkNyTUtWUTRUMUtIeFhOQkFs?=
 =?utf-8?B?d2MySitmWWhrbTdiNTVzV0xjT1RzSDJQR3VWL0RZZjhsYnZxckVTaENmS3ll?=
 =?utf-8?B?R0VEcjZ5ZFM1eklPNkJJaXJrV0U2SHNwS2dFZVJ4REEwR1BDbGEyYldGNmdh?=
 =?utf-8?B?bjFzNkwrQ1N2TDEwbUMzQVhCR0lXclBSaVBkOHA1aU02SWJoK096VTF6NGh3?=
 =?utf-8?B?SUdkZUgyQTlzQzdsWU5QNzFnK2hKaFU1N1VlYjJ6Sm83V1ZIRUlMQkRFcEd3?=
 =?utf-8?B?MWZxUDNYTHBFZ2w0dUZMeTdjRGE0ZUZ6d2ZFTEY0aWxwNGVzdGtwa0hwRjhS?=
 =?utf-8?B?RXdpYys0MThMekVhZEd6VEVYblUxZTJGd1ZYZUhwZ0FieGl4eTFWQnEwQ2Yz?=
 =?utf-8?B?Q1ZINVI2dXAyNXFSSmNPZ3VvdW9QUkxJNjQ0S1pHSjVqRkdwbzFQcE93eDQr?=
 =?utf-8?B?by9wSS95a2s2cG1zOHhqbi91UjcveVVuQ2RkT3dXWjhKaGM4TkloVFJHSnEv?=
 =?utf-8?B?T0dnQ2hLVGQ5UldWUzhGSXFZNnZiL1Z3cjJrS3VDYkdzdVpUQldSZnpMQ1Zk?=
 =?utf-8?B?YXZhZFJ1V1FyQ3BPdGdQWm1zbzNXbE9velZ6ZEZCOHFDV1ExZTdTMXhJa1l1?=
 =?utf-8?B?ZUFRVWV2MCtidllhNzVDclpSVUVUczhON0tFcUlXaTUxckV6YnNFZmhKS1Vv?=
 =?utf-8?B?ekp1bjZmSzJVeG84c3oxNkczWUdTOVBSU3pBTWF2YkJXOWd1eEk5UE1nQUh4?=
 =?utf-8?B?RlNKSTN5T1ZYdzBsanYzbnZBWFVqcHNKYU85Tk5KQ1RYbkY5ZW9VazJ3VXQ0?=
 =?utf-8?B?RGtnSlBoODUwQ01CN05TVEtseEdrZVlJNXBmQ0FvMmNiMkdnOGF4SW1lVHhm?=
 =?utf-8?B?dzZlRFJoTmUwYXA2Ylcva09NaDgvWWg1emJQdFBqUUl1djdLUU95TS9UUGRz?=
 =?utf-8?B?MkFsRWg0TG54VVdEaXlBZURDaDdiS0pZczROSUJlbTJnWkpPOC9LYnlSZ1pT?=
 =?utf-8?B?R3loajdoY2lyb0lsUERCd2czQmk0WDNqNmJObzBZQnY4ZFZNaEs0S0dxdFp1?=
 =?utf-8?B?SlFaZm93cjV3bSt5ZlhHTVF4dU1YYzlrTUNHYTRsTHJTb1lrazJPbXV2bjM4?=
 =?utf-8?B?aHJLYWk3MkpUYzF5RGFDMWtlWXBybFkyTXR4WklzYVF2MDltTXNZK2w2cmkv?=
 =?utf-8?B?UngxWnZ3a3ZaY20vaERnVTduMDlwWWdsQURIRW1ya1VRZ2t0U0ZYamQ4SXJD?=
 =?utf-8?B?QjhZQzBocEZiUU9CT0IvVXpCa25MczlxT25DMW1QR2FvbHdDcWsyNWI3Mktl?=
 =?utf-8?B?OGZwY0xTbXEvc3RYMWtJKzQ3VWQ2YnVTeWtxb0dTNWxuTllpb3YwNVNDdHBM?=
 =?utf-8?B?d1N0N2xxVXBWVnpmZGFhekJDUUNLRndBaHNWaWRwRVJRQ01CYmE2TS85OXhX?=
 =?utf-8?B?K1ZFOFg3dGFOTTlUZE9iaEl5WVF2VUwya1NUVEx4WXFiVmRyVHZ4cWo0eEpo?=
 =?utf-8?B?cmhXWFBqQUs2NXhLSmJxazQrS2pNVFdJdStyRFVlUWtkUEp5RDVScTljb21v?=
 =?utf-8?B?emdvUmFQc212TnZlY0FMYVN4OHYxS1hycEZDcm1jbjBBRlFDWTUyWnlvRTVD?=
 =?utf-8?Q?saENjqZ89x4KuTJNtBMrPMOfaGrdjH4BIZtbuAT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc1cddb-834b-4c73-a2b9-08d8f29f18c4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 10:40:40.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKmm/NxewBIKYg4c6kCqx8sbRj2rwtudiLY+51/QfYeMeWYtc16PSus1U9d4ewSw3XXShZf1qgVohMoH43lwjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3066
X-OriginatorOrg: citrix.com

On Mon, Mar 29, 2021 at 11:56:56AM +0200, Jan Beulich wrote:
> On 27.03.2021 02:51, Boris Ostrovsky wrote:
> > Commit 8e76aef72820 ("x86/vpt: fix race when migrating timers between
> > vCPUs") addressed XSA-336 by introducing a per-domain rwlock that was
> > intended to protect periodic timer during VCPU migration. Since such
> > migration is an infrequent event no performance impact was expected.
> > 
> > Unfortunately this turned out not to be the case: on a fairly large
> > guest (92 VCPUs) we've observed as much as 40% TPCC performance
> > regression with some guest kernels. Further investigation pointed to
> > pt_migrate read lock taken in pt_update_irq() as the largest contributor
> > to this regression. With large number of VCPUs and large number of VMEXITs
> > (from where pt_update_irq() is always called) the update of an atomic in
> > read_lock() is thought to be the main cause.
> > 
> > Stephen Brennan analyzed locking pattern and classified lock users as
> > follows:
> > 
> > 1. Functions which read (maybe write) all periodic_time instances
> > attached to a particular vCPU. These are functions which use pt_vcpu_lock()
> > after the commit, such as pt_restore_timer(), pt_save_timer(), etc.
> > 2. Functions which want to modify a particular periodic_time object.
> > These guys lock whichever vCPU the periodic_time is attached to, but
> > since the vCPU could be modified without holding any lock, they are
> > vulnerable to the bug. Functions in this group use pt_lock(), such as
> > pt_timer_fn() or destroy_periodic_time().
> > 3. Functions which not only want to modify the periodic_time, but also
> > would like to modify the =vcpu= fields. These are create_periodic_time()
> > or pt_adjust_vcpu(). They create the locking imbalance bug for group 2,
> > but we can't simply hold 2 vcpu locks due to the deadlock risk.
> > 
> > Roger Monné then pointed out that group 1 functions don't really need
> > to hold the pt_migrate rwlock and that group 3 should be hardened by
> > holding appropriate vcpu's tm_lock when adding or deleting a timer
> > from its list.
> 
> I'm struggling some with the latter aspect: Is this to mean there is
> something wrong right now?

There's nothing wrong right now AFAICT , because per-vcpu users (ie:
type 1) also hold the rw lock in read mode when iterating over the
per-vcpu list.

> Or does "harden" really mean "just to be
> on the safe side" here?

If the per-domain rw lock is no longer read-locked by type 1 users
then type 2 and type 3 users need to make sure the per-vcpu lock is
taken before adding or removing items from the per-vcpu lists, or else
a type 1 user could see list corruption as a result of modifications
done by type 2 or 3 without holding the per-vcpu lock.

This again makes the locking logic more complicated than it was, so I
will try to get back with my vpt improvements so we can get rid of all
this at least on unstable. Hopefully the comments are clear enough to
follow the logic.

Roger.

