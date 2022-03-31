Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA164ED597
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 10:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296747.505190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZq9j-0003sM-Vw; Thu, 31 Mar 2022 08:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296747.505190; Thu, 31 Mar 2022 08:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZq9j-0003pb-Su; Thu, 31 Mar 2022 08:27:47 +0000
Received: by outflank-mailman (input) for mailman id 296747;
 Thu, 31 Mar 2022 08:27:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhN=UK=citrix.com=prvs=08274bcc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZq9i-0003oZ-Sd
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 08:27:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f509cce-b0cc-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 10:27:45 +0200 (CEST)
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
X-Inumbo-ID: 6f509cce-b0cc-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648715264;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FsP17eF6yZSmyZUsSL2groiVZEb0raHym4ZoO/EC7TE=;
  b=SS0jRzRgisEG+cZUKyJQrft8H9GqLZW5jjzFQFGpNQGPeT19QK7yb3me
   WTutwOq7QCU7yOmrP6dqCc6Y6I5Jst/3Ba5xyfMFVcDKPPI1zea9gzW5N
   KEA1qBietZzT2vuGdgC/6E/kJOEsllpQqgUnnBazS6p3mQ6b/iWxylmvp
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68036651
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OhBCfaxyLwjlQvSkctV6t+cOxirEfRIJ4+MujC+fZmUNrF6WrkUEz
 mFJCj2GOveNYWOhLopyPoyy80xX7JOBn9cySVRtqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2oHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqMW/EwYoMvD2oe0DTiVaIyYgHqBA9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JAWRqiAO
 pNxhTxHYyv/ZgwfAFYuM5Msvdbv13TlKj16kQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krK+GnzDxUyPdmW2z2DtH6h7sfMmiXhUY5UC7y89dZtmlSYwmFVAxoTPXO5q/Skjk+1W/pEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWIEH3H97aY8AmLMDYIEW0yYnEnQA0KtoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWW0bb1HRcBJG9GRF5iLJ9o4DNZWfhsBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66IPoQQP8cvLlLYoUmCgHJ8OUi3yiDAdollZ
 P+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwOyL+Sp
 yvtCxIAoLc97FWeQTi3hrlYQOqHdb50rG4hPDxqOlCt2nM5Zp2o4rtZfJwyFYTLPsQ/pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:Qt5BpaPHGxzx+MBcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W2Dk1ZrsA/ciYoV9MOOA4ge7rANoWfe2OEDIqtSW6XYZ3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.90,224,1643691600"; 
   d="scan'208";a="68036651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXu/PmjHwb3W9BRjZ50vAaycUozLHruMAxZdDpQPWK/CK2KnbOKrP/g8Zdh5+XZjNWFbweFNQLdGd7T0KakJSWLkhqqmwXVF0JYeQTBiaAo/VUJm5kAyHIacmkrgIYxqdg/k1y/nL1ash3kH58cuIrIQ09FxqCHNxPv4T5luCXI2nF8icbPl8D0ya4tbLKRdulH6Dm41FK7nAQlyzpjm7zbVtSD86mHoPKUdiqlfIjeru/zqr3bZBnI+JvjjwR8joc3LFICpVEls3dJfbR03aJCVuYGThzNEzq+ygwa0ERO9jrY9pjpY70wpCEWYyCckknvT6ePwELlJB374IOAnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OL6mNXHh4DV6Xle+Fz712zXgPoopxZ6H7L3FKtSbzRg=;
 b=P6zl7j0O2qZ7hoQ+L3IDopbT2uuMrIshfd5gbRjCuIPvN++vLtHYSysAO+Gz1un/B9a+hashgDSw/nLYOec5mg3pumLVrGj71QIcbsIcSRyxwMU43O2YatlEA9hpv3tmvkBQjs7eAdj3QvO5+eAZY6qqVQlIj2CDv9qSBq3v0qc2VazuO9B6IzYDsEUyZdzFebdJhIDBBHDFr2CTZ6hPcZKM8vK+LURsz7KQp7ydywvXpmJbu8ESSlkx/qBvhl6KckyZRHpUaDk0OW+Mt8LVC0TD6prjJQ0vnumL18R+Q/9WtROJJZBKu5wORtGbMsRHxItzBetR4xoQEC1nekiXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OL6mNXHh4DV6Xle+Fz712zXgPoopxZ6H7L3FKtSbzRg=;
 b=sU2jtE9lBHPmRs1I7ujlf2aJBgXpOGFDrDCiP3wcZqnUyoQG+HoM1orRgdce7sIx/MKRa24HsMOAePS0q6JRknepfI5alj6xpee203+EXtOkIYzAu5OsUuKEMtVSWltf74/nyMSTcVHI9E6RBSurnTenKuhb+5WMAkGDZ9jlS14=
Date: Thu, 31 Mar 2022 10:27:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Bjoern
 Doebel <doebel@amazon.de>
Subject: Re: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
Message-ID: <YkVl9bAEc1lo4jpK@Air-de-Roger>
References: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
 <YkSNm0mb47Vc6nGr@Air-de-Roger>
 <a6f18801-7959-8fc8-f414-8086ed74ab3a@suse.com>
 <YkVfvW6HiST3fIgs@Air-de-Roger>
 <66beaea7-eb6f-4cac-336b-4dd605bc614c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66beaea7-eb6f-4cac-336b-4dd605bc614c@suse.com>
X-ClientProxiedBy: PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c09cf8c3-fcbe-48e8-f000-08da12f0511a
X-MS-TrafficTypeDiagnostic: MW4PR03MB6604:EE_
X-Microsoft-Antispam-PRVS: <MW4PR03MB6604410C9528B3B82449AB2E8FE19@MW4PR03MB6604.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7dOoS7BnI8Lt/KX6M3ZZey/3/Hypg4M616YRynlGSSFQqGxOZ6lEy6gDHoX/hoB2tvdE7Mdkj4NA35jibcbae3VyXSQQmiCQn71fACyTQRqFqLo3uwVBh1z4a2Kv2/RR1i4VpxlChegPA30rwG/3gytTZyw3XpSFQbgmzpMlSd4mWHrYxeoY4rOm3pMOo//+EvTSwUY72DvQ7NllKVccvfas5VBiIuscFXWROHl2uqwubgZ1R3gZQNNaK47hX1VNOZdxuDltu0cGF6OvCYW4VimOHSoEdDCWOk+ImXD8130PNnoYaNnuGBEFhJDmNj1GQ3y8z/ls9wEjQ8B/YLUeCRI2g58HtTT/Gs+d+SV92mHhmv33gVIufeLohkTXxhupuxBt8UvWJg6puqHonUJGZBiNUL7U+G6p/FwzNPB72ky8MnACuekU2MDY3d8ieDlXdLQoiAZ6f1H/G5jvptp4+zHWwZY5zG07ViqcKY1dL/tlFyrSfUorOBJoO7ci2uGlHsVC06DmwTZOpgJx7oSLjZ/A9bcmyG3l6NwbR6j/SdhX3PUefBQqfUBah0SZA4NiFAhH8Rbr0kImmZRBfzbog7HGDli/xuaMS6ASeNXzYXhWMau4CmFg5jDTiV7fq/fsFXKsJkF6/sQW7KMEuVGrOXKMVAThCj6JWLrDDBMX0Nj+kYWEUTcFnVTZWuNFRG1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(38100700002)(54906003)(6916009)(6486002)(6512007)(6666004)(2906002)(53546011)(9686003)(33716001)(82960400001)(85182001)(66476007)(66946007)(83380400001)(5660300002)(8676002)(4326008)(508600001)(66556008)(86362001)(8936002)(6506007)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K00yMEltZU5lZTlBcVY3L1NTVmhQRW0rRkFHSUhEYWwxU1YzNjZnbEpIckNQ?=
 =?utf-8?B?ZkdZS0dBRTRMUnVrb3owb0lOK0loV0oxbjB2MERkVVlhUk1LU3lJdlo0cXJu?=
 =?utf-8?B?THhWMnBSUjJ1dG1lQVlSRkNYQklqTS9iYTl1Z3NMY1MvSGROY0pXVmozVGtp?=
 =?utf-8?B?WmtGeUx3WWM0UzFib29KYmhFMnRPV2xVVHVQRVMzTG94UVJ0b0Z2dmVGVnZn?=
 =?utf-8?B?VEhXcFE2emUyd2pialRiWldWV3lHcGZIaEljWXBhWEV6NlVNNXJGZzd1ZVM2?=
 =?utf-8?B?RlV5VmFsdnM5MVpOSWtyRVpOMW9VMjl5ZXNMUStqNmhsalVZZ3VTNUhvZWNq?=
 =?utf-8?B?aHhvTHhwejJKcURTY1hRU1FGSDZ3Tkc5QjZpZzN3S1FhQXFLZEM2RHFtdnFE?=
 =?utf-8?B?dVVRVEFXL2xKalRGTDBGR2gzcys2ZkYvZy9EYUU1RkRFYXBKUm9jN08xdU43?=
 =?utf-8?B?VXFaWEhhRTgvMnRad1JRZURwSUNJcDhoOFVIcC9RaEQrR1l5R2tFVThaR3ow?=
 =?utf-8?B?bmJ2UnRDMEc5Skc0ZVhjSzgxQ3JBQ2FDQUxSVEJKRzZKOVI4eE1rTWN0NUJy?=
 =?utf-8?B?T0U2ZWl4TDVwSUtwQzZXMG8rbTV2RGNkdEI1dkNTeUt2NE96U2NXWjh4VSsw?=
 =?utf-8?B?eVZnbnlxRW5QTlZvSDBtMmZJS1N6SWdDbnIxc0xkWHVTOUV6cU92ZXptZWJt?=
 =?utf-8?B?Z1Q3dG14LzJsZTBWc3Rpck0yN1RwVkF0V2dBM0ZFUEwyOTJCelBlWHdxSVNk?=
 =?utf-8?B?dHBhcmJDYzJnbEpaOVkzMEhwWnYwbnVTcGlXY29ITGx3VnFDTXJuWWVmMGRn?=
 =?utf-8?B?YTZVTjV6aEozRFROZFFDQ1J1NG1ZLzR3Q1JWeWpycnZ0ZXNVRXZ0ZmJMaGFv?=
 =?utf-8?B?MHJvdlBYUldVMWIwS2xBS0tENGRheno0aCs4bEdNb1NWbmozaURaYkQ2UTRv?=
 =?utf-8?B?dXNKWVo3cDR0VWNxeFYxK0lMTWg4bm9icXJNV0lEUldTNFlmdkVFRThyRXAy?=
 =?utf-8?B?bFFXb2gvbkZ4NEFtT2E0TU5CVmdFTEJ2d0NxQ09NdnJDajFOazlpZ21hS2pF?=
 =?utf-8?B?WWpENVllakFKbTcvTTQ3TGpBc1dvRUZWMU0wRzAvdk01Q0lrczVTWXZpQWls?=
 =?utf-8?B?UDlIaU1WZXNjVHVIT0VPWXJvcnp4SGdidWZlenF2Uzl3WHBYNXFEaGZQdi9I?=
 =?utf-8?B?RWorR05YZ051cThWWm1OSGdzR1dFR1V0ME0xaHpmclhoUjBRYU9EZEdlQWxU?=
 =?utf-8?B?MXFEN3RacDNnd1RDQVJqbzJVemNWUU9iV2pYeGxtY2FqdVpxTThXenIrYSs2?=
 =?utf-8?B?ZTlCd082NkNjckllM1g2WDNqSXhIOU9ndS9OMmJRSVFhNXJlMjRIOWwrREZS?=
 =?utf-8?B?Y0QwS251TTQycm9aSGU1Mi9IZWowVmdmd09uNGdlZnRhNUloU1ZZUUpzMUtt?=
 =?utf-8?B?cWhSelFtMjFqRi9IR1NFamd1Q0NJbU8xSXplLzFheWZyVzFZNjN6Qys1UlJF?=
 =?utf-8?B?T3o0dEk4QXVZQnhQcGgwQzYwV254L0F0b1J1ZW9lUFRFUlh0QTVPMExUcFNR?=
 =?utf-8?B?dW52VkVQeUloMWMwNC80RHdiYkxRcVR3OHgxUGRwZy9RcldsVS9oT3ZkWmJY?=
 =?utf-8?B?a0YxVTlNT1RJMHhxd0N4MGNCRnhrKzdsa3FEVDBHTERBL1RqUlN0a3JYWmEr?=
 =?utf-8?B?bTlmV3MxdzFjMFF3d2xmYks3c21MbG5tUm1WWEV5Q1NKL2ZtSEpHb1pzU0JU?=
 =?utf-8?B?OTNzaDhZTitoUTBGT2sraWVUOWNhN1JSSWN3ZDlvY1hWcHBaZUVRV0N3Q0pZ?=
 =?utf-8?B?WXJ5Wm1ueHpSWEhER2tEbVJwb0VTbVROcWE4TUpPWEFCVGVvVFVib2RBa2t1?=
 =?utf-8?B?c0JpWTdKYU85WUF4N0JBMSswaHcwS1M2aEYxZVhMU1oxdFMycnZlcWYvMFov?=
 =?utf-8?B?RkhCRHljd2twejBmS1Mybm9Pc3ppZWRXVjZ4SEVFS1Ztbk9jUnFXdlRwZzBB?=
 =?utf-8?B?SSttMkxzQlNVNm4vNmRPOWgzTnlCeEhoZmJVRXVnSDZKRWl2dDVJdlJxWE1H?=
 =?utf-8?B?a252d3FLY2gvOVNMTHhXalArcFgwN2kvcGc5VXRtS2tOMlpELzdISnJZeXZN?=
 =?utf-8?B?SUxqaXJVYlBmeGxtNEo4QTdMMElhTDdVaHB6LzQ5S1F1cm4wTEFFVzNVWWZ1?=
 =?utf-8?B?QlVERjRvZkUzbitEbE9iMVE1YnZncUxNRDZKTUJTa3NIZjNSVHR1ckpqNURj?=
 =?utf-8?B?TEhuanVKSjIvdE4rMGxPbVc4SnNsTUswd0V5K21wMVhFMzhmM0taemtLTDlT?=
 =?utf-8?B?cTNBZnZCZC8zV21KdEdiQVB1ZVhIOVBHUmFKdnpnR3lvSWhZT0luaHVsSW9x?=
 =?utf-8?Q?TV69QmgSNUbFd2uU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c09cf8c3-fcbe-48e8-f000-08da12f0511a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 08:27:39.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usQ2zvO6ST1heMgGmiJannBDEqZ/MipCOyJmbY9zB8cHqEOmrKEcaTewTbPlvGlSOFDZ9UegLTOyjA+g9vTUVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6604
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 10:13:06AM +0200, Jan Beulich wrote:
> On 31.03.2022 10:01, Roger Pau Monné wrote:
> > On Thu, Mar 31, 2022 at 08:42:47AM +0200, Jan Beulich wrote:
> >> On 30.03.2022 19:04, Roger Pau Monné wrote:
> >>> On Wed, Mar 30, 2022 at 01:05:31PM +0200,>> --- a/xen/arch/x86/livepatch.c
> >>>> +++ b/xen/arch/x86/livepatch.c
> >>>> @@ -157,9 +157,15 @@ void noinline arch_livepatch_apply(struc
> >>>>       * loaded hotpatch (to avoid racing against other fixups adding/removing
> >>>>       * ENDBR64 or similar instructions).
> >>>>       */
> >>>> -    if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
> >>>> +    if ( len >= ENDBR64_LEN &&
> >>>
> >>> Sorry, didn't realize before, but shouldn't this check be using
> >>> old_size instead of len (which is based on new_size)?
> >>
> >> Yes and no: In principle yes, but with len == func->new_size in the NOP
> >> case, and with arch_livepatch_verify_func() guaranteeing new_size <=
> >> old_size, the check is still fine for that case. Plus: If new_size was
> >> less than 4 _but_ there's an ENDBR64 at the start, what would we do? I
> >> think there's more that needs fixing in this regard. So I guess I'll
> >> make a v3 with this extra fix dropped and with the livepatch_insn_len()
> >> invocation simply moved. After all the primary goal is to get the
> >> stable trees unstuck.
> > 
> > Right, I agree to try and get the stable trees unblocked ASAP.
> > 
> > I think the check for ENDBR is only relevant when we are patching the
> > function with a jump, otherwise the new replacement code should
> > contain the ENDBR instruction already?
> 
> No, the "otherwise" case is when we're NOP-ing out code, i.e. when
> there's no replacement code at all. In this case we need to leave
> intact the ENDBR, and new_size being less than 4 is bogus afaict in
> case there actually is an ENDBR.

Hm, so we never do in-place replacement of code, and we either
introduce a jump to the new code or otherwise the function is not to
be called anymore and hence we fill it with no-ops?

Shouldn't in the no-op filling case the call to add_nops be bounded by
old_size and salso the memcpy to old_addr?

I'm not sure I understand why we use new_size when memcpy'ing into
old_addr, or when filling the insn buffer.

Thanks, Roger.

