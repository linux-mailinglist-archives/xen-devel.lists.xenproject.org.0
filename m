Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F55F4CA9E8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 17:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282444.481157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRc0-0000zE-4a; Wed, 02 Mar 2022 16:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282444.481157; Wed, 02 Mar 2022 16:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRc0-0000wQ-05; Wed, 02 Mar 2022 16:14:00 +0000
Received: by outflank-mailman (input) for mailman id 282444;
 Wed, 02 Mar 2022 16:13:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPRbx-0000pX-U0
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 16:13:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c230ad94-9a43-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 17:13:56 +0100 (CET)
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
X-Inumbo-ID: c230ad94-9a43-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646237636;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GH9/GwB4NZ0RyLKXE7KDqf7hyTsMOnpNMm3LMLELNFA=;
  b=NpJCKCnJMSy0EX0gUQc+j/jHqTR18Kh8Yta6RyYHDNXOe+I60xWYI9ty
   9ElRvMiNuG4yITsuQsW+E1McgTOgImapu6i3zrKLGs9MjYWZFLgFg3bFJ
   ckGN7FpTpCI2zq0kAzm91KU3Qj4rfyGAF2hk7nACjrZDjBDXyKPoxgrr3
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65313117
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:s5E2Naq3QR7CbfZFGE9m/rPX1IleBmLsZRIvgKrLsJaIsI4StFCzt
 garIBmEP/vYYGf1KownPIrkpE4EsMDcz9ZmQQRlpH9kQioU9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Ymq+KUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBEYbth/UhShdiIjxlevV8353GGEa4rpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZdCMGE2NUuojxtnAQhMV5QlveKSwTrmWWN39wmMgKsQ7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkQOcaD0zOD/jSpj/XWgCLgcIsIEfuz8fsCqGOUwmsfGRgHT2yRqPOyilO9c99HI
 klS8S0rxYAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmL+fRG+Z97yUhSivIiVTJmgHDQcGUA8E7t/LsIw1yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT0nvmnCOQv5bzfxMuoV3teUCk1z1+e9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yP7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiJNrKigbArLWdrGR2Cg2bKhQgBd2B2zMkC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bAPSDNEeZbaQrUBgzc0E9iiF+Pm
 zq4H5HXoyizrcWkOnWHmWLtBQpiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLjXCHt/xEKfPavNAPqYRe8BKDZ
 6JdKpXYX68WEWyvFvZ0RcCVkbGOvS+D3GqmFyGkfCI+b9hnQQnI8cXjZQzh6G8FCS/fiCf0i
 +TIOt/zKXbbezlfMQ==
IronPort-HdrOrdr: A9a23:dl74rKtpKYIfjwwlfWlzSkFp7skDSNV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVkqKRMdcLy7WJVoIkm8yXcW2/h2AV7KZmCP0gbFEGgL1/qa/9SKIVyaygcy79
 YCT0FWMqyJMbAk5vyQ3ODDKbgdKXO8gduVbJzloEtQcQ==
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65313117"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjyFURgjNEZMcitvdr0/FYITJagHIy+U7ACbsLsoi9pfAbv01Mrk+v9C9s1NfMAzaDeYrmpOv8Oz4Pv/UXMlSuBv1oEVxD0iteEs3yWb74r3hIQ2D616oPropgETvBw3X7zT6wRCcU3WUF4EKsLspDIEHm+gsNq4CRxPE6v0OlE7jKO5FclB01iQ8IFMFDshQj1Ge5bvqKDBasnIKTbetXFAhaCKc9/zoZmViJ9h97byrFFK8oNfsN3xBVkkFLo0RMYrdbdW8wE+ljfDypo1bMNk3EMQcvqtriDM7/N3MLMRUKvcskvTUy/+SiT95Ut//O9otXu3mAtM8+ov119iQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hervgjJMGhuzaYXWXwQM/fbWQrktTuhnNCgLrvmR/E=;
 b=CrtzXVfbug4RA17Np0p5jM+H2R56soQtIsrU8vio+ThhQdnGw5SmMEGCz9JSDXjCDb1+qmY+s6A+tZu5BMT8HA9kY1ql/nRZRyiuZ4fX4tH/cadGyqisC4z5nO5MqusBFcsfnEgjpC8AduGRvhOd9cAtxobH9t2nqZLCLcqK4K7VH4leWkc1XdE4kQ2eeBk77+DtVylBQbqTu84fInspWmBaXTCy62LcSLXTNZ12ZeZetOX5cxgtgXiI59+UF0O9/WrYU/dWMSa02mriVHs8S94DpEoNyShP5SSDCWY/5E2/tW8zp+eWBee+UhoO0D/3Hbih9uVegICGszn3XAq/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hervgjJMGhuzaYXWXwQM/fbWQrktTuhnNCgLrvmR/E=;
 b=BazZVYo+xCRZ315ezuvm6QdvzbVZLVH4mb5mXjJmiqHSMNCy9bXNlM5jGxOQBS1FEs3CrG1L0pkq+oO50qsOqhmm1sNpenoPvhxW2VwL8REOB0uos/goAdQ08tlcKNif70tSIAXKyxlt2uus4yYIs54syDiIfrPlP+dOYsH8cEA=
Date: Wed, 2 Mar 2022 17:13:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] livepatch: set -f{function,data}-sections compiler option
Message-ID: <Yh+Xuu2ssTu7UuO9@Air-de-Roger>
References: <20220302134425.38465-1-roger.pau@citrix.com>
 <b2381496-4dc5-5051-2bf5-9d164041c9c8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2381496-4dc5-5051-2bf5-9d164041c9c8@citrix.com>
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 467357b8-378e-4832-5ff1-08d9fc67a3d0
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6357:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB63577BDD4EC0C2E3D65972E78F039@SJ0PR03MB6357.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hNrU3RhSBbjMTpctlaEyBmqqlZRW4V9jLSHZALDD3u4TCUT0Txrm4C7Xtbqe06fBGrNNbpUJ7cK0bvpxjty00tcbAaM7o0N0D5RoZeYnxwxLj/mVZLXwpAylbRTiJAipD2ifa4bp9AvCki4zE7rx4Y6PIVz/cWdxbBrOQ5+9zEwcaTLdkZyKQ3vNTz/mmpiMv9grs4FfmI61zjj+X9zejJFETsFZzIJx1n/+P1euLzRRbGMz99eQwaPtg9cCl7bEvPLz1gzLgVMzjTqrqIuyc9CV7+Aa5wVSjRz4IzrnPTtcZlJKwtJup4iaX2tWaWR5M9CD+SZuYMu6Y8wXKA9Muz7AfSXVbFMhGWsUhXxJMP6UQPszH6dgLFOJKktoRJBBi1wmLZIwttSyDAd2gByFI4qWYGNb0kx/kBhJaRJ1bBGTMgaYG584gp0QCs9hNCkXR5lAsTpSq8rE7GR/WBlBiap+HA/T+RpD7judwgdiwhuN8p+wc2OHvwi1kSfdQAhWM/GmFHiG8Dn3loM+IUzK3t9y43sFR/0RUClUrjJgoz3jq6YpkBUuvP1FIywovjLr8MfccGzjJwqvJ//p4kK+DLYZdqp1xYrUnpXfiYOkefdq1SN9u83dhdhYw/UIY2D0jVilEQqV8VWC0yRt8And4FuVyWPEuLEopUoXKnKqg0N1j2rdZ0Kt/GaK6oWiDIqc1JNFbGmnJLtyLQdio9xqbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(85182001)(38100700002)(82960400001)(6486002)(6512007)(9686003)(6506007)(86362001)(26005)(186003)(66946007)(316002)(53546011)(33716001)(66476007)(5660300002)(4326008)(6862004)(8676002)(2906002)(6666004)(508600001)(8936002)(66556008)(6636002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzJkaysxcEFBVTZwTVA3WE50bU1PUHprL1JDNXJQSHNiMUEwbWFkSzY4dHdH?=
 =?utf-8?B?a3dyTUJwUXFpeGNtVHoyRDFkakNja05pclRMKzFoWXJINlFUZ2xXYlc2TWtR?=
 =?utf-8?B?NHRZN3VraHQvSWhHTXlIbUZkQ3BlVHN0eTJHZDZsSjg1dUFNZnlGQjN6bGND?=
 =?utf-8?B?Wm5hUktaaVVXNDAxS1QyVll0RDE0TzcyZlNUbFJFOGw2RkNsQXQ1ZGJMSkNo?=
 =?utf-8?B?VWhwNlJGU21Gc1pqL0hZdVZkUkN3Nm8vOVk2dS9tU1dQR2pHZjJ6eGhaMHdN?=
 =?utf-8?B?UmcrUFhkM2hLTDY1SlFtbEZ2VjJjdXVNZnJWa3p4Z0lrYjRuUXl4NXl5YUpG?=
 =?utf-8?B?cDVwZ2xVMVpFcFhVbDdXY1hGMHAwZUxIaXd5UWZOakptWStqdHNiT0ovcGZp?=
 =?utf-8?B?MEFENzBNbmM0NXpJNzVvNFBETmZTdE03aUdZL1FLMEhQYlRwUVQ0d2tXQTM0?=
 =?utf-8?B?OWxMMVMvdlJHYUxaMERvVU9EMnZRK3VjRnVETVhmcjk1bU1ZTTcyS0pUd3ZX?=
 =?utf-8?B?VUMzMTJpc2N0Z1ZBek1vc3VMVEU4ajFHZFZuZlBTVG9pWXg3RHpBWU1mYmZa?=
 =?utf-8?B?Tmx3SWQ1VHpDdGtadHpJRVRhZWpuZEpDMzNzUTNoc0NOcUlYUUNFYnFqMVcw?=
 =?utf-8?B?bHZ6SDBvSzdBK1EzYzA0U3lzbUtMdm5pT3RHaVlaKzJhTWpJUVBqak4wYkVT?=
 =?utf-8?B?OGtteDVwYUZubHU1U1RGOEJnYWc3Z2xySGwxU2RndEcrQmJ2LzFIODdYdU5V?=
 =?utf-8?B?aUFqK0MrdGN4dThxcktWZ1JoVExmNHlyT0JvejIzdzl5NWlqbERJTG1qdzJW?=
 =?utf-8?B?NjZCek9GczRuS0FzeHNSc0JPZUpiRXZkdmsyYUhUdnIvUExieFM4YmU3UUxE?=
 =?utf-8?B?YzhnWkltOFFxaGNXTzF4cUdYc2xhNHIwK0FBVEhVZC9KRlVGeUM4MVZqU3gy?=
 =?utf-8?B?clNlU01tazhOWDZmQmlYT1lBUjkrSDB0SkxRdDNyWlF5K1JrcHlTTGc1LzdC?=
 =?utf-8?B?RzFrMHJhaFd0djl3a2hWVWNKQ2tmY3EzRnd1OFY4UDF3aHdRMndaZzJObGVN?=
 =?utf-8?B?bU51aUZkWTRMNHIwS3J5N0cxditleitmbUZrMXVGYmgzNGZXMjRLSWErcjlF?=
 =?utf-8?B?bGhJV1hxTEFuOS9NMGpsRDBTb3cwZ3NQVW1PNWFEOTMrYVdMUTlLSlhHaVk2?=
 =?utf-8?B?UXFwY1hkNTlpOHVQSzZoYzk0QllEb3FXSjc0VHNpL1dmRUQreHZKTkJKanBZ?=
 =?utf-8?B?TUlnQVJwSENGV1VNK3RYM29ZclpESS9XemtIaHhIM0VWa0FhQnZhWlk5MmxB?=
 =?utf-8?B?NVpxUFUrOGdzWGNFSW1sa1NReXF1WWVpV0VIbHVZS04vUk9VYXVjVlZsTnJu?=
 =?utf-8?B?RS9sblFGNkdabVNJUGR2OEpRa2N3NEcwWU5Vb3JCQmRWUWNZWlBSb1d0OXkv?=
 =?utf-8?B?S1hCTTNzMHRKVHVFWXR5ZFFnZjRFNERwR0tYZk51ZE52ZHVtdFVmWTBMbWNP?=
 =?utf-8?B?K3NPN1VuOEtrNTNrNzk3R3E4UWJPZFhTNlFkbWtxbG5Ia2NKZEQvUit1NnBC?=
 =?utf-8?B?a2Zzd1VWYVdaL2lKQmtxTTVVZnNveWFIbzFDYlZ5N0lKYUg1Wkt1NGdTbS9Y?=
 =?utf-8?B?em1YbjZGSzNsWnB5WkFKbHd2MU05T2taa2JyeHVOZDdwZU9kRHlsZFpxL3Vq?=
 =?utf-8?B?aWFZUGhGYXR0UVRYbXNlaTA1STQ5NFZEdGVDeXNQSlk1OHQxMThPdUlOalA5?=
 =?utf-8?B?NWlqRjVtcWVNY3JlK1NkVFJqNzRSbzFmM0h6MUlrTTJmemVuVUNvZ1ZLYkZx?=
 =?utf-8?B?b0RaU2ZhUVVFd2YvK0IyQURKd3RmZzhpM2Z3RksvMmkza05tZitNVDl0STJz?=
 =?utf-8?B?d2JVR0Z3N2JVNm91QmVzclNZVXJIVDlMSVRNaEtUQSs5NGlnSHFEaXhEZWt0?=
 =?utf-8?B?c3djNDlhQ2xZMnREZjNyajdubnMvUVpvZ1Q2azcyLzg2NWppR0NwRU5zdGdw?=
 =?utf-8?B?NUdwaHl3UVVTaEZLYzNKZEE1YWR0ZVliVzhCVGppL3hlRkxxb1ZDMGNHN2Ri?=
 =?utf-8?B?cEJzMXdDQU1UL1FZWE5ST3ltSWRHNnJ5MFQ1UHlvb1J1blB0b005Mzl3N1d2?=
 =?utf-8?B?NjFQcjhzTW1hL0F3a0VYQzRST0tRazhnVE9FamRmL0ZaYnRvTEFRTmJUcmtk?=
 =?utf-8?Q?4cieLkiPJv0haMjA/8Uj8gk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 467357b8-378e-4832-5ff1-08d9fc67a3d0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:13:51.1371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUKq7iVU3v7nPSqMJEzT7oE5Hp+MajKDi4vQ/HUwT754IBinxEsIwfJS/oLqW1a9TG9NoIOLWqJx1Tk0olIcMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6357
X-OriginatorOrg: citrix.com

On Wed, Mar 02, 2022 at 03:35:07PM +0000, Andrew Cooper wrote:
> On 02/03/2022 13:44, Roger Pau Monne wrote:
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 6443943889..2423d9f490 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -353,7 +353,9 @@ config CRYPTO
> >  config LIVEPATCH
> >  	bool "Live patching support"
> >  	default X86
> > -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> > +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && \
> > +	           $(cc-option,-ffunction-sections) && \
> > +	           $(cc-option,-fdata-sections)
> 
> cc-option can take multiple, so just $(cc-option,-ffunction-sections
> -fdata-sections)
> 
> However, we in practice want these in combination with $(LD)
> --gc-sections anyway although that wants to be separately configurable.
> 
> Therefore, we probably want something like:
> 
> config FUNC_SECTIONS
>     bool
> 
> config LIVEPATCH
>     selects FUNC_SECTIONS
> 
> or so, so in the future we can add "config LD_GC_SECTIONS" which also
> selects FUNC_SECTIONS.
> 
> Thoughts?

Do we want separate options for ffunction-sections and fdata-sections
options, or is FUNC_SECTIONS supposed to cover them both?

I assume you are fine with Jan's suggestion to not check for the
option presence, since it should be in all supported versions.

Thanks, Roger.

