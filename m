Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6A450446
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225845.390111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmaw7-0003wy-W1; Mon, 15 Nov 2021 12:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225845.390111; Mon, 15 Nov 2021 12:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmaw7-0003un-Sc; Mon, 15 Nov 2021 12:18:11 +0000
Received: by outflank-mailman (input) for mailman id 225845;
 Mon, 15 Nov 2021 12:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmaw5-0003Jk-Uj
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:18:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 171fc9a9-460e-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 13:18:08 +0100 (CET)
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
X-Inumbo-ID: 171fc9a9-460e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636978688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7z1JPGMnhV7uL/wfP7hPi57McTJLA6tOf59rupDkB/c=;
  b=hP0PkOGJYkr026csnR/SyfG5h2Rn04bVWlZ+IXLHzNTZx5prAcPwWves
   i5hUD1tkLQx02B59EBS9TbwEk8XGvHV+yasGm33mbAjdRwo0ZtEwJrKql
   YDwCs9lN0jFXYtNXlc6ccRNwBVAbzd+ZeX72cUyfk7uQMimE8iuHoQ6IW
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lnaTf9JugqIw30lczTknGZlpRRvsV2eiy0fgwzRCPqzA0CnwRKGiEurgF0BQS5N52jP+qmitVw
 NMRB0Pw7ZwH8mWSE18cFCy659WmWXiZ9qCgwqqr1wL8ABX4eEO3Bhq0KWRJgA3QxO/Kh4pPANv
 LLWO+U2FzPoClk4AExa0um748k+EcQlsJUPrJz366NW7IRU2VWM/xC/yCXzBnTOdtud7OO7Leo
 XhS5fpoNcZOSpVYtTpAMUUFAvXHPK8btqSgz+Yu+Do6qh17WTV8httuNfDNLJfGXx3e1MMBTte
 //3PC2HEiS0TBoqHvyAMG0BG
X-SBRS: 5.1
X-MesageID: 57350302
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hKOc2qhSR3x1A41sf4f2cO68X161sBcKZh0ujC45NGQN5FlHY01je
 htvXj2EbPuKZmqne9tyaoq+9B4BuceHx9BlHFBrqSo9EXgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cx3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0W7KCPRxoSMJfhhcYTSERePyEvZ7NJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2ZsTRa2GP
 aL1bxJoVh/+bBhvKGsxUrtjjsXvn1vvLSZX/Qf9Sa0fvDGIkV0ZPKLWGNvKePSaSMNNhEGaq
 2nauWPjDXkyK9i32TeDtHW2iYfnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZHAuZvHfAB5jug14ja+FufKmhVFCBOPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSfbt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qXHb4
 xA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSX9LNkMvmwiehs1WirhRdMPS
 BWJ0e+2zMUMVEZGkIctO97hYyjU5fWI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5fQlkgEDrShOnK/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chYwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:Kcu0IaBtzYjWTLblHegwsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90c67MAzhHP9OkPUs1NKZPTUO11HYVb2KgbGSpgEIXheOjNK1tp
 0QA5SWaueAdWSS5PySiGLTfqdCsbv3g5xAx92uskuFJTsaGp2IhD0JbDpzfHcGIDWvUvECZe
 ShD4d81nedUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInxy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXwIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6r9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFP9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcEa+d
 FVfYPhDcttABanhyizhBgq/DXsZAV8Iv6+eDlAhiTPuAIm20yQzCMjtYUidzk7hdQAoqJ/lp
 H525JT5cdzp/8tHNBA7dg6ML+K4xT2MGnx2UKpUB/a/fI8SjjwQ6Ce2sRD2AjtQu1Q8KcP
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="57350302"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJuJ5J4fhHH4+E4AWC7V5AxtZYI29OU+RSIxexoCe23jgkkSyjSpUVqTMTRpPDYofc3BqcPRxzYBNcsSk36zp2olUv+N/dgz8MO6lJ+holOpmKGDXfUW66bYZUWzXNGe6EUrZb85ErbEGS/bbvGRBTsCEgni6+3eofalX0uZ/Mz9YTfI5pyKljvwfDku8lqFVixnUbuiCswYwNxSA3GUfhQmLTbYMJwI1X1PhCtWMXPcbezb2fKzofxLBpjgmFFYKeN+UG/2DXk/P5INHv6qMHjtDfwROPB+5vi4DCgIWwcjIvkrRdVwhVF1xl+01mZhrXZ14PhRLgxpFcPqsKq3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KP1YxRQhjMVUUIJX9G+se3cuqgQsalV6OrLji5NGW1k=;
 b=QKdiaMnmGG5WaK6iuYw92jaWXiUObsdeEiTd0dGuXZPR9OJyomCouUCYxuI6/inWJz60CkOAca4cYwzY7gHEgFJ+6nsNmZkRh08AlFiVbgA3RbqbJ3QUhI3Z80YCLTZooTgAiAFcOs4C9NGTh34oNw2sSJYPr75nWYveRuV+GCr4qR3Hv+SNOId+JFopT/SROj4tFodjIDE01M5oVF//4ZlCl7CMk/QjFcq/wkc49WuybYcO9sOuXerScbEVZCr1FAIH54qrhahgHY3VwO1ooUk/nWqJ6hKpZpompTAIg89t0YZO0zlnAbX9Kf4XFbEZgKis+Z00pkoaPO4QITFIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KP1YxRQhjMVUUIJX9G+se3cuqgQsalV6OrLji5NGW1k=;
 b=kDcPFirW/l2SRhdf2ye/a5SeoQfCzu8PWaK7PwHzYM3LqcVtItMxjTEWxqnqW46sQ+PdNz3bRaIRObCsq8DrFDEzZjKGGdQEFmVdmXTmWC5ZXK155DJU6/FOeWHGlVxLhnLjk8pr0dcSFgEcp+V4QbxGDbhLV2reqiOYXXhoZCM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.16 2/4] tests/resource: set grant version for created domains
Date: Mon, 15 Nov 2021 13:17:39 +0100
Message-ID: <20211115121741.3719-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115121741.3719-1-roger.pau@citrix.com>
References: <20211115121741.3719-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0002.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52a5223f-4daa-4e0b-fc3a-08d9a831f93d
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3483C01A0AFE9924C83C6B638F989@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NOGYlcLjwM/9jnKheMxueMjE+KS4+6aiXhmAtVsc8+TCj9M2N71GGLq6eOSTDykH7hQhJZeAVgQopF1f9qfL7nKkWVl3yqB0H20tJYu9PLbjf2ekPtkl2lcI84T+j/doP93G6Gi/pkoDx2kXaQ97rh05F3ox1CNcrs4DkbI6OIaTzSOzONMZCWTWChCf+7iSr8e8LVqgxwpvg29+cXJzJZFCLKjp3B29xPLKXoKjKIIML2eK+AEZVrv6q/VjD42+VI7WR+QhB6jDaSoB38wl+PxkOAIcQi7ZcPoiTP69ndKYvaFf6nKO1axyrvv+2YAnaD2YWV7cnjuBEUANV65vdGUpUeo+/u2s7wFrecDS6cB5TdLXXw2/AeEy/dK+9YGr+7BKJWZKK6waoXCDzvgvF8PJgB0tMSOEBYz9hwylQwMGEkuNn2KS1vVLvQrm7y0e8Kwuru8GO/2S+GlS/lQZpMAIYb26+zIcurIAyemIq6CUyguwvSf2N4iLcizvF7HIlggJJbGULCjzU1OC4qRF/R8UgOBRI2b71NQIEVo2r+jWW8iq9IlURiybZwud96+xcVQBq9xLNQj55uU/3VcyUy7l5elbqH0ScCFU0XGPLLVyaUTCsiVZtnW2qvxtavOt02vts6qdq5JZGhpwUXswZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(26005)(82960400001)(86362001)(38100700002)(66946007)(66556008)(66476007)(186003)(2906002)(508600001)(5660300002)(6666004)(4326008)(6486002)(8936002)(36756003)(2616005)(956004)(54906003)(6916009)(6496006)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXhCU0tDT2lPYVArZG9BNzVVZzhScXVpSWtyekVYQzEvUWJYMENiWkxuYktI?=
 =?utf-8?B?ZDBGMUlkc3ZzRGp6SVpsZVIzWFI4cy90WEQ3RlM4VWxZR3UrOXZXUnVvUFUr?=
 =?utf-8?B?a2hRRFpESmpDRStvTzFxNHY4ZXp4QktYWG1jQllCeU5ITTZCWlV2SU9CNVh4?=
 =?utf-8?B?SnA5ZWxiM1JwYVNlU3lSaEhmSGRPdWFsUFRKQ3hFbVdraG5RUDdhSW55cCtO?=
 =?utf-8?B?MVF4L3plZmg4bVI0VnFNTml0aG9RTFlvdC9zWGMrOGVGVVJNTnMwOXdjT1Nh?=
 =?utf-8?B?b0pQbHBRT1V6LzM1emRrR3RIcXk0UDRDQk5mVjJ6TGNqVTh5Y0o1QzVFdUVE?=
 =?utf-8?B?WUVSVUFrOTE4UGJFMnNGdVlQaW5ibDFoVmxQN1dFTFR1YktOUXJtcU5xeTI0?=
 =?utf-8?B?WnU4Kzd5TUJrUUF4REFBNnVyZUVONFpmWUxqUHMvU3J1ZzZXaUZHMGUzczdO?=
 =?utf-8?B?TnlMR2RTbXowYTRqM3NpcGFhYWZLcnVSaWpNQW05UjY1K21oQ0tDU3pqT0Vi?=
 =?utf-8?B?cHRsc0toc08rcUNwRW5QVlp6Q2p2dVUvT3dZMjl0TFhIQXVURkhEWHdmd1p6?=
 =?utf-8?B?Z1NwUkFuSWd0UHhhL0NSbTZSZEh2S1cxRXVrZlhCdS9qMnY0WHZ0VjNKUWt5?=
 =?utf-8?B?Q3VEbFpsYVhrTnMyZUVLVndUVm15Zjg3OUJONGdtZXhpSEUxTlR3Q3h5MUpD?=
 =?utf-8?B?aEpDYTRqaVpHZVBobDd4UTBDMnAxV0xJaDFCT0ptZ3JOZWNyY1hncDhIR0Y2?=
 =?utf-8?B?K2JERjRjMm53ZHNncWFrZTVyanovSTluWUFvaW5xUk1MdHRkTUNiaVk2ZkNX?=
 =?utf-8?B?NSs3d25Bd1M0a00zVU54K0VVRXhyNURHN0xBQzk3WTVrR3I2Mlg0d0VxMDBp?=
 =?utf-8?B?K1VhTHkvZDZaV2hjTk1kUHdXTSs5dnVaTERDa1VwQmRBTkQ4clJtdEt0N1ZB?=
 =?utf-8?B?NHROa0NrSG5lbTN6d3N5cnFjbHlhcGdZTm1GRThTd2lJZ0NSd2xLZUh0S3lQ?=
 =?utf-8?B?eHlhSjFBUnpGSkVwRUJWRjBFWUQrekxqTFhZcFlvN2RwVnZ5bDB6djMzbGZl?=
 =?utf-8?B?MWhXeXk1WlF1VUZGcDU5NHdoUCtmUTdSSGYvTXE2RlVLWHNRSUhVbjFhQ3p6?=
 =?utf-8?B?dW1ZVUk0aXFUM0wrV0lYL2hHOFVkTkNkTmQvVTJEN21SNVE2NDhJcWpJcGxm?=
 =?utf-8?B?aFJvYjBqdGZyU2lod2xBKzRDSWI2WWcwZVZpODgxUFZEVjU4ZUtTTERNSjk0?=
 =?utf-8?B?UzFmZ280dmI3TklkeHRNeFVqTEU2TElSVlEwOGZIcnBkSVoxR3lyWlltRERU?=
 =?utf-8?B?akwzWEpEckF4cnMxc3V1RkVzZGU5SlcwbHh0ck1HVnBLYmZtZWdSYzE1RU5i?=
 =?utf-8?B?UUhFREZKMXo4OVdyZnhvbnhPb290WnZ1Z1EwL2ozbTlBOFp1YklxemJ4dUNT?=
 =?utf-8?B?NXVOd0VZSzZDbXNWcjkycEg1dGcxVFlZZkxRVUhhcjV6MzBvVjZxL1hLeTdU?=
 =?utf-8?B?WXRsUCtXQVloTUxVeU1zb2lMdFBwQ2crZzJKenVCei8yWXNsY25EdE1kemI2?=
 =?utf-8?B?eUdLaFpRSEFpRUhhOEgwc2EzdXFoYW1hNjUyTTZSNDB4dm9IRm1Za1VRbjY1?=
 =?utf-8?B?TFFkY2pTbFUwa2JHYlRQb1NsTWk4YTVZbCtRR2V3RUVnS1krWWs3bFNVc1Qw?=
 =?utf-8?B?UzZ0NXZlc2VraDdWcWM5SVBDakN5SmJwd0ZJZ1NKWEJjekRjQ1VQOUxSNDdZ?=
 =?utf-8?B?Y3ozN3J0NHNWT05XV0JmdnhwRVFudTFJZnJjOXNLSEJtMUVXMGEyRjU0akRs?=
 =?utf-8?B?QjMxT1ZGY1pOcDJ4QlR3TWgzTlV0SENpS2lsUG5oM2pFL2RpcWpqSVIyWjE3?=
 =?utf-8?B?N0dyT1owYzBQajJENFo3N2xYdWhqc3ZCTS8wbW02czBoRmo4T2lqaUFHRXJN?=
 =?utf-8?B?aXMza0o5ZDRZMm52R3BJcTBIWWNUdWU4Mmw0OGxLQXorNFlkQTRJdzNnZHN1?=
 =?utf-8?B?Vnd1c0NtNTVBclhENnkyQkMrNm5Vd2VJMkxQcEtnUm1LYmtuWUZ3dE43QlZH?=
 =?utf-8?B?RjVwbndxNDJ0L0xnWFV5NEEvVHQwU2UxOWYyWTFENHNZZEFmSHppZzRMelQ5?=
 =?utf-8?B?RGE3K0ZrcVVpNXU3Q21Pc0lqWFBrQys0RUdqSUloQ0R5ZnNDRjU4STQ3VnNu?=
 =?utf-8?Q?9hSdct9z9zBzQRy5O6mzDvU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a5223f-4daa-4e0b-fc3a-08d9a831f93d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:18:03.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtLP3Gucs9LgQlvZlDi8RRir9EoxSy/eXD3c8BODwHzHGALoPjG8Eb8YAQL4pcQ42Tj1mVaAWA8cSmljbJ5zCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

Set the grant table version for the created domains to use version 1,
as that's the used by the test cases. Without setting the grant
version the domains for the tests cannot be created.

Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

This patch only modifies a test, so it should be safe to commit as
it's not going to cause any changes to the hypervisor or the tools.
Worse that could happen is it makes the test even more broken, but
it's already unusable.
---
 tools/tests/resource/test-resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 988f96f7c1..0557f8a1b5 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -120,6 +120,7 @@ static void test_domain_configurations(void)
             .create = {
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
+                .grant_opts = XEN_DOMCTL_GRANT_version(1),
             },
         },
         {
@@ -128,6 +129,7 @@ static void test_domain_configurations(void)
                 .flags = XEN_DOMCTL_CDF_hvm,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
+                .grant_opts = XEN_DOMCTL_GRANT_version(1),
                 .arch = {
                     .emulation_flags = XEN_X86_EMU_LAPIC,
                 },
@@ -140,6 +142,7 @@ static void test_domain_configurations(void)
                 .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
+                .grant_opts = XEN_DOMCTL_GRANT_version(1),
             },
         },
 #endif
-- 
2.33.0


