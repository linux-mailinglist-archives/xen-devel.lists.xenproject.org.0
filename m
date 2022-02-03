Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E54A82E8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 12:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264624.457780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZxJ-00025J-9b; Thu, 03 Feb 2022 11:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264624.457780; Thu, 03 Feb 2022 11:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZxJ-00022n-5t; Thu, 03 Feb 2022 11:07:13 +0000
Received: by outflank-mailman (input) for mailman id 264624;
 Thu, 03 Feb 2022 11:07:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mjBt=SS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFZxH-00022h-B7
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 11:07:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cf0c918-84e1-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 12:07:09 +0100 (CET)
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
X-Inumbo-ID: 6cf0c918-84e1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643886429;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=6gqfhiUC3uEYxiFm1iVa9AhPNmJIT0SxLUG9WgrR6fg=;
  b=Ki45S7XzpELP2tn8xwuzWGieH9zUkLo0zPfNMhBcD/Q5XIVrMgnmwkTQ
   3RjJwAV5ydh3GQEBpnpKYagVtMImPl3ogs+Yu3aLsOJ9bWV2qU7LZDfp8
   98uwO+2avSqYxxxdZ8B3crQ9IVjf6VW5tl9ME2iOc/UKR0QzzxQyrlAIY
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zc/e1xSXd7H23wfpbfm+gGkOMY4Raz+4duQZ3cT/ZufRMejuruiWXhg9kOo04C6BbUo27y8y+8
 +hXasrt2slp0yPiUiXFqWIPzD70V9Iz1yyqvLV5YzzL5pRHFSJCNhGdvh02XERP43ZDEhUuAie
 EdE0sI0tSe7UB/WPH8RNE75GY8cPCq0vaPWjnf5+SXbaokTcNWITzISvAV4etYQi00jvkiyDwY
 v3dDm4uK7Z+L51b9w0Df178EH3dkP5aiwQr4ShuZBUMWUY/5jMr6gh3QDpJw659gXHfiLrERzN
 uoAtWtUFkbBT/XSL9+I0/IDR
X-SBRS: 5.2
X-MesageID: 63316582
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:U1GYPqOtYhc852nvrR1UkMFynXyQoLVcMsEvi/4bfWQNrUomgz1Un
 GNKC2CFbquON2D8KI0kOtni9RgB6sWAzt4xSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500o4w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo3KAw9Fby
 uxSjrHzTSA5L5zAqLgbczANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uRvoYGgWdq7ixINfbwS
 8RAbydeVQWaUzBTNVEUGLV5hd790xETdBUH8QnI9MLb+VP7zgNr16P2GMHIYdHMTsJQ9m6ar
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24mahX/pPJ
 kpS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9inKw/bVyQSgGVMpDTpmeM0XuP9qQxwDg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYn
 mjSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR4xLpVZX1qvHfVKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJWS5O
 xKN5FIKu8Q70J6WgUlfOdnZ5yMClvCIKDgYfqqMMoomjmZZKGdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6j+b2TCPLGN8tbQvfBshkvfjsiFiEr
 L5i2z6ilk83vBvWOHeHqOb+7DkicBAGOHwBg5cGK7feclc6QzxJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXdE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:C6tGeK28TAc6hPDECQqj0QqjBVxyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJk80kqQFnLX5XI3SJjUO3VHIEGgM1/qa/9SNIVyaygc/79
 YfT0EdMqyJMbESt6+Ti2PUYrVQouVvmJrY+ts2pE0dKz2CBZsQizuQXW2gYzFLrUR9dNIEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfTHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+02VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qb5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 129lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ9o+a87bWPHAb0cYa
 lT5Jm23ocUTbraVQGVgoBX+q3jYpxpdS32AHTruaSuokxrdT5Cvg4lLfck7wc9HaQGOux5Dt
 T/Q9VVfY51P7wrhNpGdZw8qOuMexrwqEH3QSuvyWqOLtB0B5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.88,339,1635220800"; 
   d="scan'208";a="63316582"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGfm22tRJLh7uxWz15Igp4jdVgPufhxyoHAjDl6NhV7G41fGMd/vsa9GCvRc51nKuDTHQDK6g0YyJ8vnfKNI6R/0TPzuTvwFX2TlG2uDh1sfP8XCKfcK33Yx0nEr1LQjCQZg7mq7vDm/WgTO+9sSAZ7R77gw+vBuGn9wUxVRer2Bn+Zm1H9MT1MA+27lm4MdVIZc2sRnJMBttff53qC6bajCpkQEHM80jywuMckwHVQmbPBYLkhruap3XUltodp1gsq6HLBQ6cDWj+kxtWYjdT8xBUwcLdq+3ddNV6CT+neLfbX3015Yi12YMZCTOF0Rh48tWgv+LSqlKk4KnREIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGGgEMiYSdtDhYu8CkqWA9Ie6XCQvmc1RhXhlaBA9v0=;
 b=b5o6MUAZTIGuLHzPndR/QZsLPUdgvXicDZ4IXXAWQOkS35mluMr86kivUDiF5t5la726xZ6M+zRip/h9zR+eT4P6ZgKHHKo5c3J5jOwaG5WQQgYKRvZJ7GKgc6lyVh43w3lQOpWnvb9rAzNHk1nn7/QGKKAdpgdJKbuZxDa9wG6zYLE6CldFy58ERlctSi4P0hUHDyVOLYyULdFUaeXsm20T/8ENn84xQzwYuLpisYr/8DamxwqlflcBdxdJBdyjMSJ2kxDjhghvzeWDHtVPXVScgolqXC6SsEZi7ezrWx1Z74qMppv1WM0u2JAtx/IyCkqTaxBtU360bQNNyVgsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGGgEMiYSdtDhYu8CkqWA9Ie6XCQvmc1RhXhlaBA9v0=;
 b=W0BprREW613xMEHQAbxYy4G6g4mYxxoRaX1AvkYp7B9/sP/zNvjZn75P3Yo47BOE6hV+Q2msdNyUfCiTPxH16IQVTj6c9N5/SnuE6K8LmpldoxwqpQtM5dKkBjEA+o+01B9v5+Xm0nHzcPkUUyQ1nauROGsuOI9T/8Bwhghyajw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: [PATCH] tools/libxl: don't allow IOMMU usage with PoD
Date: Thu,  3 Feb 2022 12:06:51 +0100
Message-ID: <20220203110651.17419-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b9aeaa9-a813-47ff-1dec-08d9e7054daa
X-MS-TrafficTypeDiagnostic: BN7PR03MB3666:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB36662A8B00BAAFED5004B4E38F289@BN7PR03MB3666.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fy0Qa+XGVYkRLb+WCMpzOKP2B42o9Zfhq9iXBHbcDACKF4JL7QSsEsPOIa3u+SPkFCsw/HGjX5/H86ynHxl+bflwgIVC5jf4LFBCdLTloo6gZwnmaSAw+gRRShRR7pQoBA1v6/BnwLgbi4FjgTCz+xMtdeE8OqZWOHnnXoS5f90oGQ53PpCk/Lsoa/ee4ub1aV2eOq2QDLOwUOClpwww3hWaaRgEb0ywCcBMWJ9G7izP12G4yFXRqLZRbT0N7Lfkjg2lSVuuWjzuR2dQVq/KY5wiJn7mhi5mfYLFmb+ztbl9Y0wogb8tzHRc2oRhY0tyAMhNXDJDyzQCxneMRHPuE1V5wjFWr0BZcOxNqc2ZanHrLGY2OdFeu22dFBp/bhK2PvkF0+iEJT23glOPoVzjNX7hFmgdMQgiq0gspQ/ESzUIvBXsy7L2O2GCMHpLSAhDpuHzvpCe/QoU7BgRWnP9qEyzJNH9JcF3zYa4jJOToxtvqoWwK7hw2faukXC9SIi/mkyhdNGzn+JZvChiqYJjfjubgwjr0cKMIcgx85wNtSXpzZSkYYrz6ahxpHYDBwhBj9oUlnPVpNSx+HJ3OX0qbggjoLr6scoVfsXFbQu42WhfOQ1Qcq4ABR0Hx4+ifQd46ZyRqN9V36ykLSrVv9VkUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(82960400001)(8936002)(8676002)(66476007)(66946007)(66556008)(316002)(38100700002)(54906003)(6506007)(508600001)(6512007)(6666004)(6486002)(6916009)(86362001)(1076003)(2616005)(186003)(26005)(4326008)(36756003)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVFIelR1aVJqQmFucXV6TVQ0OWR3QlhhRWVQeWdmTFlFQUhZTWJQQXkyLzFl?=
 =?utf-8?B?bFJiUGk5R3N4YW5lN3dBa1I3dWh5SDFycWJuWUJCZlJDSFpKQjNpbHVaTHJW?=
 =?utf-8?B?cllhQU02T2MvUjJlOFd4UnVoZVVub1IzR1J4NmN2ZmFCeTh3MEpyRmFqakpD?=
 =?utf-8?B?aHRzS2E3Y2pvdW1XY0UvZzRqL01zaUlySi85NE1jOGROQVp5dnI4L1QxWlBO?=
 =?utf-8?B?UjlyRUMzbTA4ZjdiT01LQ2ZhQktCYUdMZWZNTmZBczFPZDZSOTRvNFNKakFI?=
 =?utf-8?B?aktObzhRU29IZ054MWVLeTdVREVCYk5tZzc5VURUaEN0ekVyQk5xZGtXTjg2?=
 =?utf-8?B?anZmaDNPRWVyT2ZrNWtaaXgyRjJIWm1ydklNdzFNdWNNckIzVkZyaGptaDBT?=
 =?utf-8?B?RHdXaUZKMTF3TW9TOUJ2TC9qT0xydDVjRXlnbTdwUUhTTFFSaGxMYnJUVUkr?=
 =?utf-8?B?NkJwT282cEIxaEpyZ3FUQWx1RlZNMkE2UVBjWWp1RjhpbWliLzBrZzNHdkFh?=
 =?utf-8?B?all0THJMT2VzVEM4VGM4bmswQlhBU2hQb2Zzb3RKdVRnWXhmWU1CVkNaL0lo?=
 =?utf-8?B?MjRXNExsSEdpT3plbzU2NThMbzZ2bVlOZFZOYmYybzcrbDJtRlVsQVRodjAv?=
 =?utf-8?B?WitZUDlLQ1czemNBOGVxTldLNGJLUHdaa21jWTJ3OWNTV2hjcWxtdlNGSmRR?=
 =?utf-8?B?Y3RkaTBKVHV3U1hIekRFa0w5NE9tbXRjT25BQnN1U3VUaUlvMUtoNGRIaFlL?=
 =?utf-8?B?V21NYmw5ZDhwbFVMaFYrS2FBYmpXRVJ6VXVPMVE5UHdpOUpGdUVWVnVaTitx?=
 =?utf-8?B?QWdnc083UU5Fb1ZrTks5blNYNXRsT0JuTjNmNkYraDlkMWxGTk9NQThYWE9B?=
 =?utf-8?B?QSs3V3RzMDlrbTJ1eEU0YVU0Tk0yOWQ1a3VVcWRnNGhhRUJ1R2tsK0ZTaGEz?=
 =?utf-8?B?SWY2WGE0emdkUEJnMk80ZmdBQUU5VFNDTkpzNnppVUtkdDQwVmhVeUxUK1pK?=
 =?utf-8?B?amxuOUoxZlQrVXBPanVEL2tCTUtjVFBGZGp5Y2J3djIzb1k3V1k1VVA3L0E0?=
 =?utf-8?B?QXViMHo4bVlXam1MREo1YmhKcXlhMmdid3pFSHRCdHZrOEFzOW8xdE5uT3Jo?=
 =?utf-8?B?Y3QyVFJxTG9PMHBnR1M5TVVwWjZBWDFxclh1VlVXU1RNWlRzSGNnYndoSzND?=
 =?utf-8?B?MzVpaEw0Rkw0OWdlQy92d2FlVFM3WnB4ZXlucU8yajQ2OUlUTEFXckdMaWZV?=
 =?utf-8?B?V1R2cWJ2UjFzblBOeWREaStHTHRPSWtlWm8rOVJ6OEdpUXc5RFdZZzB3clFO?=
 =?utf-8?B?MXlvdmU4QzkwRXdvT1YxdkJNRWZpM1kwQ1lQUEFyVHRkUWZkWGRTa0kvL2Za?=
 =?utf-8?B?bkltcEQ0amJRSk9TSTRSMTgvcHZkV09ySXUvaWtub3JMdlNFRkVXN1FOZjlJ?=
 =?utf-8?B?V2oyck05RTlHU3p2RTg0Szl1cjZFYzdtdnR5dHBqdnhJakdOQjFKYWkxbnlZ?=
 =?utf-8?B?NGVkRy9JOUxKT0NuYlI1azJrQ1h2U1Bxb1VOUklsYVE1ZnJKazhYNkZRbDhE?=
 =?utf-8?B?dmFNaVBPZ0VzdDhpMUhQVkxNcTJ5OWlhcnZBWUJYbXpsYmNJRzJCY2laZGpE?=
 =?utf-8?B?R0c0SGE4YjUvUVZoT1k5Q3g2Y3J5TVk5TjN1V0NSQ2lEWUZzWFBqUGFMM2wv?=
 =?utf-8?B?SXN3UVJGOFowVzFHbE0xVytIY1dENnAzcW91KzhGSTNmcVBieUZDZ0pwaHhO?=
 =?utf-8?B?Y3BuTTVtWkx3T1VqVHhoRDZiMVBYaFJYY2pOTlZRU1dKUjBjQlVuSVplMTFW?=
 =?utf-8?B?MlRZRlVSWGdlTndzK3p3SEZlY3pNZnNTUCtOQVNpWVkrc2hianlkYWpDZk5B?=
 =?utf-8?B?QmMyc1o1U1hwaUlCR0ZyeGpzbXpPVmEybnRtM2N3YWhTUjM0RkZ5UE03TGF6?=
 =?utf-8?B?MGljVVRRRUxqU0RVOXhIVGJ1SDBPVU9NTUpEQ1k3L3JWSnEvbW5UUFhSdzhu?=
 =?utf-8?B?QTJUNXpvTGxVUm1yWm1mYWRVNDJhTlNmL3Y3eXd6M1hMMElmUkFRQ3pZZjN5?=
 =?utf-8?B?anEwV28vbENuaU9MZE9SKzB1QVVRcWNHUm5RcEdWWXRwNGJMWVFUcDh6aFd5?=
 =?utf-8?B?RGkvQllCek9xL2YzN0VpRG82dy93Qmd2VXJUakZacHNLTXhXZ3Q5WjBwOWp0?=
 =?utf-8?Q?6Yd9WQBFq0+SZWIYZ1iO0sY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9aeaa9-a813-47ff-1dec-08d9e7054daa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 11:07:01.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRUUGquzdRmoHrLxN3hcB660DquGG1J7Ju9kbFB0jLVc3q4r1LvuLJuQqnXQVIz2Opb+YOOmHZ8uqu2YWDXNgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3666
X-OriginatorOrg: citrix.com

Prevent libxl from creating guests that attempts to use PoD together
with an IOMMU, even if no devices are actually assigned.

While the hypervisor could support using PoD together with an IOMMU as
long as no devices are assigned, such usage seems doubtful. There's no
guarantee the guest has ballooned down enough memory for PoD to no
longer be active, and thus a later assignment of a PCI device to such
domain could fail.

Preventing the usage of PoD together with an IOMMU at guest creation
avoids having to add checks for active PoD entries in the device
assignment paths.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
---
 tools/libs/light/libxl_create.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index d7a40d7550..7499922088 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1160,17 +1160,16 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
     pod_enabled = (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV) &&
         (d_config->b_info.target_memkb < d_config->b_info.max_memkb);
 
-    /* We cannot have PoD and PCI device assignment at the same time
-     * for HVM guest. It was reported that IOMMU cannot work with PoD
-     * enabled because it needs to populated entire page table for
-     * guest. To stay on the safe side, we disable PCI device
-     * assignment when PoD is enabled.
+    /* We don't support having PoD and an IOMMU at the same time for HVM
+     * guests. An active IOMMU cannot work with PoD because it needs a fully
+     * populated page-table. Prevent PoD usage if the domain has an IOMMU
+     * assigned, even if not active.
      */
     if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
-        d_config->num_pcidevs && pod_enabled) {
+        d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED &&
+        pod_enabled) {
         ret = ERROR_INVAL;
-        LOGD(ERROR, domid,
-             "PCI device assignment for HVM guest failed due to PoD enabled");
+        LOGD(ERROR, domid, "IOMMU not supported together with PoD");
         goto error_out;
     }
 
-- 
2.34.1


