Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F53454315
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 09:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226646.391709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnGjj-0002Q8-0C; Wed, 17 Nov 2021 08:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226646.391709; Wed, 17 Nov 2021 08:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnGji-0002OM-SP; Wed, 17 Nov 2021 08:56:10 +0000
Received: by outflank-mailman (input) for mailman id 226646;
 Wed, 17 Nov 2021 08:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74+5=QE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnGjh-0002OG-G4
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 08:56:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ed1e782-4784-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 09:56:00 +0100 (CET)
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
X-Inumbo-ID: 2ed1e782-4784-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637139360;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BsvHb/ge7EOpQfAlSFzLxZp21J64zYHtNKEyMPDJTbo=;
  b=CKmp0sSgfNvT6dC57v0O6ZRscEmvtrHQEXjPXIcX11aoPGWkIqPuGNf9
   uYh6DkkKCYyCx3rgnQavuz9o6A9yy6YVT5QK5V97cu1jZ4qdjWJPl5yN5
   9jCEnouvKB3J05jCb/eaORtp1x+iW2pq07tnrZ7ZxiXap/pBpIUj4KjML
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Q0iotyDAT5vb/8KDOkGRRi1n9bv7LmmTcrb8fYu8qeXgTElkNeFpjouIBX+Sxi8amfg1FqDauY
 Lo6KnDrWzcYUUgULz2OyI1pWfbKIiLjNoSkwV7lnMOYeFhSYdBlsKutyi1WbrqVgquf33YHJXj
 zDWuXnLvZELXAHPCVnTylubg3r+gtcgQTv/vDXuBCuBFnm7vIJq195K8xpA/Ty/C7B5AHekugt
 MtU3i+maZw56qGqoFvqbqeuoyJZ8bTf1tQ74ImxA/53XwPlgnKkKb5ejfnD1X4eFJ6KR1McxzL
 jQsoaIl68L2YApm6Ug2Uq/oy
X-SBRS: 5.1
X-MesageID: 58035065
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GBpDs648vbVBpF6DflfWYQxRtMHAchMFZxGqfqrLsTDasY5as4F+v
 jAdCG6BPfuKa2H1Ld0laYyw9x9Uv5CAnYUwGQo+/nphHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg29Ew27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 M9v5YCsagkQEqjDoOBaXDQfTzBzIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWdo3Z0WQ6u2i
 8wxNWFeXjHxUSZzBRRJMdEzjf3zoUX/fGgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 n3C13T0BFcdLtP34Tua8Fq8i+nXhyT5VYkOUrqi+ZZCglee22gSAx0+TkagrL+yjUvWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC2
 kWrz8/1JjJWnLiacXba+ZrT8SK/Jn1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G7T8nVn71kHpYtSjvjgowib6965jsGRFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHLVl8FKBva/t3NjgbbhHRcFJG9OFoSDLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUppxkvCwSoi6CqqFM7Kih6Sdkifdp0mCgmbKgQjQfLUEy/lja
 f93j+7yZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeNm+58INI8wPwO/goKl
 1nkMnJlJJPErSSvAS2Ba2x5aaOpWpB6rHkhOjcrM0ru0H8mCbtDJo9GH3fuVbV4puFl09BuS
 PwJJ5eJDvhVE2yV8DUBd5jt6odlcU3z1w6JOiOkZhk5foJhGFOVqoO1IFO3+XlcFDezuOs/v
 6akilHRT60cSlkwF83Rcv+ukQ+85CBPhOJoUkLUCdBPY0GwopNyIin8g6ZvccEBIBnO3BWA0
 AOSDUtKrOXBudZtotLImbqFv8GiFO4nRhhWGGzS7LCXMyjG/zX8nd8cAbjQJT2EDTH64qSvY
 +lR3srQCvxfkQYYqZd4HpZq0bk6u4nlqYhFw1k2B37MdVmqVO9teyHUwclVu6RR7bZFog/qC
 FmX89xXNLjVasPoFFkdeFgsYuiZjKxGnzDT6bI+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy2kgwL9KLriFI7GDdfHUPXpIuuoweHIK22BEgzUtPYMCEByL7iH1Vhw6g7qX+z
 ueouZf/
IronPort-HdrOrdr: A9a23:fzznqahXXOrwLHoKZ0X+e/YFpHBQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="58035065"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbzXn5/grQ+kx9VMpm+x/KE/gXhUaBNsqHhJCdtQqeRnwBqhJKedx/tkG1hPFokl9jWFqmxUKD1LNKLQeSiUdz1luS4NRZv0k/sx5zAVfoleIiDD6oBb7O8a6D72JgP1EFBwOZhXAU85COy6O+MPJBIfV23ZWVoENFbidl0QWNiM71pfl8FRYu1YkAFdap6q+KK7CWQrMFhSALND9B0AZ9XTJrd3P1ApSLdtPp+/NZQWSzn1b2XPpbEkUEdoD8D4sAGBXJC+4K4cltOrC7bYb5WRjb6esWwhmjU3tcXdSBZqa8pFDY2QeP3cGTp3dZgH2E2xEsQ4DlkaU5fsGZ4AXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj7o4Fh7oCvekEDVNRy0BKJMSfFuvp1kP7A2BNvLx2M=;
 b=JjCMjXTJQ3sRzN+Lnx/fHqnys53xc0HCCWmOGmT++6t9gJaf8xKFvVKqGoJYlCkAt+PH00wXNXWFupNYBwK/l3VzXB+3FxnP3PKSoSYDS7CrQUy3QXMfr+mUcDOGcni3T8PxXdr0R6rpbBVAbjEzu8opLugcTd6YiP3gpTeNQRyAMkPfXh2NBGjzDysl5XvGD7KCYZEF0w2+RRs7+AW0iuOAkHDH5EFJ2w5iZJ7WwXcgpfr9LFmLg3h70USmTz1kFh2LtZNcrVi2wlK5YOnwH1GVxK3KJwQUHz5YRM2z0uC5f8zse5OwJOYImcYMh+lOBLHdMML2ya+kCAD/LVkCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj7o4Fh7oCvekEDVNRy0BKJMSfFuvp1kP7A2BNvLx2M=;
 b=bctONmm3K4DAYM/rt5/gFpNGiSKhrFZ0Uv8dNjEbVhYlLDLchyLimiJ9eWSWfWLcrkw1YEL8/mXjnhKYNOROuP/s8U1xkRHAZYUqolW8Xt6A5shiKMHgkU76XK0mArgfF+n0Wlvqdo/4sQjQGtKCbsbzvbcYvC+Gix6Znr9q7Bs=
Date: Wed, 17 Nov 2021 09:55:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 Perard <anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Paul
 Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: PCI pass-through vs PoD
Message-ID: <YZTDkNRY5pMLFUR6@Air-de-Roger>
References: <b6d598cd-c244-2b7f-c731-fe839df3382e@suse.com>
 <b62a87ca-b68f-76fd-51c6-114e8b8e125b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b62a87ca-b68f-76fd-51c6-114e8b8e125b@suse.com>
X-ClientProxiedBy: PAZP264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:237::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c01a3854-2030-4cf8-f90c-08d9a9a80dc6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4219:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4219955A51242AA560EA8B6E8F9A9@DM6PR03MB4219.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6W5eZcBaNgMq7sXFrtXdj6Emq78RKumQFCzgzMw+DSU9GxiIdC2DG5ckjY74fGnO9N7RW+hXf8RGlR/uij+gyqzR665s5CiNqnu83Io//ZmEryB3qEYwBS971C0lzbcUBrWI6UZG3ZjFqO97Cza57OjcPDllDfuVXU4TAyIqRfEzh1Kdxe1j3Q3y7aK6U7fCiVJblm1cT2otgoDE6n8QPszeAbohefTwPfU+lmpTGhTFvadLxzpujEc6snHopjLOPStqWja4QOdcewUFgapdfvWPSgDmPuSAXIWRFAnUEXCt4fkcEgjwC+kxhnQdY53/lP/hhm3MDBQ8w2DY5f+xFQNZvIIOly+TVgMGqqhZ6niRTXmIzdL35rrszUPbr2l02UC8DePnPq96QVOyPZCRy3KkI6krVttWJA0o2G8Hsl76+p3tETroUM+uJN5J6THE0KFuqMqcHkZ2wdTBFxZCNNtntt/s+OVDQNiLEZRGd6RmnNoxGgV7HmiRdNqzKWWHRcG4VMlCZ/ZGyES4Jx3+GHvBWwsGFvqjBMeXp7zsSqFrJ+0t9GTpi09SdqB2Bja/ODD0QUtQkz7dSU4NEtZYWKBMIEjwCqtXNVAhTt8jlQYqrQUQW+WuQJJ4jHRIFfqh6Y+pVJTqMrI+XrCG80TjEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(5660300002)(6666004)(85182001)(53546011)(4326008)(9686003)(2906002)(316002)(6496006)(54906003)(38100700002)(66946007)(33716001)(66476007)(86362001)(3480700007)(66556008)(82960400001)(83380400001)(508600001)(6916009)(26005)(8936002)(956004)(186003)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEgrWU1USStnM3BiRVRZTUFReDJ5MWhpZWtxa3FRb3RsV3JoRFhLcTlsWGVz?=
 =?utf-8?B?anNSaldaVG5hcGx0SnVTci8zenZrUzZFYXJ6eWJaV3pHREFWb3Erd01FaTZE?=
 =?utf-8?B?aE1MZ0d4MmI1V1JMUnF4d2JkamVZOU04eTVGdVFRM3R5MDNubVFUVVBuWmRE?=
 =?utf-8?B?Si90STFDc1hycjIvYXlUWTRmSncrcUxDMk9KcHFLZ1pLUlBldjhmSzV4aEVk?=
 =?utf-8?B?NHdWY2xkbzEyYW9oa3RGaCs1aTlGLzgzeXErRGNKZDFiUE5VMHNqbFhOT2Mx?=
 =?utf-8?B?RmRROUx3UURUdGY2OHAzUDhXNDU3cnJjNGx0dktRMXRBYjY2b3JEVHJMVkJu?=
 =?utf-8?B?SWdzRzFJUktmL3NXcGtobkI0SStlMnRPUDI4a1hnVTRMbjRIV3NpR01XcXhw?=
 =?utf-8?B?bjRsekV4Y3cvUU54amEvOUJ0ei9ZdEY0ejljaSszZnJNczcrVFRjdlVrckxx?=
 =?utf-8?B?RVVXaVUzUStKV3lZKy9iMXhyaldXUDRaajZDcFFEbFVnY3VtN2hCQnlpQWdK?=
 =?utf-8?B?RTFRWmp2L1ZwQ2V4aExlbGhtV1RYZW1naVU1T3dsQW8wQVZSU1dXTm1ha3lx?=
 =?utf-8?B?STV5aTA5VFpnSEJOTnhzRG13cHl2dkt4NnFZNFdHMFJzM1JUblQ1SXhlL0pN?=
 =?utf-8?B?ZmtObFVhR0FhdEkrL0hEQW90MmpqcDRxOUNUdHVtNFNrS1AzaVppMXFUcGNF?=
 =?utf-8?B?VUlDdnlkTUYyTjFERUFrOVpYRjA1TW1YV0lLMXJIMENHa0VWVDU4YW8vbVJO?=
 =?utf-8?B?NWJNRElrdFVYdEVlRU4zR2N4cUZkV00raDRXMkZzdlBxSXQxZTNybHNTdSt3?=
 =?utf-8?B?MzRIQXZLb3ZZekxsYUdlMjd4cU5QNWhJdWRlZHJPYURLKzBPV1NSREhsNUZi?=
 =?utf-8?B?QTRsNU1ZRzZIT0swQ3lHSHdvTnBlaGk3UkMwOHNreGxmQlFPeEFKaHFLTVlD?=
 =?utf-8?B?N0liNXhoQWpXem1Kc1NVZWM1TEhCOXQ3NVo3UEpqeXdjTjI5RVFDZXlPclZy?=
 =?utf-8?B?bjZJS1NaaFBUN1R3di9zK2FtVU5XWXNkN3hMSUpSRnFrMU5jOWpxWmxjYmMz?=
 =?utf-8?B?MHlIcW1iYyt1UDVRdVRmVzYzOVhLaGM3cklxYTlXVnBUSFBKY2R2WDZlNXlv?=
 =?utf-8?B?aVVmVE94TzFab1JuMUVkTGZORjlYZzhEWEhJa1EvNW5Jb2hLMDUrWjN1WEVZ?=
 =?utf-8?B?dWJaY2puemhjdDB1RnR2eGI5blBUTFQ0ZHlpcFJsTWxhcWdvMENLY1hFWTBT?=
 =?utf-8?B?Z0N3a3BOU0txYjJiOW5tQXM5SWZVb3BnWDB6YkxuYVFwM3NRR25PMElidGU4?=
 =?utf-8?B?Rm9XbllneWpJNzFzbjQwbXZXSUxRTTlscFBWVDdJTHhwb2hBNFgzU25xK3dJ?=
 =?utf-8?B?NnB3eHJ5SXY4RTdZK0YzU0I4cFJQTWxGN1pBdGU0bXhiT3FsZWRZMXpmTVhH?=
 =?utf-8?B?TnArOGJrT3Y2QWsrdVBYN0dHYkVYQWRiMHptWm9rYVpOVHpzUHRyS0dlSVRt?=
 =?utf-8?B?ZThqSmVvcW1JK3dzVGw3TXVpU3RocTlFYk5BOXBzY0xyWTk5T1ExekdyOUdU?=
 =?utf-8?B?ZEc4THBiclBVT1BIbUFzOHlrOEh1eVpFUzdEL3p2eXFhYzRiM3Y5VFhKcGpL?=
 =?utf-8?B?akxpVjRCeFhhOG8zYjdXZ1hXYUJGVkIzZWZ1SE1oWTIyaEk0ZlUyZ21TWGVS?=
 =?utf-8?B?SVJIdTFmMzZIbEk5MVN0M2tkOWZMTEpvK3RFYW03cDlIU0h0ZFI1R054enN3?=
 =?utf-8?B?Zm5pV1J0aEhnVFVhTi8vTnd1Wkt4cjNBbStMazVQbzVLTDIvKzF5Mk90eFFa?=
 =?utf-8?B?Rm9TbkpxbVZ6WG8yakpVQ3VCM2FrbXJ3ZmpzRHFBVXZrTDlwckhLN3h5NEhB?=
 =?utf-8?B?c0REUGUyZ04xR2NFT0hBU2ZBNjJWYllCSFgxZHd2UU5SSGUxN3ZweE5TU0ln?=
 =?utf-8?B?eG5ZbEo4ZUxGdmhXcXlXdU9KUnNuMGh2MW9PUi9JbG9qNWZ4R2xXYWRCZm1Y?=
 =?utf-8?B?VUhBc0tLdWRyMEtzQ2R3RVREQ1RNb0RrS3ExaDRkNFNqVE8xelM2VXo5Qmx5?=
 =?utf-8?B?QkFPQkhhVjIyZnd4Vkh5NWEyUm5EdkliWUlFUjl1QmRrQXRxUXNKeTZleUxB?=
 =?utf-8?B?R3l2cHVlcll0VnZOY0dFY0x4QzlqRjh5aytiRVA0SnU2Mk1BSjVxK015WXdG?=
 =?utf-8?Q?GqcqD8gv81icYV9tzPPzPVY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c01a3854-2030-4cf8-f90c-08d9a9a80dc6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 08:55:50.2589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCWpVmLmquaKDO1f6p/7FGKB8wGOA9GZrVQsTuq+7/IyImurqyVX1Kq8tRryQXSCETvbVUd5EsmxS0h6UxIFcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4219
X-OriginatorOrg: citrix.com

On Wed, Nov 17, 2021 at 09:39:17AM +0100, Jan Beulich wrote:
> On 13.09.2021 11:02, Jan Beulich wrote:
> > libxl__domain_config_setdefault() checks whether PoD is going to be
> > enabled and fails domain creation if at the same time devices would get
> > assigned. Nevertheless setting up of IOMMU page tables is allowed.

I'm unsure whether allowing enabling the IOMMU with PoD is the right
thing to do, at least for our toolstack.

> > However, when later assigning a device to a domain which has IOMMU page
> > tables, libxl__device_pci_add() does not appear to be concerned of PoD:
> > - xc_test_assign_device() / XEN_DOMCTL_test_assign_device only check the
> >   device for being available to assign,
> > - libxl__device_pci_setdefault() is only concerned about the RDM policy,
> > - other functions called look to not be related to such checking at all.
> 
> I've now verified this to be the case. In fact creating the guest and
> assigning it a device while the guest still sits in the boot loader
> allowed the (oldish) Linux guest I've been using to recognize the device
> (and hence load its driver) even without any hotplug driver. Obviously
> while still in the boot loader ...
> 
> > IMO assignment should fail if pod.count != pod.entry_count,
> 
> ... this holds, and hence assignment should have failed.
> 
> IOW this approach currently is a simple "workaround" to avoid the "PCI
> device assignment for HVM guest failed due to PoD enabled" error upon
> domain creation.
> 
> I'll see if I can find a reasonable place to add the missing check; I'm
> less certain about ...
> 
> > and all PoD
> > entries should be resolved otherwise (whether explicitly by the
> > hypervisor or through some suitable existing hypercalls - didn't check
> > yet whether there are any reasonable candidates - by the tool stack is
> > secondary).
> 
> ... the approach to take here.

I think forcing all entries to be resolved would be unexpected when
assigning a device.

I would rather print a message saying that either the guest must
balloon down to the requested amount of memory, or that all entries
should be resolved (ie: using mem-set to match the mem-max value).

Thanks, Roger.

