Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16F4C70D6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 16:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280664.478692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOi4c-0002AH-7h; Mon, 28 Feb 2022 15:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280664.478692; Mon, 28 Feb 2022 15:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOi4c-00027G-34; Mon, 28 Feb 2022 15:36:30 +0000
Received: by outflank-mailman (input) for mailman id 280664;
 Mon, 28 Feb 2022 15:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1tx=TL=citrix.com=prvs=051234957=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nOi4Z-00027A-V9
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 15:36:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f282252-98ac-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 16:36:25 +0100 (CET)
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
X-Inumbo-ID: 2f282252-98ac-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646062584;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hbE2I8LTU0l0qKGfa+V/Rxbvy/vYwpgCj4IJo2o/84U=;
  b=Zg9ufCqgZwrVnIzIY5gAALtdOB/pTrLtFEMJu4CiYpD+PGX6Q+14j5EP
   P3tGGfOyEjoXkFqG0xV07QZBznlnUlZc5i+yDCqiFota/28kIl0+E7VDQ
   BmW6cLMUAH1TYr93EyG3ipFtMjGtcA2wwNiTJLtZxhhrRKB/CGFQSH6Vp
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65141569
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NyHkWa2+8cDfbXjIRfbD5WZxkn2cJEfYwER7XKvMYLTBsI5bpz0Ey
 jYXC23UPPzcNmbyf4h/Oovkp08O6p6HmoNiTgs5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tQy0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1AsbycRzsPDpHC28lDUkh2TANvAqR/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u25kSRKuAN
 qL1bxIxSjqcXhZNCm0SJ5A4pfuwpSfDYjpX/Qf9Sa0fvDGIkV0ZPKLWGNDYYMCQTMNZ2EORv
 Hvb/n/RCwsfcteYzFKtzHWogePemDLhb6gbHra46/1CjUWawyoYDxh+fVmmp7+/g023WdNaI
 mQV/DYjqe4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpa9E4tclwWT0j0
 HeImc/kAXpkt7j9YW2Z3qeZq3W1Iyd9BW0IaDIATAAFy8L+u4x1hRXKJv5hH7SylcbdAizrz
 naBqy1Wr64IkccB2qG//FbGqzGhvJ7ESkgy/Aq/dmC46gJ0Yqa1aoru7kLUhcusN67AEAPH5
 iJd3ZHDsqZeVvlhiRBhXs0AGJGF6cqjAAHSwnMxHsgPqBa8xHeaKNU4DC5FGG9lNcMNeDnMa
 UDVuB9M6JI7AEZGfZObcKrqVZ10kPGI+cDNE6mNM4EQOsQZmBqvoXk2DXN8yVwBh6TFfUsXH
 Z6AOfihAn8BYUiM5GrnHrxNuVPHK81X+I8yeXwZ50n9uVZ9TCTMIVvgDLdoRrpkhE9jiF+Im
 +uzz+PQl31ivBTWO0E7C7I7I1EQNmQcDpvrscFRfePrClM4RDxwW6CImO9/I9wNc0FpegHgp
 CzVtqhwkgeXuJE6AV/SNiALhE3HB/6TUk7XzQRzZA31ihDPkK6k7bsFdotfQFXU3LcL8BKAd
 NFcI5/oKq0WElzvom1BBbGg/N0KXEn63mqmYnv6CAXTirY9HmQlDPe/JVCxnMTPZwLq3fYDT
 0qIjVuKEcJeHF05VK47qpuHljuMgJTUo8orN2PgKdhPYkT8to9sLi36lPgsJM8Qbx7Ew1OnO
 8y+WH/0ecGlT1cJzeT0
IronPort-HdrOrdr: A9a23:wxRNxq8A2gC+kqhpOy9uk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65141569"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOGeFLJeQWPhesIMS131tf5AsVJsZgC2NBklh1FlbKLKg1ezQ+GcOc4spR2guInGbPXSjfcIp8ODTHWGFpslj7DFM3mEQuF+rXs5HoE0yyY+bZx+BMFj/GSRziyzB6shFycIGHTTFkVwKTstp5HQzUuylbgd8zWsLelfy9V18xQBVh+9jQAJOWi4Ay/kp9FpJqMk8DhClQt8QKy5B9Npk5SdbDKkR1S94AGRl1nh82NENFEOuRD7Ce8xXaulYoJnw+fJbxl1yV3RjyUNxVP5D2epOl47ik4dJ9RNaCNwUdUBnmyYWB6I/RtNF9CSuCYN3caQtFm7+qrA/FwNa5y/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7pL3w2ix3aa18oF9XkiRv17MpXqxfIsDMj2l+xGLc4=;
 b=ITOZedBOdHjC4O3X2t/uBW+b+m/FI6sC9hshIgKiLqlEohyjnjuNaqQz4yO2oJnRWot4kqGOQTBCTSu+R7R4UhqHymqon2LJ7qBfTLohgJb+Vnkrmf/maC3ThypmdmgoAfw63Z3Q3x0ydBvGGi1qXLpEQlzXnWgZHsEa4nocjlFeBxlKFYCfLqCrphiAe2UHBVPpMVePDL2YpOEkPauRTRJ5OcyZB/BrKlT73LXroKonKqXmRUULXV24UNbe4F1kv4Bg7sk7M5RQFOxM4nrbwFWYjT9VUkPAyzZmV1NvxP7SbO25uOd7BLSJQrz8zkfAszK7Yp2i8KviAHYvN948OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7pL3w2ix3aa18oF9XkiRv17MpXqxfIsDMj2l+xGLc4=;
 b=i2ZjDc868f2W2EYJLraGRj9d5lTsqzbrS2efOcfosuXgyHy80/K/cVL4KIym0D0xbFoq5T6UCi+rFtGYIv4xHRPjUS++3ew5EB3EoA4+APmYzZE41k4CP8DN4AuUN+d746cYzZOePIKs9fcs6UtBjKDt4VuV5jkJEMIQRT7Tw/0=
Date: Mon, 28 Feb 2022 16:36:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <Yhzr739VZdRLWnok@Air-de-Roger>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
 <YhyrAyxhNtNWi7NY@Air-de-Roger>
 <9aff51c2-0e8c-685c-7bff-0ed7ff7347c7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9aff51c2-0e8c-685c-7bff-0ed7ff7347c7@suse.com>
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb60c44-2544-4a5b-d6a9-08d9fad010d9
X-MS-TrafficTypeDiagnostic: PH0PR03MB6640:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR03MB6640DE1517B05738F654B4078F019@PH0PR03MB6640.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KyjF8zhFyaM0fJ44QVEqhMKe+XgNn7b6kdDXgizrsVTzNCffUHCJEQvMkq/Fj/guxPxdSQtjPXR2sJ/rjm1yLCrBWJ20p57gs4mbNQyir0h5jWGJBQuznRfnkbqU/cWCO45XNz9z6LfIoKyJ1J7TVy6+3rAyxob8I75oejpy+QGLahasfJrhpuNYEBvJYkZ4RMZKGAFhfDOG1sSBPx3Aq4HqhZLO0ywdBW4yLrL94q3kBGL7TGKJAqbw2igb+hy4QC9aaS6P6M5Y+j5dFaNeRfi7rEDC2a/WzQlUldflQRw9yRi8gIiB4gQBZgMS5egan9zPWRSVaW5HAW/SP37H18rzy9oJiOccwC1wWpfucSODZs+lec49gJ79lPcX/qXNGCg97XEI7D8ka2WrNQ1TX2wgOwfe/cbj3FZSBFUfzmNoE+9sh9fm15fshcDvieefdvXMRwjTSbQbp+/BUG74j9FbOOtjAdWU1X11v+YDevPW6/xbDJBE263+VysgQOsTEvtSn1i8WT7sD3bcfTTgKLCb5tDt5iUU12P0TL3zFNymb/KJu7g+xpYf0whl8V2sPqNFu3rqcMPAQMIP5sRFL4rSUTYoKboOyKimIEFSb/DjO2IMnqIhJv3ijJLLfgeLBQmLk2sL3NJPLgJxhutaNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(53546011)(8936002)(83380400001)(2906002)(6512007)(7416002)(9686003)(38100700002)(82960400001)(5660300002)(6666004)(86362001)(85182001)(66556008)(54906003)(508600001)(6916009)(4326008)(8676002)(66476007)(186003)(26005)(33716001)(66946007)(316002)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmpoZFhLK0ZlQmx1cjRGbndqRUp4T0NQNXFlWW81OHlGZlBvN25Ua3JWR1FI?=
 =?utf-8?B?ZG5aUGdXeVFQakRpamZtL2xubWdpS05DRVIzbHhGWnlpRzBOSnNCYXlMWGtm?=
 =?utf-8?B?T1hpYmFuaTFVQW9qYmpOYzBCWW0reXJVU0o2Zm5sejNMYUNUckpOanlZbm5M?=
 =?utf-8?B?clJsclBiZVRpZDE3MTU3aS93RjdKdktvWkEyZjZzS1NBdi9tekJReHk5T3hE?=
 =?utf-8?B?WmlpZXc0SWNaVzRFZVJzZDcyMlVaVXpBRUpMMTFlZ3JpU2dvZVpZTWl3SzV6?=
 =?utf-8?B?MnNMbFhkZkFWZnRCSjhmSUsrRFp0bzRNdE50TmVSb3RGUGZGSXNwbVRzRDIx?=
 =?utf-8?B?b2xmTjdjcU15SHdwTVZTcVpKdnZyRWNmdy9JbGpzT2V5RFV4bDlXVW9hYWo1?=
 =?utf-8?B?M2N2T2E0RFZWWkxpMFRhQnZxNmJFWlNQdnZ1N2M5azhQSHFQdlUvQWVUMjlS?=
 =?utf-8?B?ZXIwdUN4M25LaWVicjBZYmVWZHJRQXUydEZ6djlGSThzd0UvY3hoQ3ZUb01M?=
 =?utf-8?B?VitTejdWK2NFM2pibmErK0FncXl3cVNQMjdKYjV0Nnd3dGlWME1oL2hNaldX?=
 =?utf-8?B?STBBWTRrM296Y2Z5MG9FMG1OWUtlS2t5VFRtL3dyazFwNzl2R0gxZTRhSDZt?=
 =?utf-8?B?V0F2M3lYU3dEMnBYaHlwR0J6a1BGVkJOaEFFeFdPS1EwTDAxQWJ3aWF5em14?=
 =?utf-8?B?dkloR1ZybUhuNVhVQS9veGV2Z0Frb3VXNE0rVTlsT3BUUDdsSmZNdHJLZjJv?=
 =?utf-8?B?VkhhSGVrVEZoN3RzM2laMzFwSzg2NUwrNWlVYlNkRWRUdi9aT0hpZXBIZWR3?=
 =?utf-8?B?RElwYTNiWWlYVDAyNGJzT0lxd0o1QkFQbk1zZzZ2WG5EU1B1V1BuWXJOb0hz?=
 =?utf-8?B?Z002c0FvZTBpSHZ5Y1BIdzdKa0hwVU8ySmVSODFrUTVYUXVYQlFQTFRCY1E0?=
 =?utf-8?B?cGRwaEVXVWRiZ0kxNkdhZ282Y3d2cS83UXMxQVYyRWdGQ1RjaklOaFovVThE?=
 =?utf-8?B?aWZldnJkWkFOd3FkbHNScmpGTkxSNkdTdFlhOFYxbmFsOE9nYnp3VHZ3eWdi?=
 =?utf-8?B?VzI2UVY1ZlhCTHhJRVpPRElXR0Z0ZEJOK1cwcmdvdVovYXA4WDhOenpCZVli?=
 =?utf-8?B?ZytZZkVSbDJUb0NMdlFCYytxUE9zK1RiUittcmJ4ZmE0T1p1emtyNmtuRi8r?=
 =?utf-8?B?eXRJUHRUZVA1RWtlY3h1R0VYalc3U0ZrMGtwOFBidG5kR0RJV0JRT0phZFE5?=
 =?utf-8?B?dzVMQXF1eklDZ2lDREp4RTF0eEFQZDlpMHNMVXRmeVpteXlzTGN1WVpab2xo?=
 =?utf-8?B?ekRmTjZUU2dWKzliNjZCSzRJM1RTenJRVGYzT0J3YThZSnJFelZNUnF4Q3ov?=
 =?utf-8?B?dXk0SUoxOUZBeXIvUThOK29USzkxSmhFN3N3S0lXL25rdVRhRVZBN2JIcGdS?=
 =?utf-8?B?Ly9ZeUFxS2JQSG5nYUVHQkRPdmxodkZoTTREYlFxdlNEMkVNNFlub2NwekxD?=
 =?utf-8?B?YitXQWEvRktVQVpiTXV0dFd0dGtNYkxnRFlMWjRFSFhDSWJidUF5TXJKdXdh?=
 =?utf-8?B?bnNLTU44bHlyeGtWZzZnQ0xxMUlod2JGU296VlA0TGx4TktTeWJ3Q0xBTXlU?=
 =?utf-8?B?THF3SGR3UlZwZitkckVockEwbmp1cXQ4UDdRYngwVGtZTGloNUtoRDArd0M0?=
 =?utf-8?B?ZDRxS1ZjY1A0akhkcFRvRmtkTStycGNQUDNTbDRwMmdoNEdCc3pia1FOeDVB?=
 =?utf-8?B?T1Jod2Rad2ZvaTNGS09hYjdoejBRb09ITzZTRzVkcUtadFd4UmdiS0h5ekF6?=
 =?utf-8?B?SCt5NW9NbkpZK25jS05Jd200Q24wcGdBaDVmR3VTdnpoaFBwQTJEWllUWFdX?=
 =?utf-8?B?SEs4S0FLLzV0N2VxTUhHbTUxZWZNNWtDMFBrZTFkV3l6OEJ1b0VFdjBFc3lD?=
 =?utf-8?B?ZktTbkQzaFhVWGh5Z3dYSTkyK3VrNkIzaHR0RnJLUGRwU29qMWZ1WnB1dHUx?=
 =?utf-8?B?eVJUVlRyYnh3SDNVa0NaU0R2cUlzd2xyQXpYa1paeGIxTHhETTJtUHlBVDMv?=
 =?utf-8?B?YWZZUUwrSCs0RGNtV29rN284TUZoa0F2Y2VkWWJsdit4a2hhOXVkMGZrVEJ2?=
 =?utf-8?B?R1FIMWdFbUdXcWpXc3NkQi9MZWkrbmFkSm1FSk1VaW1UMlU3aU1xOU1kQnY1?=
 =?utf-8?Q?z7Z8eRu+tf8yVaD+897muWg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb60c44-2544-4a5b-d6a9-08d9fad010d9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 15:36:19.5457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PGIE18F7MJSfbnvn446FM5Seb5tPWFrsuO3La/a3m+Loi2C3zzFF1Vlen2CvD+jI82Ds3xCyJya/GI0wgdg4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6640
X-OriginatorOrg: citrix.com

On Mon, Feb 28, 2022 at 02:11:04PM +0100, Jan Beulich wrote:
> On 28.02.2022 11:59, Roger Pau Monné wrote:
> > On Thu, Feb 24, 2022 at 03:08:41PM +0100, Jan Beulich wrote:
> >> On 18.02.2022 18:29, Jane Malalane wrote:
> >>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> >>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> >>> and x2apic, on x86 hardware.
> >>> No such features are currently implemented on AMD hardware.
> >>>
> >>> For that purpose, also add an arch-specific "capabilities" parameter
> >>> to struct xen_sysctl_physinfo.
> >>>
> >>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> >>> ---
> >>> v3:
> >>>  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
> >>>    set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
> >>>  * Have assisted_x2apic_available only depend on
> >>>    cpu_has_vmx_virtualize_x2apic_mode
> >>
> >> I understand this was the result from previous discussion, but this
> >> needs justifying in the description. Not the least because it differs
> >> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from what
> >> vmx_vlapic_msr_changed() does. The difference between those two is
> >> probably intended (judging from a comment there), but the further
> >> difference to what you add isn't obvious.
> >>
> >> Which raises another thought: If that hypervisor leaf was part of the
> >> HVM feature set, the tool stack could be able to obtain the wanted
> >> information without altering sysctl (assuming the conditions to set
> >> the respective bits were the same). And I would view it as generally
> >> reasonable for there to be a way for tool stacks to know what
> >> hypervisor leaves guests are going to get to see (at the maximum and
> >> by default).
> > 
> > I'm not sure using CPUID would be appropriate for this. Those fields
> > are supposed to be used by a guest to decide whether it should prefer
> > the x{2}APIC over PV alternatives for certain operations (ie: IPIs for
> > example), but the level of control we can provide with the sysctl is
> > more fine grained.
> > 
> > The current proposal is limited to the exposure and control of the
> > usage of APIC virtualization, but we could also expose availability
> > and per-domain enablement of APIC register virtualization and posted
> > interrupts.
> 
> But then I would still like to avoid duplication of information
> exposure and expose through the featureset what can be exposed there
> and limit sysctl to what cannot be expressed otherwise.

So you would rather prefer to expose this information in a synthetic
CPUID leaf?

I assume the duplication of information will depend on what we end up
exposing with the sysctl interface, whether it's just support for
SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES and
SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE or there's more to it.

Thanks, Roger.

