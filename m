Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15874E900A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 10:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295355.502557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYkdn-0003Qe-V8; Mon, 28 Mar 2022 08:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295355.502557; Mon, 28 Mar 2022 08:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYkdn-0003OB-Rd; Mon, 28 Mar 2022 08:22:19 +0000
Received: by outflank-mailman (input) for mailman id 295355;
 Mon, 28 Mar 2022 08:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ynyj=UH=citrix.com=prvs=079c560b7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nYkdm-0003O5-Ti
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 08:22:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bce0c22-ae70-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 10:22:16 +0200 (CEST)
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
X-Inumbo-ID: 2bce0c22-ae70-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648455736;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=t87RuclRjm5IirP3vPgEPVc/6qgLG3s8DiKR47STpYo=;
  b=GhxYiDN4W2x3/lgsM+5EzoAQtRJBfDw57Y8+lfnCmJgnLDcVgLVE4g32
   ZaEdVYyL3hG4SUuUrScYyu8vbuLLYlNMQrOexwm/tRr6xM65YdDQxYGcT
   REGs/BuGefVa/7w+Do7BxHdHCokSY1tppC/GIYKTuUMFX/NdT0iF5jXf2
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67217624
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IfZhjaxZuIXUlvNMXqx6t+c0xirEfRIJ4+MujC+fZmUNrF6WrkUOy
 zQfUGiEMquLYWShf90nYdng9BkP6JDdyNcxGgZl/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz24fhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllbXrdzksZvzwnuFEcEMBL3pPFolk9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J8URKmAP
 ZZxhTxHaDPdWg9GYmstFbU8g96t2iPkXGFqkQfAzUYwyzeKl1EguFT3C/LUZd6iVchThlyfp
 G/N4yL+GB5yHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3UruUCT+KfjzBTkApQGd
 hJSqnFGQbUOGFKDbvCmYSO9+C+4uBtFeIAJL7YLwyWvxf+Bi+qGPVQsQjlEYd0gkcY5Qz02y
 1OE9+/U6SxTXK69EizEqOrNxd+mEW1MdDJZO3dYJecQy4O7yLzfmC4jWTqK/ESdqtTuUQ/9z
 DmRxMTVr+VC1JVbv0lXEL2uvt5NmnQrZlNujuk0djj8hu+cWGJDT9bygbQ8xawcRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQ8l9r2v3oSD4I9A4DNRCyKFBaJxsldjBO
 hK7hO+szMULYCvCgVFfPepd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs/VyNq
 o0FZpLQo/idOcWnChTqHUcoBQliBVAwBIzsqtwRceiGIwF8H3omBeOXyrQkE7GJVYwM/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:qFp/+arAie7h8FdFv724OSMaV5vdL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPMs1NaZLXLbUQ6TQr2KgrGSpQEIdxeOlNK1tp
 0QDJSWaueAdGSS5PySiGLTc6dC/DDuytHVuQ609QYLcegFUdAE0+8vYTzrb3GeCTM2c6YRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoILSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwzqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G7Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnZ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvtn+9KK1wUx4S1bpXXt
 WHVKrnlbdrmBKhHjvkV1BUsZCRti9ZJGbHfqAA0vbloQS+0koJjHfw//Zv70voxKhNNaWs2N
 60QpiA7Is+NvP+TZgNcNvpEvHHfVAkf3r3QRGvyBLcZeM6B04=
X-IronPort-AV: E=Sophos;i="5.90,216,1643691600"; 
   d="scan'208";a="67217624"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxdUGLOEkru9DtlBJiuLdTF38PldSWcYKwtjMaNgMnLriaOeFwUVDMhYSRzD4R8j9UyWpwCIP/I3u4yfzNLjv1NiqmjXWHPE/E0mMu6bHUuS8jUct68JFfPYNrZPGXPt8gxTlPIc6ShM4L5gT722INUluo61AEtJVK9PeG/vQCtX3O2BehhgcY6AjYZ4NRKwfOYHOSYkvQ4DynMIMTFFl7hezdVdQqFr8F3kkBNKtP4uBJY2y9Fm/86hXWJ7EWPp9V+d74Omab7UN6gHk1q8+g9BinkHurEZ9m8dwH/MmWr7sZcKHfefoYdn39fOL3m2suulooaK0IQp1/3DAxh3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GO0xnO1mvI5WW+Gh+lqTY77EJ3cd78mGE4KQ4zlL0Q8=;
 b=E7qAbubXKFKEAWFj4WRo57SEJt/z7s0WIFrja04F8dGccCubuCTQ7fuL81wNlkIWAeJhoa6nPQsdQ3Xeph2zyWfVApjGIrh2FQIAvqZ9TbQOpkqeI8NNxQCQyOE2A1AAVxfqlsqAMR7lIaVSiPGwGFjPrwXgZlT2+QzFIP3dHjXxoeXLFCzu/cfZwLHw9Rqg2aPtPuPqQ3/ispNwhJyFvxHph91i1YoXET78gpGtN7NTVDr0pyDKi+vK7DeSy40HSV1HdnO6HQ5q7LtmxazwWpDzxX+9TMHf0lAcld8wWktm2YpL+x3IOIqQ8Wrd7LTM9jy5zeLRx1DuVjChn9cmdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GO0xnO1mvI5WW+Gh+lqTY77EJ3cd78mGE4KQ4zlL0Q8=;
 b=MqnfYKX6xnkWn+fWk+5ZlpXmXc9Nz+Y5uaBe2cIlrSBaeq7god22+87AK4b5BpyeQePi04DRq3CPbmY3JhFgy/UZIoSDBTKHtvkqwp+7WFS0Gpw0JV+FIiLBFpw8QUArzVym/6YAbyZRUlm31vr+awO7tFq0e0PjYi87g2M8ar0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] osstest: update Debian installer version
Date: Mon, 28 Mar 2022 10:21:21 +0200
Message-ID: <20220328082121.80866-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b73ae474-ac6a-441c-9b9e-08da10940c80
X-MS-TrafficTypeDiagnostic: DM6PR03MB4507:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB450769CC34CAC638D4C519A28F1D9@DM6PR03MB4507.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6oqHMJ9LwbglWbR/4IAKGkCLY7pWBk4N/H2PnnVpXjppzhJof8NW+VIkMb0eKxALFs1YhY7kADE8uIwBcfljvU79wu9/9tmBQqhqrjzxrdbqzEAOInHbxVmiDQ54XfKTn03ZqD7XLrqq+N2mUET0sHBnd4zo9WzP1xdC9zsnnsXCC3RRKpggL9D2cu77qrKJd2NR/Okh+QFDjje6TRJ6C4F4mBXdLD0GziV6JuuEhZXC0QOv1Jn1fsA4UaxRuV6pMrVQYzR8EcRbk+ZFAaKOLMB2YcgrE4terTMBoYCkBRyHoMA8FPs68DS5SKRyKLadYpOJZpOeLfwphhSTTwdKG+wNqCmKaiYhwNv584VwDiNcUs0HgUH6PXq+2GJ9pgO1uXYIpQWRcN2g1cC4wFLje8OP9UWI4lsUk19jrscaXfFgZMhlFlmnnQ8wgUOpwi/l0cFqmOrlC9PxkRbwe1xa2u+VS7Q2Y0orTt/pqy2+glDxcp+7WrtBoKQ8tF6eU9MTNmABst1e3yP6EYdINHCLWEPiqTmdHQS1yCAjMhLlok3TBw3tvPdw0bYK5sfiTnAd+6TXeV0ZoxyKgRAo07bPwbrMT4m+mXAevkO74zlPfWVrvg7O7lN5uSbn80uL9Ig7+keAogiHJgLsKFgIralcOcqDRgTEuC0hi3DmpS1LukAH4JHim5Za1oAbgVIYQ4L4id5j8GyPmSZmLvj+iwgy3RH8utLHtRbEZeElfPDWgr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6512007)(508600001)(966005)(6486002)(6666004)(186003)(6506007)(1076003)(107886003)(26005)(82960400001)(83380400001)(2616005)(8936002)(5660300002)(66476007)(2906002)(66556008)(4744005)(8676002)(4326008)(38100700002)(36756003)(15650500001)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmlSb1hTRXZkaG04UkhYSzluUHFsaXFKZmJNRmNhK0JrY0RuaWJrUWY1Ulpp?=
 =?utf-8?B?cnhrUWl3MHV4elRzSDBJZitoWExlNVJUSSsrSUE2RjhIMUR1N3hLVmNDcmpx?=
 =?utf-8?B?VXpKa01xSndNRWZGc2FqV2NLU1lvLzNiWEJ4eEtkZEVBQk9HRkN6Zm5xQUpZ?=
 =?utf-8?B?M0dlNDdoQXc5T0ZPcVhLSXpnME9NZXI5a1E2TFhYMGRLZmp0dHMyNDQzeE9O?=
 =?utf-8?B?S3c0bGxwdUorYnNTQldTWWN6d29rcEc1OEtLZXRNVEhyVkRYMkE1L2pIYlJW?=
 =?utf-8?B?MWFpNC80NTZMMDdLMnhsM29pbmNjV0tiQm1KQWY4U1kySmQySTMvaE0zOTJI?=
 =?utf-8?B?bTR3UW9aWlFxQm1KVDhDSnJsdisrMEdmQ0xhZHdzd2NtTXdKbzA1WG5xUGZG?=
 =?utf-8?B?cXozTjFzNzR2TS94MmZmQmRBOEtiWmF3N3V0c2g4WFVuRGNqOC9Qb0M0TDBG?=
 =?utf-8?B?a3JNRmQ5Q2Z2bytUeUxrVXF3azFpdWVoUTZ6UzNHUkxsNk1YQXlQeFNtOE92?=
 =?utf-8?B?V21WMjhQTkZsMDZCRWlPM3dZMGY2VlpkRGdDR3pCeGVOTVBwT3VBaGxySGRi?=
 =?utf-8?B?ZTFiRVpNeXppTDZtcnRRWWFBQS9OSFVUWDdlV0ZrY2NlS2ttSUJaVUtTWWJU?=
 =?utf-8?B?aTJ2QmF3MEJBK0RvUUxZR09ydDRaWFJiSjk0cU41RS9aTGRQazNIblBZM3Vm?=
 =?utf-8?B?MmI1aXNxblV0cmJIaFVUMFgzbG9zRUdMd2RTRmRoMWxTR3VNOG1QdTdPTXNM?=
 =?utf-8?B?UVBnbW15WklCVW1DVnpJNjBLNm0wMFNaQUdncDZjZUFDMklHQW5HNHYwbjl2?=
 =?utf-8?B?MnQzUmdrVmtaeS9LMUtHVitrV01rMWZSU0VpUnJKdk5pNlJ2bUVkZUlpWktK?=
 =?utf-8?B?K0dIL29qWUhUSmpkWGpScGhLS1FDbjExMCtaMk00S2JkUVZYUmt0d2RydWw5?=
 =?utf-8?B?ZmFROEhqS1M5RlJsbVUwT1cwTUFFT2FWZ3ZNYkhNM1R6SDBvTDUzMkhjV3Rp?=
 =?utf-8?B?Mkl1ZXBpWERNSktsWUw3V09kS09yNUZORUFQd1NVUS9QU0lJT0FjNTl2NUZr?=
 =?utf-8?B?bzAySDNqbVJFTTVUWklta1lYMmIzckwxMFUrb1FCYXNrRXB0cXAyQUJadXpQ?=
 =?utf-8?B?U3Boa2ZoNE1ZRW05dFYyQ1hPQ3daYnR0N0lRUXUzajV1YUU4WXE4VDNDaWRo?=
 =?utf-8?B?SS9kMGRRY1BvdlhvT2c5YjFLclhJK0FoUm5oanVXUW5nNnVkbXB0aDRwR3da?=
 =?utf-8?B?Mk5pQk5aUTd2UkZHdS9zOEtmOUhJcVZGcW15cXZwWkpZMkRwejdTR1NrcVpi?=
 =?utf-8?B?bXNJdWptOGRpN09xWUpLR3g0SlJWMzZJeWFPbEE0eURIMVcxeFZObG1BdkM4?=
 =?utf-8?B?ZlJGMVhZbWhLL0JSK2c1MGZPUWhwUWNCelNzRkdJQjFKbTZHYWVqTGtNZ2hW?=
 =?utf-8?B?b280dlpNSWFWZldyL1FVKzN6bFl2K29JM0pQT0k1QnRXelJhOFV4RllYQ3hl?=
 =?utf-8?B?ZXF0UzRuS2tuNTBwWTJsWkxsZ3ZUeUpBVjRreUVnUkZxaDhXd0ZrZDgxRGZS?=
 =?utf-8?B?UlJMVjBNVStQNCtvK3plRzEwSHdJdWF1Mm1oNEhnU2NkdEZSWkRPRFhPZDlv?=
 =?utf-8?B?WTZRSDQwUGtidWw0NVdIanlXSXA1cDlCb0tjQkY2c0I4dEpGWHgzSVVRc2Zs?=
 =?utf-8?B?K2tRdTIyYXlSclZ2YVdDV3JheDBmZ3dTR1hZSWVMNHg1eGNhWHRCMDlOUTZk?=
 =?utf-8?B?Nkd2L3JSdDhJYXliYkVET0hScVlwYlFCREF3Z0p2dlBZZ1RZdk1uc0RyV0o4?=
 =?utf-8?B?d3dGdm1pUW5jb0NBcmwvdmZ4TFdkRlMxWjJXcUlQTndQYlN3bHZYbTc2NitL?=
 =?utf-8?B?WlN6OW5EWGFkWnpIZDE3U0lGUGk5ZHgwZjZ2QnB5S3V4VXNEQk13ajd5YkZX?=
 =?utf-8?B?eHJPUjV2QlJoejczMnlrRVRXc0xkV0pQRmQ2a2VFQnpTcE5tYXc0MlFtQjF5?=
 =?utf-8?B?Y3g2YUR4dUVxYWdubGlUSjdUb09VZTZ5SFFUSUlEV3RiZHU3VFptWGJUZXJz?=
 =?utf-8?B?YWlJT1VlYmcrVWFJQlhTYUhmQitSRXVDdjY4NUlLZVZaSlUySURxbmxNMExK?=
 =?utf-8?B?Y3Vhd0ZlNklSVUNiSHV2VVMwL2xZUVh1U0Y4K3N5TW9MQ2h0S2FhQ1dtMnZI?=
 =?utf-8?B?QUtwZE0rTGsvWTRkNDQydkdWTE5xZnQrOXp3YzV3a1BLcXVwdzBNd0tId3Q3?=
 =?utf-8?B?ZGtrbDlaYTZRWWdtMEUzdzB4a0FOTzZDMG9lR2pSYktmNHFpWmxPV2lIQXZn?=
 =?utf-8?B?NWUyT2VoLzF6OGNrbUIyYjltVnR3cWdMRHRtRG13UzZqUVFGTm40S2dMNm03?=
 =?utf-8?Q?uffsY/oRglKaCoN0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b73ae474-ac6a-441c-9b9e-08da10940c80
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 08:22:07.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EfEbR5vcyT31aV+Nnkiynfp9+d/cQx1DYZuiIzr70CiM70XDt1MMLDNDfUVMVEd+s9oejAb+aNl6C6PZWlyjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4507
X-OriginatorOrg: citrix.com

Update the configuration file Debian version after having run
mg-debian-installer-update-all.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 production-config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/production-config b/production-config
index 023b8162..9d2e7e0e 100644
--- a/production-config
+++ b/production-config
@@ -91,7 +91,7 @@ TftpNetbootGroup osstest
 TftpDiVersion_wheezy 2016-06-08
 TftpDiVersion_jessie 2018-06-26
 TftpDiVersion_stretch 2020-09-24
-TftpDiVersion_buster 2021-06-22
+TftpDiVersion_buster 2022-03-28
 
 DebianMirror_buster_armhf http://snapshot.debian.org/archive/debian/20210124T203726Z/
 
-- 
2.35.1


