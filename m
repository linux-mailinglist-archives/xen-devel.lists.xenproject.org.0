Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69BE461B0D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234634.407195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrige-0004WX-FW; Mon, 29 Nov 2021 15:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234634.407195; Mon, 29 Nov 2021 15:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrige-0004T5-Bo; Mon, 29 Nov 2021 15:35:24 +0000
Received: by outflank-mailman (input) for mailman id 234634;
 Mon, 29 Nov 2021 15:35:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrigc-0004Rj-Q5
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:35:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5479fb1-5129-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 16:35:21 +0100 (CET)
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
X-Inumbo-ID: f5479fb1-5129-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=KZ2QPDqHuvFKYGq4sr1LmBzyPvDF/8vgwMdQsnoM0Qs=;
  b=TG+TQte2pCaLX0KC94SE636X+S8IxwBJWqZFPThFbafFSBii9iiuf2X/
   AIagqjCcsnNXSMXFzeg84rrtpwstu2knrp/P5GMl2GTquWRVq0c9av5mZ
   SA7LYIGYeN04FF3YsuVvzxwnIbZLYRyZsrK60unm2vVG28wgMajZR86WB
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N1EAHw+08mFsOdQ1iZYPw4833oVGImLC8KRtc2Ve/J+/6rP5Q+3JOnkcjfUfRVRIlCXQtBfljn
 bqHKxsQV2YVL7sxVCk9Pte7n8HUCmOIKm4Zk5oS6GD2o4QvXH6Y9IKO1ZD/mNMJSlKsQwM4AoQ
 2ABcyRol4szNyRaiK9AmGJ7dNe9joDaWx2AP3WFQpWV6vAcOcGeFCJkNW/hMyjIOA+3kQVNxv9
 cuqgJWqWgMNfA4pDzodLJ+bX2QHDooDpr5YC1WFyI4kKQC83+1Y8N3vS2B6maq1k6or6xriTkm
 usvRWx2+RjBKOI61uHjIIPnu
X-SBRS: 5.1
X-MesageID: 58333437
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sX9EKqBo6frOMxVW/8Tkw5YqxClBgxIJ4kV8jS/XYbTApDkj0zZSz
 mJLW2nTaa6IZWP2KNBwO9ix909VuZLQn9AwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5400M7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/gSSnk49K1
 NF3s6PhEAsrYbLGwKNaXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvWRvoQEh2hYasZmHcj7Y
 PgEThRWV1fmQkRIIHIJJqMBtbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSLWsd9jkuev
 njB/WnyHlcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1ayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4qDFzQrGPXQAdDh+OYUqtpApT2Rtk
 VDcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjT9HBm74j/m/LnwElSEbrvpzu37qbEQQcujuk8djL0t1gpDGJJimHB1LQ60RqiBNvBJrVil
 CJd8yR70AzpJcvT/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZZdI2O2O
 hSK6V85CHpv0J2CN/Ufj2WZUZpC8EQdPY69CqC8giRmP/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:KW97yKlwB+bOkUgrQ4IOB5BYp2DpDfO2imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTMuftWjdyRaVxeRZg7cKrAeQfREWmtQtt5
 uINpIOc+EYbmIK/PoSgjPIaurIqePvmMvD5Za8vgdQpENRGttdBm9Ce3im+yZNNW577PQCZf
 +hDp0tnUveRZ1bVLXwOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDk1SrsA9ciYhV9MLOA4we7rFNoXze2O4DIvrGyWeKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58333437"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmuS7BIW/ZXbC65G38oreFJbP16lXADhWLCk/GzFfEW3WHZTqT4idLFLdT/Nc+HfcXVU4tYI3x8cyG9ddcSb2lvPbp1gyUkPKmAXBB8HsjtTmOHhUqVgSArgQJRgA1okPnvWqXRiPAgDN2XUz9MxpBnGBfdo+G6u5yUjN/fbEHacnLjx94t2xg424PYD4Jyqbkgg01+uA7S5oBI8bijTvN1ZzmOL1E7iL4OTtyREYBG3dnXwBfr/6EQCofbSRazD0uAhf/7uX1uaLzl4F6cVt0iPJ788GmuuM6CN0yrupeGK//+tToYvRy04PfEyNWfiJ/Tjmqr4t0MkEYqthH80Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocqDusQM15nBYpXPiTHX8gTIwyIJGtnISfXG9CjWvXY=;
 b=ZZKspgiTG6OGeJibgr94pvxdelN1Z8gtnJ1o7wJuqCvr8Fqw8Twigry0piILRcBSL/CdqxuD6TqPn79JWbZIyPtr7XP4z1znrUi0bH3a8ISXMTpQsXxM2PxB+eHQP0OjWMUR0+LDrx5oRwGkbVQfS/6gHOebqp2ytjnYTtkpbuCYADA/K0Y5UC3YnIQbLnLsM8Xw2L22snDmVbkd8eiVoyS/xqUDrlV86TJjurd5/wLlgSAEAXRqLCwK374ztFAIlElBP6XAnhiuTAkAJSZf6YEsaDAPMNYKfdhCR8ckWjm53ezXow7mp5q/Q4PGLQkS3C2T3+JKmF/a6apd5eZYrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocqDusQM15nBYpXPiTHX8gTIwyIJGtnISfXG9CjWvXY=;
 b=Au3BCTSW7mB9NNzM6wPMSs4eD2pl5iWud8pZx46+HbPsIsqOUT/iLAhHW/aQFj8JWXTeatuoC4zlf+22eppRC3/35pZRMkUGm8jMhKLH65dMMDWsjUtK01EIs0U4CJ9Cn+UZ1j5UVjb+5mZU+bGsiKwjQ5JCxh9tVFhz9cLvXn0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH v5 02/12] libx86: introduce helper to fetch cpuid leaf
Date: Mon, 29 Nov 2021 16:33:45 +0100
Message-ID: <20211129153355.60338-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::9)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3d298cb-a75f-4f90-e36e-08d9b34dd7d7
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:
X-Microsoft-Antispam-PRVS: <DM6PR03MB47649C9DA9CC5B4C192606A68F669@DM6PR03MB4764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKvds+rigo8fVhvhLJhNTbT514VpG/uKE7gwYEEXzCGXgsiKLbEtcp/VROLNV/N39U3QQ4+YMyWHqZZ+mcx7BqKWyJhlvmWs5OmJGWmSk5HKVIobNSwBbCGIYN+Q3Q4ONW3lkLE50JWbDGvs//oRLUEbmcQ7gnXdKnHTuXcB2maNkb+5zifkTGNQeOGhnMD/UBxcq8I5xpw8zR8UWIX+vE8p7A70i47kD7bKLSg//L4N4F9oLDbYS2HdeGlCGnc09cOk2W4ZZ3cwFK/rqnyCH4YhMhPVjD0ulD2tQEYnn8PxwZfQ3mh1XFXAQfosw2HTGMdp2ulGCWwEE/Anm1KZKJTdnEmys4HTOA79uxiGrqWRUewjRGqXJEek4yTzmg480JCakAAONUeAZAZjgNwEkCbgfIybCy0zeCt6rxXYRyBk2G32B/Fp6jMEiAT42GRJp0riVQDPO4IEMCf4NXVyGZaCoV7TeeuVsOYkBZNC78g0yOKhirTLUPWBYlP2Qyhp1uqftFEBOHiHfy+7gkpLJhd+85ZIfS3jvFKUo+ilmgvoRLyJeaJD5jC3yqxz2kN0tsbEnJsH4RPVcwDGLer6XayLFz7KI0n7CBOiYe6xaufJ9+CwZUxiXPNEi/ddGjlQqKpvPP64q+XHLj8hPHF72g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(4326008)(2906002)(1076003)(66476007)(6486002)(82960400001)(38100700002)(186003)(83380400001)(956004)(2616005)(316002)(6496006)(6916009)(26005)(54906003)(6666004)(36756003)(66946007)(86362001)(508600001)(8676002)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTlEOE9lOTArTmwyaHpWQ1dlYWNZMG5lUG12cmRrb0gxSk5wL2Y2Z1hGUDBp?=
 =?utf-8?B?ZjhYMXRnRkp0cW8zMVFVQTE4cHpib0tlNVhsSnM2NnJXd3lnNi9ySlJsSW15?=
 =?utf-8?B?ZlMzSjBRKzVIcjRqV1Zkajd3L2FzeGs0elJ2L1FSOGxPb0pHQmRHZ3hGdWZM?=
 =?utf-8?B?VCszaVlsdkdOL2IrN2U1U1M2eG5rU0xlZDEyRk8zeFd6N2pRTGFZSEp1dkpD?=
 =?utf-8?B?OGFMZEhWNlo1Wm9UWHMwNkZpaWxQVmtPNG1MUUg0V2U3TldBa0tWQUo0MmZl?=
 =?utf-8?B?UUJQMUp3cmtMTTRqYmZmdG1vVThjMElRSEM3RitHMlZlL1YvVTdCZlN2S0Jt?=
 =?utf-8?B?R3R6Z3hyekVKRGk0SnNiNmlPQVZNUk1YS2xLNXFyMytobVdYMHNzNGo4V25G?=
 =?utf-8?B?dW1iTlVJZThCbm5rVVQ5d3FCV2xvbFhmZk10ZTBuQm5iS3FsWFlxelVmR0RO?=
 =?utf-8?B?LzBmVWdnS3RmKyszZFM2bDUxSjlNNTNuMW5kVkFBTFBZNmZVdkF6ZW1keDE2?=
 =?utf-8?B?bHYveFVIbWxzOXE2RDNDRDl5cXV2Vk5RalhHbC9PZDZLbllQOW1FT29LeGRn?=
 =?utf-8?B?MXE2STFmMTI2WGJFQlo5ZFRSbnNwSU1Uc3NtaEczWmdJT3YxT0c2SU5NUWda?=
 =?utf-8?B?N3VneDIzZzJmSSt2amJOcDh5c3Faa2ZzbkM4M0taWTJOUUpZUTJhUVNnajBV?=
 =?utf-8?B?WnVVSG9MVzExaWgyQmw4YnBtZmpPbHpRRUc0MmluaEgrRytJNWVybnJCV2Nv?=
 =?utf-8?B?UUZyU1Uyc2oxMzMyaW1FUmQxWW1LWlY5ZW9Odlg1U2RXc3FVbEhVYkEvSXJj?=
 =?utf-8?B?aktvNXhRTnQzK0djYnlYMDU0SDVrdVZ3cHNJRG1adDhqakp2NHV6V0tEQWVU?=
 =?utf-8?B?SStwWUtaUTAwWVZxT2tQU2J6K3U4ajZjcm9KZkgrYzlUQ0xpSTJoenI5Ym5E?=
 =?utf-8?B?Y091andLYXdXaUYzTFpQRFlIcmVReWZsSy9lUnFyT3AzZzh2dWEvTUdDeHBK?=
 =?utf-8?B?MkJoL0hYVnkrd2RDODBMNTJqV1J6ODFoNWg2N29YSG1NTHNZMFZaMFhqdUNC?=
 =?utf-8?B?WmhCd0w2MlREN0JMdE1QdkVsQytGTXB0dDRyamxjU3ppckFOemJ1VEdUQThW?=
 =?utf-8?B?Um92YVo3cVFRMXJodVYzMzVpME9wQVg4R1ViZ3lFQTc3Rm5yMUtYZTdubkNm?=
 =?utf-8?B?NXlEckpSTWRZVGExWkpFdDhwdi91ejdqdERVN2NLOFgyVWJnMVcvaTFSK0pM?=
 =?utf-8?B?YUVEYkZFTlM0MFVHdUd1aExiNnhuV2E4dTl3OUtNUTUrYnY1YUpRLzZWZ1ZH?=
 =?utf-8?B?ci9NYUVLME9Xc2N4aGJib0ErbGhvZEJKcytyaElxU0RCemJobEJKdXVqYnlw?=
 =?utf-8?B?MHZmKys0WXZvZEQ4YkZhbVZYay9RcW1jZkJjVjhBbzFuam5EYUJLMTNUV3V5?=
 =?utf-8?B?d2VkVXZUOXMvMFB3aGhTS2d3QVp5dnZ2cS90V0RiNkd3V1hhTkFoRm41TlJh?=
 =?utf-8?B?V0lLUFJXRHBlMDlyaXBRUDZmVWtVU3g0aWcrQzBBb1JhRmZHNGhFcXhZUE5N?=
 =?utf-8?B?L2MzMXo1cG1ObFQrOHRaK3MxdEZVclpndnNZbXl6aFcxcUZQM1FvSm9ZcEhS?=
 =?utf-8?B?dlJ5Zk81dVNHM3hyRExqd3FwY2IwbUZ3U2s4R1p5bU1LTkwyUkJGSG1ubjRH?=
 =?utf-8?B?aW9rWjdhakxvZ2lzSzNndE9OTVk0MlZaMWk1aEdvV29oSCs1VG1EeWZxOG9q?=
 =?utf-8?B?bXVjZ0tMS1BkdzlBNDBDNGFwcm1MK0Z0K3grVVptaUpweVpMOVY0SmJBU1R4?=
 =?utf-8?B?d0cxMlIzZUI0eVk5Y3FnbFJKQU9oQlRhSkNyVElIU3NlTHk4UjAwVC9ETlhK?=
 =?utf-8?B?aVZaNHRGUHhjRTJKOE5wRUpBMUpoRVZGK3Uyd1BhRGtRbkJzV0xiRFRqMUZ0?=
 =?utf-8?B?cHZ6Mk1FRHpwdXozMUU3VUNaRHREemkybnpOT1V0T29nb2hXdzErSHNpaHFw?=
 =?utf-8?B?K2ZjTW1GQjYrT3NPV0R5a25HTlNKMXdIRCtHZXhDcFY4NXlUQVlQbzJmcG9F?=
 =?utf-8?B?MGRyYVB4TEVXMGZIU1NhbmpOREl4MEpMak1zT2RPSGhFWE90Uys4UU5SajBO?=
 =?utf-8?B?Qi9xMEY1YjhlbVliaFJqd0RUVlNWSk5UamhReW1Cb3Z1eWVURTlTeXdPTUQ1?=
 =?utf-8?Q?vTWGJSaS1vZ/+IAvbd0uJc4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d298cb-a75f-4f90-e36e-08d9b34dd7d7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:16.5456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PT6sVp13dFMHDtAjollTDLhZ/OSnYgthJDmlsGwUpGKhOIUFIOGfyJgv4z2DmylhvWdnxYKKMHrZ+0vu3HoNMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4764
X-OriginatorOrg: citrix.com

Introduce a helper based on the current Xen guest_cpuid code in order
to fetch a cpuid leaf from a policy. The newly introduced function in
cpuid.c should not be directly called and instead the provided
x86_cpuid_get_leaf macro should be used that will properly deal with
const and non-const inputs.

Also add a test to check that the introduced helper doesn't go over
the bounds of the policy.

Note the code in x86_cpuid_copy_from_buffer is not switched to use the
new function because of the boundary checks against the max fields of
the policy, which might not be properly set at the point where
x86_cpuid_copy_from_buffer get called, for example when filling an
empty policy from scratch.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Rename _x86_cpuid_get_leaf to x86_cpuid_get_leaf_const.

Changes since v3:
 - New in this version.
---
Regarding safety of the usage of array_access_nospec to obtain a
pointer to an element of an array, there are already other instances
of this usage, for example in viridian_time_wrmsr, so I would assume
this is fine.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 75 ++++++++++++++++++++++++
 xen/arch/x86/cpuid.c                     | 55 +++--------------
 xen/include/xen/lib/x86/cpuid.h          | 19 ++++++
 xen/lib/x86/cpuid.c                      | 52 ++++++++++++++++
 4 files changed, 153 insertions(+), 48 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index ed450a0997..3f777fc1fc 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -570,6 +570,80 @@ static void test_cpuid_out_of_range_clearing(void)
     }
 }
 
+static void test_cpuid_get_leaf_failure(void)
+{
+    static const struct test {
+        struct cpuid_policy p;
+        const char *name;
+        uint32_t leaf, subleaf;
+    } tests[] = {
+        /* Bound checking logic. */
+        {
+            .name = "Basic max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC,
+            },
+        },
+        {
+            .name = "Feature max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT,
+            },
+            .leaf = 0x00000007,
+        },
+        {
+            .name = "Extended max leaf >= array size",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+            },
+            .leaf = 0x80000000,
+        },
+
+        {
+            .name = "Basic leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = CPUID_GUEST_NR_BASIC,
+        },
+        {
+            .name = "Feature leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT - 1,
+            },
+            .leaf = 0x00000007,
+            .subleaf = CPUID_GUEST_NR_FEAT,
+        },
+        {
+            .name = "Extended leaf >= max leaf",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD - 1,
+            },
+            .leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+        },
+    };
+    const struct cpuid_policy pc;
+    const struct cpuid_leaf *lc;
+    struct cpuid_policy p;
+    struct cpuid_leaf *l;
+
+    /* Constness build test. */
+    lc = x86_cpuid_get_leaf(&pc, 0, 0);
+    l = x86_cpuid_get_leaf(&p, 0, 0);
+
+    printf("Testing CPUID get leaf bound checking:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+
+        if ( x86_cpuid_get_leaf(&t->p, t->leaf, t->subleaf) )
+            fail("  Test %s get leaf fail\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -685,6 +759,7 @@ int main(int argc, char **argv)
     test_cpuid_serialise_success();
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
+    test_cpuid_get_leaf_failure();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 151944f657..4db2df3b52 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -764,48 +764,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     switch ( leaf )
     {
     case 0 ... CPUID_GUEST_NR_BASIC - 1:
-        ASSERT(p->basic.max_leaf < ARRAY_SIZE(p->basic.raw));
-        if ( leaf > min_t(uint32_t, p->basic.max_leaf,
-                          ARRAY_SIZE(p->basic.raw) - 1) )
-            return;
-
-        switch ( leaf )
-        {
-        case 0x4:
-            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
-                return;
-
-            *res = array_access_nospec(p->cache.raw, subleaf);
-            break;
-
-        case 0x7:
-            ASSERT(p->feat.max_subleaf < ARRAY_SIZE(p->feat.raw));
-            if ( subleaf > min_t(uint32_t, p->feat.max_subleaf,
-                                 ARRAY_SIZE(p->feat.raw) - 1) )
-                return;
-
-            *res = array_access_nospec(p->feat.raw, subleaf);
-            break;
-
-        case 0xb:
-            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
-                return;
-
-            *res = array_access_nospec(p->topo.raw, subleaf);
-            break;
-
-        case XSTATE_CPUID:
-            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
-                return;
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+    {
+        const struct cpuid_leaf *tmp = x86_cpuid_get_leaf(p, leaf, subleaf);
 
-            *res = array_access_nospec(p->xstate.raw, subleaf);
-            break;
+        if ( !tmp )
+            return;
 
-        default:
-            *res = array_access_nospec(p->basic.raw, leaf);
-            break;
-        }
+        *res = *tmp;
         break;
+    }
 
     case 0x40000000 ... 0x400000ff:
         if ( is_viridian_domain(d) )
@@ -820,15 +788,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     case 0x40000100 ... 0x400001ff:
         return cpuid_hypervisor_leaves(v, leaf, subleaf, res);
 
-    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
-        ASSERT((p->extd.max_leaf & 0xffff) < ARRAY_SIZE(p->extd.raw));
-        if ( (leaf & 0xffff) > min_t(uint32_t, p->extd.max_leaf & 0xffff,
-                                     ARRAY_SIZE(p->extd.raw) - 1) )
-            return;
-
-        *res = array_access_nospec(p->extd.raw, leaf & 0xffff);
-        break;
-
     default:
         return;
     }
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index a4d254ea96..050cd4f9d1 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -431,6 +431,25 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
 
+/**
+ * Get a cpuid leaf from a policy object.
+ *
+ * @param policy      The cpuid_policy object.
+ * @param leaf        The leaf index.
+ * @param subleaf     The subleaf index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * The function will perform out of bound checks. Do not call this function
+ * directly and instead use x86_cpuid_get_leaf that will deal with both const
+ * and non-const policies returning a pointer with constness matching that of
+ * the input.
+ */
+const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpuid_policy *p,
+                                                  uint32_t leaf,
+                                                  uint32_t subleaf);
+#define x86_cpuid_get_leaf(p, l, s) \
+    ((__typeof__(&(p)->basic.raw[0]))x86_cpuid_get_leaf_const(p, l, s))
+
 #endif /* !XEN_LIB_X86_CPUID_H */
 
 /*
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 8eb88314f5..924f882fc4 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -493,6 +493,58 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *p,
     return -ERANGE;
 }
 
+const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpuid_policy *p,
+                                                  uint32_t leaf,
+                                                  uint32_t subleaf)
+{
+    switch ( leaf )
+    {
+    case 0 ... CPUID_GUEST_NR_BASIC - 1:
+        if ( p->basic.max_leaf >= ARRAY_SIZE(p->basic.raw) ||
+             leaf > p->basic.max_leaf )
+            return NULL;
+
+        switch ( leaf )
+        {
+        case 0x4:
+            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->cache.raw, subleaf);
+
+        case 0x7:
+            if ( p->feat.max_subleaf >= ARRAY_SIZE(p->feat.raw) ||
+                 subleaf > p->feat.max_subleaf )
+                return NULL;
+
+            return &array_access_nospec(p->feat.raw, subleaf);
+
+        case 0xb:
+            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->topo.raw, subleaf);
+
+        case 0xd:
+            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->xstate.raw, subleaf);
+        }
+
+        return &array_access_nospec(p->basic.raw, leaf);
+
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+        if ( (p->extd.max_leaf & 0xffff) >= ARRAY_SIZE(p->extd.raw) ||
+             leaf > p->extd.max_leaf )
+            return NULL;
+
+        return &array_access_nospec(p->extd.raw, leaf & 0xffff);
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.33.0


