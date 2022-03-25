Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA4E4E722E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 12:32:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294676.501162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXiAU-0007KQ-NK; Fri, 25 Mar 2022 11:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294676.501162; Fri, 25 Mar 2022 11:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXiAU-0007HI-J6; Fri, 25 Mar 2022 11:31:46 +0000
Received: by outflank-mailman (input) for mailman id 294676;
 Fri, 25 Mar 2022 11:31:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r7I=UE=citrix.com=prvs=076f4df05=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXiAS-0007HC-MJ
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 11:31:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23317380-ac2f-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 12:31:41 +0100 (CET)
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
X-Inumbo-ID: 23317380-ac2f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648207900;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Pxi1JVQz93/o4clOr6M1/W2kR6cix9q/3JqcdLa9WYU=;
  b=CrWqxTTsUwF37VSaa3ufriBsceCO3+8xDRj0r9t8tZj9BPXFvHe+UwUJ
   DmocB2h80cW7NzXr5wABtxZURx2Q4E3EfG44GSak9H4t5FbPLYCauK57/
   WK48MKDMrD6wYPdNoMnuE2d53K9lYbzkKTcgmr34QAkLANIHgKZePScH6
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69535840
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ObMR+6gEDf036/Fnd7opGA5xX161jRAKZh0ujC45NGQN5FlHY01je
 htvWGGPa6mOYTOketgkPNi3pkkA7cfcndZnSQRpqy1gEnwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFnQ4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YR5yFY7Hwu8FaVp3E3BmBeof6I/OHHfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiPO
 pFEOWY3BPjGSy99FgsvD4Nup+SHgnP+XDBxk2zWgrVitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRAAweNdGZ4SqI9DSrnOCntTjgRIsYGbm89/hrqF6e3GoeDFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGS3R9z0RDWko3qJuBENVt4WGOo/gCmRw6/d+ECdC24LXzNFQN0gqMIyAzct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi+QPu6lq0EiJFIw6Vvfo0JulQlkc3
 gxmsgAn3J4whpQAz5/40lCWmwrr/4j5RzM6s1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZVpxCIUvIT42NuhXogjxmO8kZmOivpn0GWKJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35ilTqOGM2lnk/9itJygUJ5r59cYTNiichjscu5TPj9q
 Y4DZ6NmNT0BOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+zvlOQwkc5wvq6ep5IeRNxv0N/s+Rp
 y3VchIImTLX2CycQS3XOy8LVV8adcsmxZ7NFXd3ZgjANrlKSdvH0ZrzgLNrIuh9qL0yl6Ico
 jtsU5zoP8mjgw/volw1RZL8sJZjZFKsgwePNDCiez8xY9hrQAmhxzMuVlK3nMXSJkJbbfcDn
 oA=
IronPort-HdrOrdr: A9a23:aezSlqB83Tgo/0DlHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,209,1643691600"; 
   d="scan'208";a="69535840"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPQ66o1JvfQ8FawgJHLkYRT4xS1KC+hoE5dLd8PfKLtzpcEZQRUe9+7COfQ30HCVAdneX8Yh4ybDkldF5/k+YhN98bwWktsURms2dQPitdDVLSt5Fjsutlt/+wVZQE3DMcbKuvrjobRJA0rvktNEycTjvy/bb6WRxISRzFJYzwUc3OekSWqA3lcpGGvufguioT87Zf4+MVKdRUteqPrTzyiIXfnvPTMKiKfT5sykinGEBue8q5kgq4f0qUqRxaFFWBPW14HDgt9hlJKwHUT2CBeCLSRwWb45qY7wEYscV2GZurHDtbYNrXgQy4kCZJBP4AFmHI4ijNJbZ48kAZdKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fosfs5vUjWHTvLAzYtlPvmNsVRl3S4Imxe/iMzrZxTY=;
 b=SZHaSC4xXmCgRs+8QJI2sluca90Bj1qRgjO23FXTs9RvdIdcll4oMkkzWXBrNoSWVB0IWfY98mHnx58U4ooXLJMC1TOGaGsSHz5wqOZifd2dEJDYtebpi0ACjmmZ8g8ur0z4B7WaykesHwRFPL91q0mNcn9SR3ZhmiykyN9s/bSBcG1C3n/IVkZCpD/rE0X2YO9WTVdCXsGngpGvLE6GodLUHBs6WCeyxEtV6TBD4FbRtZ5zx/H+WO34xHHi/b2DbppF2wWSEFyms4BBpzgY71rmjnwdwbJAtRU8CWdlbKK3ASU9xjI+4oXChBB+8TPbN/naqe5FEaCcB3R00dP4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fosfs5vUjWHTvLAzYtlPvmNsVRl3S4Imxe/iMzrZxTY=;
 b=jEHB3rCsqPlIXUVlSGE+2vRCYAVcifw+32Ed5pTjRtNGSwie5yvIBJhChcHzGvWwOnA54o4GiJP2pFs/Ki8SBaDub0b2/RnXx4reMAimSkk01/D5UYwyOuwfX+Qwxz8NPN7bEa70YjvwMSIpVJduSbn9bmyc0HCaOvjnu13Ld0g=
Date: Fri, 25 Mar 2022 12:31:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] x86/mem_sharing: option to skip populating special
 pages during fork
Message-ID: <Yj2oE5uFPNDMszFk@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <Yj2ggiWlxvYdh1dJ@Air-de-Roger>
 <CABfawhkeRENvEJHtXCxME08eMjjAGNVdcBK8ExxgcXY=SzXStA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhkeRENvEJHtXCxME08eMjjAGNVdcBK8ExxgcXY=SzXStA@mail.gmail.com>
X-ClientProxiedBy: LO3P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 519186e3-c523-4450-eebc-08da0e5304b0
X-MS-TrafficTypeDiagnostic: SN6PR03MB4367:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4367D2C072CFF5D516D9954F8F1A9@SN6PR03MB4367.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DfgreffcKZi4ox1OPrSsWK9nLa2N6CWGo16QsSZKf5mz4Rd38XzO4t46UX5A73HFnPfbutnbOwJCWBOBqk6t4FdXHLSIHC0i8ArAg02TQksIjZkL22BqtvpZMVYtkfwj8HrV6ZxgBqzkOXDuMdVMZ0l6dtJjZOQwTyALz17bQNvfmM6SA2BJIT4L0WpT+/Sx4+evC16XEeckpJ8q+RpFqtwLoG4TjWyM0aWUuuYyEQmY4QPP+KAX/UEXQ+JBaewt7buOl3mEC4rtxHIZXDWrrRrBXaFWl2y8WSaMg4Ig7Dnu459Fz/BVLLmXKvwyBOHLnNXkYQwePuBHyrVQuNoUIX2dWAsAPbQ1K7nS+ogWvNlTeHN6eNGvwEQgbrN5MzELQ/UGSrGXUYBzgyM6QATi/Hwzs+wF0Fi76T2mCo+w4h3+O77WSPDvNHEx7AlMO8x7II5imeYgtf0wniI20f8mHUi51Lti2C/7B8xoSsLZZYUfbVKKCjWGUjYISJ1DBv/r+Y6fx8bs2pM8PBjli0FKt02qHVJohEMvr4y7+5vmQ0GMy5rgDzAYc+ZjWsdIDssOCa006zVyfITBfXZ+Hl4M1RNBYE5xKJEE+4kB/K/2rEe9KFcX0EJSE2BEN42t+zccjix/UwkyogIfisuDZb0NiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(4326008)(66476007)(66556008)(66946007)(6486002)(26005)(186003)(5660300002)(6666004)(6916009)(2906002)(316002)(54906003)(85182001)(83380400001)(8936002)(6506007)(38100700002)(82960400001)(508600001)(86362001)(33716001)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2l2eDcxRXVxZk84YU5lQ2Nzelg2S1NsMFBLK29DNFhId3ZWZW1HRkpaZjhl?=
 =?utf-8?B?ODFxNGRoeWxDYmdUWWhacGRxRDM1cFBjMVc5OUcxTUF4c3NkZWsxZjEySUsv?=
 =?utf-8?B?TXFsRWxQWml1d1Z6cU9DVTEvcjkxK3B6aHlXeWtNZkdTc0Q3Y0lkdUo0eXJC?=
 =?utf-8?B?Wm9rMXNuQzdhNmJ5cHh6MlN1Y2hKdmZ6TEE0Y0RjZ216OVRHYm1MMFhGRXQ1?=
 =?utf-8?B?QnJ2SVpUdzhwRlVUdi9ld1FjMTRHc1BKdk5CSjVVdFpqbEUwUXJ6ZnlOTGZ0?=
 =?utf-8?B?allCR0JWUWgxTk5BT1FqbkxSQllqc3MxZExPSHhZMnFsM2FmMUZTS0tKY0lQ?=
 =?utf-8?B?S05jd09jMm15cTl5K1graDI0SGlWOGJMdWE0NTVVY1NiUFp2ZWtHUmd4QVVD?=
 =?utf-8?B?Wkx5L1BqQmVqdXJmK1djNnhEbjg3L0ZPamxnMnlRVU5YNXFWS1o3ekpDQ2cr?=
 =?utf-8?B?b3haVzV3d0c2dktYZExaWDlsN2RwYkR3RzZUZ0VueG9OZ2hFSm4xVnpMUFdV?=
 =?utf-8?B?WWtJRjZnemlvbWd4NlJSTFJuWXNKdHlIZVcyMW1nU1VJeG4vbzJGc25HTGpK?=
 =?utf-8?B?S1FYcll0RmN1T2N5eVhicCt5UkhTMkRpaEhIdE9RMzQzU2RMUkt4M1c3YWhZ?=
 =?utf-8?B?QThZT2FKdy9ZQmtTRzBlamIvN2crbUtiNm1XMVl1bi9EdUpLcHBsSWlKVDJE?=
 =?utf-8?B?RWtieUJXR2RtdzZDV0R0VElxZkZCL3k1SDlFYW1aT2JsTmh2QnRRYVhFNzN2?=
 =?utf-8?B?RzdpZVVLRC9GVUhkTnVwTlh6SjdoYXZoSjdWU25LWE9lZmJqM3gvU3FwREts?=
 =?utf-8?B?czJaaDM5R0VaQ1R1b3ZrVkZ0d2twQlQvbTNrOEF4VnRORTVsVW4vSitkOTBt?=
 =?utf-8?B?UTJyclE3bjZrZ1RCUEJJaDlKVHVDaVJHWXNqZXhYMFdabzBxbzhKb0d0M0ZC?=
 =?utf-8?B?ZWhNeEl2V3lWYVA5eEUwdVloektmcnFmVW9wTFRaM3k2M0lYMW9sOHhNTkdU?=
 =?utf-8?B?UEV5UXJEd3JZNW1DMS9aUjJ5WCtodmt1NE5TTDVIVDJvWGlhV2tFalZDV3BS?=
 =?utf-8?B?MFRUTm1xSEtKeldlRDlIQjFaY2czZTMra2lrNkt4OVFHMVVMc0tSVkZ1Wms3?=
 =?utf-8?B?OEhvbEllOER1MlFFUW9NT2RwakNla1kvNDRyeGZHOXJNUG1VRlRnc3orSEdl?=
 =?utf-8?B?c25ZWnBpdWJsbS9vN3lJUldwNWRhLzBFN1N4SnpIajg2NXM0NE54d2U5bmtK?=
 =?utf-8?B?azFwbVhqblJzdnQ2NUtWWkdETXhjNDBFQ0Z6eUlmSkl6Y29sYjRKc0xBOTda?=
 =?utf-8?B?dGFMbTJlS2M3MHBwT0ZoSHR1THJZaXZ0RTRya2VsbFd3U094RjFtM0JtY2pE?=
 =?utf-8?B?azZwQnpnN2cyR0E5WVFYN2VwK1haZlhkYmRveVlNVzJTcitIdElsVUtSVFJU?=
 =?utf-8?B?TG5URVJTQ3M2SkxTVERNOTRyL1MxM1lKS2JDOWw0bWN4ZTkrY0dHcU5JSzd6?=
 =?utf-8?B?TDE2UndKZVdTdWI2eUwrNVUzblBsVUYvNzRxa0c4VmpBcExRcm9zV2hCdlhs?=
 =?utf-8?B?UTVCWnpvMHQrL0M5T0s1VjAxb0xzR3BKeUp2VUhSNTFkVnRMZ0xhVjJrRGht?=
 =?utf-8?B?TFlMeUdEVXBzdlNSQlR4SHhTT0d3elh4S0ZxTlBGcGVVMjQzbElaQW0rc3hC?=
 =?utf-8?B?K3ZheXpZNm41MHoyODZuK3ViVjlGWXpMZjB4UHFBeEVJcUU5TVlZNFFXSVFl?=
 =?utf-8?B?TkxGcHRQcmQ2a3B4MGpPSnF2SUVwSWRlbHdHWHNUaE02VzB2Z3BsZlFDMWVl?=
 =?utf-8?B?eERHeHBzYTM1dUlnWTNjNnVIQ1FFZUlrT0lXK1pWYWdUc1o1WC9Kc3hKSTFu?=
 =?utf-8?B?bC9JeGV4eWdkWEVWS3hxMzVBYWptOUZFT05pZlNReHdiL3RhZ2EwWDhyK0FT?=
 =?utf-8?B?U05iSGVLcWFYd0R4NmdseTNhUE14R2lGYis3NTlaQzZQZms5QmZUUHZHSW84?=
 =?utf-8?B?Z05FejlHZVhiUjlvalR5UTNPbE0zMTIrM2pkWHRlNzJ2VGIxeUtFaXI3aGJv?=
 =?utf-8?B?RlUxSU15ZytjU3dNQnBXbS9ZTU16QVpNMWlWTUVMMU9iaVRYQ2FOOXpCUito?=
 =?utf-8?B?NWhUV3ZFVGR0RlFzdnlJVjJvMmtNL0xPc3NqckZYQ3B0dmkvSkJsRUovQk9m?=
 =?utf-8?B?R2xlZHNYbmJ0T2JxMGw5UVR6RU95TEcyR1dDayt5aU1OazJ1aUtCSFdlZUw0?=
 =?utf-8?B?NEUvQ2F2K095dVpJWWJjQkdUelBGS2Y1anZtanpGT3JpeXB3WUxwa0s3bWRU?=
 =?utf-8?B?aVhqcURRaDJXWXBTazI5UkRjV2ZhcHZyV3U0RlR6RnRTazlPeW1NaUZqSldD?=
 =?utf-8?Q?OwNVctnM1crBFJ2U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 519186e3-c523-4450-eebc-08da0e5304b0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 11:31:35.1687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szoHEHUobhr9kNYtP95TabSVMQN9NMxGePHy7TlkzLdfDjMPnwHCH0+AS+UklfUKLh0+gue7olgG0zuhjhoEww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4367
X-OriginatorOrg: citrix.com

On Fri, Mar 25, 2022 at 07:15:59AM -0400, Tamas K Lengyel wrote:
> On Fri, Mar 25, 2022, 6:59 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> 
> > On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> > > Add option to the fork memop to skip populating the fork with special
> > pages.
> > > These special pages are only necessary when setting up forks to be fully
> > > functional with a toolstack. For short-lived forks where no toolstack is
> > active
> > > these pages are uneccesary.
> >
> > Replying here because there's no cover letter AFAICT.
> >
> > For this kind of performance related changes it would be better if you
> > could provide some figures about the performance impact. It would help
> > if we knew whether avoiding mapping the vAPIC page means you can
> > create 0.1% more forks per-minute or 20%.
> >
> > If you really want to speed up the forking path it might be good to start
> > by perf sampling Xen in order to find the bottlenecks?
> >
> 
> Sure but for experiment systems I don't think its necessary to collect that
> data.

It helps weight whether the extra logic is worth the performance
benefit IMO. Here it might not matter that much since you say there's
also a non-performance reason for the change.

> There is also a non-performance reason why we want to keep special pages
> from being populated, in cases we really want the forks physmap to start
> empty for better control over its state. There was already a case where
> having special pages mapped in ended up triggering unexpected Xen behaviors
> leading to chain of events not easy to follow. For example if page 0 gets
> brought in while the vCPU is being created it ends up as a misconfigured
> ept entry if nested virtualization is enabled. That leads to ept
> misconfiguration exits instead of epf faults. Simply enforcing no entry in
> the physmap until forking is complete eliminates the chance of something
> like that happening again and makes reasoning about the VM's behavior from
> the start easier.

Could we have this added to the commit message then, and the option
renamed to 'empty_p2m' or some such. Then you should also ASSERT that
at the end of the fork process the p2m is indeed empty, not sure if
checking d->arch.paging.hap.p2m_pages == 0 would accomplish that?

Thanks, Roger.

