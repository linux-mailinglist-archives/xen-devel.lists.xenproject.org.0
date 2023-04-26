Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F756EFD29
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 00:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526840.818857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prnfN-0005LB-JH; Wed, 26 Apr 2023 22:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526840.818857; Wed, 26 Apr 2023 22:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prnfN-0005Iv-FJ; Wed, 26 Apr 2023 22:31:13 +0000
Received: by outflank-mailman (input) for mailman id 526840;
 Wed, 26 Apr 2023 22:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldec=AR=citrix.com=prvs=473a90206=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1prnfL-0005Ip-Ni
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 22:31:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07391e23-e482-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 00:31:05 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 18:30:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5773.namprd03.prod.outlook.com (2603:10b6:a03:2db::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Wed, 26 Apr
 2023 22:30:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 22:30:44 +0000
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
X-Inumbo-ID: 07391e23-e482-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682548265;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4nw0Cds71RGSE+AxdSb3cmGc1BsiqZaUNI/kvew6Qj8=;
  b=DjXX/85vLU4ZJAhx7uKGrGAKtHBufDs9cRrgy3F9drUy8+OFydDiEiln
   o2OGjW4xa4FIKjE7iGxMaUf3V40EGgV04dozobCb1w0qWsAJ9r+7IjPyx
   ygBlSyrQsmlZN2DtgZ2Y9RiU4aPnTU5EkqsPcAdv8HWTt+Mm+QnHrjp5+
   Y=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 106888233
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:H9CZwaw4AuBqqRtSbwV6t+eQxyrEfRIJ4+MujC+fZmUNrF6WrkVSz
 WUaDD+DP/eDZzbzf9B3adu+ox4O6JPUytY2TQE++SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiP64T5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV9o6
 fEAN2sGVzeCwP2ckeyESapHpe12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQhuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANxCRO3iraUCbFu72TMKUTMcDUqHnvSljEWdf8BVE
 FUKw397xUQ13AnxJjXnZDWxpHOGtxgQQd0WDeQ+7AyPzYLf5wGECi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZtR+FK+4iPXlFDe2x
 CqFxAAlnKkah8MP06S9/HjEjiiqq5yPSRQ6ji3IWkq14wU/Y5SqD6Sq5kLc9u1oN5uCQx+Ku
 31ss9Sf6cgeAJfLkzaCKM0oHbqp7vLDFyfOjFpHFoMksT+q/haekZt45Th/IAJjNJkCcDqwO
 EvL41oJtNlUIWegarJxb8SpEcM2wKP8FNPjEPfJct5JZZs3fwiClM1zWXOtM6nWuBBEuckC1
 V2zK53E4aoyYUi/8AeLeg==
IronPort-HdrOrdr: A9a23:54cRXqv9HPYWBXRfNeRMppuy7skDFdV00zEX/kB9WHVpm62j9/
 xG+c5x6faaslsssR0b8+xoW5PgfZqjz/FICOAqVN+ftWLd1FdAQrsN0bff
X-Talos-CUID: 9a23:tSGrUG6a2EeOu/pCE9ssymgIF9g6KXbk63aXPGXpV1lqC5a2YArF
X-Talos-MUID: 9a23:FFelbgTthe1EudkXRXTz2yg7Gs0w8piRBVwLmrYiqcO/LDJJbmI=
X-IronPort-AV: E=Sophos;i="5.99,229,1677560400"; 
   d="scan'208";a="106888233"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4eLznXHKioee5hKGGZjQasgte8pt1JlMz+kRdJD38V3woFLrHp0Dq8vQzANrrFBckJEgFW1Mr1aXJ4HH8Sdfq3PEaGV+3KLSyTRzKNGN89W12i7Xs+OwS7AvZSCe1rjkcObCWf8wPAEo+oypGMF1iFFkaF+83j+u8KMSNROt8Qe9jNnXBF28BsvXZFhplWUBQQ0o1fqrAHlvFMzuBEPH1vwAKe8pfm21VGsfoNwRr2oq3+AK4y6iWhwgzQGT4K26gYRwqjsy2wn6s77PyzczBR8+W0YEgfjTKgx6YYf+nf2jTtFqLw+y2OsYex2A20Wcc3t6xyalVoJXNZtWSbtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w9bPw8y6S/YFtiIMXqD+Okee94jIAXriIc0tbrE3Vs=;
 b=GLEFExtVbJGogePF/4EAnAzQQvug1C5ojgvtKOp/uobf6Rqn/q+8YICv5fyVL0FaegIL8l/1g3HlW5D5S4wHBzk/IXVwXduPg7WUj39vsWgywj8LDjdZYEgz/xmpoivNPfbGoXMDnviQ9OSiUs0DWRHfWPeNsCsGxNg75+Iftqv+hkjOL96CO+FD6KFPCszeRle1QonygJ8Yt//iHLeXnFJqYhcboJ4Y73Ec1EKGxfvZVGosZFBA87xI92xG36e3/QkjkKUjkC6+cSW08Oz0eu59TG2rzBG8zDjbEFjBOFMTyBgjcn5Fl3rGj8r0oSA2fqvwPr+ZrCzyThEy7rhQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9w9bPw8y6S/YFtiIMXqD+Okee94jIAXriIc0tbrE3Vs=;
 b=Cf2wXwt9vaiM1HuNzoA9mNdMm6hCWur96UcoRvdBMRVdlmXOe2s4tHnQ87PB1w5VAna1k1aDPB3qFmlclYEOcJcMsXTOgb5J8KVJlOUxQxjZFBuNg941yhJL+8WzEKEEqwlM8NMzaeybz6hqLSbHk7ctP8JEQztAbvJW2Fmu+WE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cf554e7d-5d9a-8beb-b0a6-810267e5c3ad@citrix.com>
Date: Wed, 26 Apr 2023 23:30:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Gitlab curiosity: Was [PATCH 0/7] Rationalize usage of
 xc_domain_getinfo{,list}()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Tim Deegan <tim@xen.org>, Michal Orzel <Michal.Orzel@arm.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7fd86a-f49c-4017-9e99-08db46a5dfda
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KQCI5Dwed1Hz9d5VUmhvvhzQxh9CMM0a4KKZ98o2i3/rGGzj4KMWldcmJWOVNRaXPBhKRtMNJdJ1miJEZXwyBx2IuU/y1S88/FIhp6eQRoVUPy/abkdDa595Tubl1Ok8vPx4K2xRqP6a6Rrf6YX+ywxHpKX5cewr4uK0nFC9FyirqvLn9XP06gBYyc+N2M0Eq0riR5VYjf56aOoCEL9TRVcn6YZHzcMu5fTxygCvlqtdIJmooLuT6jnWCVgv/3u0GpjIGmMeXgh6iAAvCXdwxXD/UR4jDkYXLAINNG5NTX3JtG4OiqxdjDCAenKfuhbrkTUPB5Ejf3yVpSCDXLo9gezp1z91pDPj+R086UVggcD6Hi1Wv9/uXW07qxAtzaO2yI0eMOVIL+mZkAyXe7PC9//U9pgwjxSfavgsVX1mVnFZymykTED8x+dJ03pqGjKwXdX6y/k8iDbcRpvEr5DIcaQiKyx8lgns3ztChhUxhQgSP42uGldVavxsxKQrpMtfsAQyR1KxYaH9qr4xSCkhnOhj/E/P78tzP9k088vlHTMpdYHAtFvsZi2KfJ25YlvHskqMquCEm2PGlbdw3b1WcJ2QrL9Ohn54LkPDhH8hMNAeW1Ur5VLFesUtYeWARu37qryspXFd6hSgnW4soubqOmyxIouDcKjd6EzKIQ00qOvGho3vF/vnFvdA1BCdl6rl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199021)(2906002)(66946007)(66556008)(66476007)(66899021)(316002)(4326008)(7416002)(8936002)(8676002)(41300700001)(36756003)(86362001)(31696002)(26005)(6512007)(186003)(53546011)(478600001)(5660300002)(38100700002)(6666004)(966005)(6486002)(31686004)(83380400001)(2616005)(6506007)(82960400001)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDU3Tko4SExNdkttRy9EcXlSTVMxeWhhV0tJUXN4RzF0QnFPbGJ2bk51bWtR?=
 =?utf-8?B?ZHFaeUxTemx5YUx3N2NPL0xwY09adHpESkQzQ2FMZkJDVWtQRXRGc2JJajQ2?=
 =?utf-8?B?elZIejZzSzh4ZkVLNG9qNG0vZXkydmUzZXJmYTlIc0VTQ2FwYmkrc1ZGNG4w?=
 =?utf-8?B?bG5FZGNuSkJFSUx6bTlFZGhxTTBrNDJ1SENMYStneTliM0wyVTZ0OHRuZjY1?=
 =?utf-8?B?Vy9GcUJMYWZBZTNhWFRtRWp0VTFRQUcvb1BFZDZUZWs2MFJJd2Q1ekRZaHhh?=
 =?utf-8?B?SXA2azNSb0d3OWIyTDRIZElhbzUvSGlIN1dUeWNDN3JsWmRlWmpMait4cmRp?=
 =?utf-8?B?Uy9GNUNJSkQrZ0g0aUE3VDFac05DQXczN3VYblNkdnU0MWR2U25lZUJWby9h?=
 =?utf-8?B?V0ZWeHdBeGJma1VlbVcyV3hSVlNWZFI1NEFJMXVQWENCc201UTloU1dNL2dv?=
 =?utf-8?B?S1BMNk5DMTNmL1RwRWRDSU1qU0tKSG8vcUtKNitJQ2ZRYXhJOVM1NEdrdVds?=
 =?utf-8?B?TDNmUHhXb2pmSmE4SllNdHkvN014d0IybkwxK0JlOG5rTnBZazJna3JnZGdB?=
 =?utf-8?B?V3pGdDZDOG5wTjV5dGZHR1BLTm54L3hmWEVIcWJhL0E2MmV6dStIYWJTZDU3?=
 =?utf-8?B?cENlVHk0T3hrZHRWbDEra1JtUFZ3UExxaUZsVisvTkZRdm92bWpCRGVaZC9L?=
 =?utf-8?B?SjludVoxVE9jUHVhMHRFRjlyWHZIKzd1bmpmSDl6Q1MveXJpS25aM3V3bzFj?=
 =?utf-8?B?djUzT0Y2c0VtWUZTbWV6ZWp4b3JaVU1iVFBhUWNSTEhyNnRBazVScGd2SXJE?=
 =?utf-8?B?cEdNSlVhYnl6T2M5amxlcXpIcnM2bmNwdHBWbnk0UlpOeGFXdDNKRWt1bEwv?=
 =?utf-8?B?aVNWVzByVDlacU5xT1dPM1FzcGIvR1pOS0ZDeU9aOFRUamYyQjk4RDNoUXZU?=
 =?utf-8?B?WDVhVWE4aVJ0VXlpWEcxVCt6SHhWOFNCYWVINHdDeTUyK2o3Uy9SYjB0clY4?=
 =?utf-8?B?RjVNeVhLOStkNzdvTzFEeWxoNzhjYnMwaXlNWXhlQyttR3RWdEtBV1V5dEdm?=
 =?utf-8?B?djhlRjJUU0FhMzVIWGRmcFNLWGpjTk9SNk1DU3p2YVpmWGM0Ujc3VC8zbVE5?=
 =?utf-8?B?YTUwN0VHbFNkY2EyTWx5OTRNZ0R6Qm9tQy82MG9uSGtRRHN2RGlTZWFCa2JD?=
 =?utf-8?B?bzJka2VVWnJNSlJvVjNPU25WNHl5RjJ1d0ZjQ2syMmtjbFplbW4xSE00eFd5?=
 =?utf-8?B?a1pGU01DdlErU2dMUFRNdm9vU25zaG5Kb0l0LzdpK0t5eTltSEd2dXUxRG9z?=
 =?utf-8?B?Uk5QdnNHbGJBNDZFNWpyTENCZFFSYWt1UmxWeXJjdUVpazJ1d1FvbUVuS3VT?=
 =?utf-8?B?eXNaZkJWaW1YZTloMEZIaE93Mno4UXVxRzJmZWZMM0pxQ3luSTQxcUhJeEZF?=
 =?utf-8?B?Z0lWVlBkS3ViVGRzbkhtTEdPby9lblU3ZHREc3FoZ095d1hYTkJVQUpKczYv?=
 =?utf-8?B?ajJZNUFYTllkWjQ3TmhKbkdrMENOaTdncUNaVGRZRnJWcEFVZXhLSERXYkxG?=
 =?utf-8?B?NmxCUHR1UkJudEs2ZVMwQzdGRzZLd0lhN2pxMWxiTmJ4WmpiRUZLSWNZMVNH?=
 =?utf-8?B?YTVMN09wd1QrSi9sZVFjYVo4YW5ySlJtaFVvb1VaL2FwUklhYTlYZXBaMElx?=
 =?utf-8?B?WmRzVWgvVkYwL2dmZVZiOVZsOUhHNEpDRC9aYVY2dnJpYXhGUElvLzlkQXhF?=
 =?utf-8?B?TU9venpFaE9DS284UGVUNFpGSWF3RTFtUk4wNklBQ1NtRXg5UUJXNHQ3K1FN?=
 =?utf-8?B?NUV4ZkpUclhtVC9Fc1Vnc3dpMVp3ZHdxWVE1VFg4U3lSckViZUVKR1NkREZs?=
 =?utf-8?B?UHJoK0trNUxYRVI0czdVSVBEUUxTb3J2THlwT0xKZEc2MVNsTXZxU1pEbHRL?=
 =?utf-8?B?U2JoZitPaFFXY1RuM1NXSWhvdENhMEdGdG9jM0pOSGRSWmVyTlhIRHk3Z2ZM?=
 =?utf-8?B?c3pWbGtpSE9JZzFYTFVqaGtoemRmZzF0WDZTMUpmNkFsYVlxYlhkMHUrWDRj?=
 =?utf-8?B?K0tDVVd4QVRxL1NsUCtscEVJMmZuTWN4M3dVTXZXZUVNVnBZL0dWbENmaTJN?=
 =?utf-8?B?ZWhBcmhKWnZyRCtZNjlVZmtqaVpSNEF3U0VpSHRXSDkxOVBoNG1UR2pXSE4y?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rMm+nnLZORTsT0sJcbu4EVlTDxLb9zD0Hn43wCvlZVP9KWsHKcE6z+NouW0rXFVPzOk/XaSCyaDiL3DHRx9MxkaFojOlYBEcm21uB927lNuB4U67n837UR/Eu3e4IdhPe9UjCUphkfrkjI6sVV+pd5UJgwdnav8xwXyTCSbKD7Znr6oHdDFwUO6/tdj0Pj8Q7r7+WxRiz7HSu/aM6oLD6s2/R+iPPqwIPtCQcMEEQnYWJhk669v5DJ2t4czc/v0r7hKtzOI9MQiZ11WPJKKqq5dy5LT6Kb1TAU/pXJ+qfRAe6lWo+2rLxBPphanC2lRYry/iMH7p27CzEchdrFyI6Msghr5fnNkPTcx2SoGmv0kE3/lCJHJ8DJTpGlKNrvx32NJkq2AJt3w/I/+1glNFLwXK/mbaccK3Rl1u54AwU3u++oF0fbYsrWnR/L9SQAHatx1K69bLzcDva9O1iA8TvJyeBb/lcxxjT3Brsp9uCZmHumwOGxHJ0g9FSgAvyrwGScJfRQMSnDRA2ThV21bPP14zvUzy8SpakK0sK0Fixug1nK7o1IvQ6fWf9wDjLzdNkizN1nlGsVK9sP1oaVOC5QU+s9VKkhM9hRY1BAGPzIiT0m4NpOYBpTn3Vvr0ROSXAXyRwahqsl74jNvcIDYjIQXjCQC4z2ni5Goju6zELPW0EzQENPT09adz2mclFLMuwHbfgss9Ll/VqtXnUlcPUsQrh1I8wWcsxhFNTWgOtDdryfZLZeKWgtq8OuhN8Mv3LTo7YMu+KoO7NjlMwBOZ9IjCxv7C/5NBWZGErjAuD3R9UBtkGTZSlVKQLU3MD4pKZcNiRInttNgdJN9PoYrJSuELc80rEqWEOlTi0iFC5jya431cEQxD3pPioHD8TEKThZaVod0eNGyYBLjOO3JlQQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7fd86a-f49c-4017-9e99-08db46a5dfda
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 22:30:44.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkgRDJZe4fAdjPOjnocSJ6ETnSuIeN1Ja+jgyiVOC/pdTAkwlXBG7Ti1gjHyz9iTgP6QA2/RugTRLQPQX4RGqyq54GQNKZfSVjG/hz6cSz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5773

On 26/04/2023 3:59 pm, Alejandro Vallejo wrote:
> xc_domain_getinfo() returns the list of domains with domid >= first_domid.
> It does so by repeatedly invoking XEN_DOMCTL_getdomaininfo, which leads to
> unintuitive behaviour (asking for domid=1 might succeed returning domid=2).
> Furthermore, N hypercalls are required whereas the equivalent functionality
> can be achieved using with XEN_SYSCTL_getdomaininfo.
>
> Ideally, we want a DOMCTL interface that operates over a single precisely
> specified domain and a SYSCTL interface that can be used for bulk queries.
>
> All callers of xc_domain_getinfo() that are better off using SYSCTL are
> migrated to use that instead. That includes callers performing domain
> discovery and those requesting info for more than 1 domain per hypercall.
>
> A new xc_domain_getinfo_single() is introduced with stricter semantics than
> xc_domain_getinfo() (failing if domid isn't found) to migrate the rest to.
>
> With no callers left the xc_dominfo_t structure and the xc_domain_getinfo()
> call itself can be cleanly removed, and the DOMCTL interface simplified to
> only use its fastpath.
>
> With the DOMCTL ammended, the new xc_domain_getinfo_single() drops its
> stricter check, becoming a simple wrapper to invoke the hypercall itself.
>
> Alejandro Vallejo (7):
>   tools: Make some callers of xc_domain_getinfo use
>     xc_domain_getinfolist
>   tools: Create xc_domain_getinfo_single()
>   tools: Refactor the console/io.c to avoid using xc_domain_getinfo()
>   tools: Make init-xenstore-domain use xc_domain_getinfolist()
>   tools: Modify single-domid callers of xc_domain_getinfolist
>   tools: Use new xc function for some xc_domain_getinfo calls
>   domctl: Modify getdomaininfo to fail if domid is not found

The patchew run found one single failure,

https://gitlab.com/xen-project/patchew/xen/-/jobs/4183881202

This part looks reasonably fatal:

 * Starting local ... *   Executing "/etc/local.d/xen.start" ...Starting
/usr/local/sbin/xenstored...
/etc/xen/scripts/launch-xenstore: line 90: echo: write error: Invalid
argument
Setting domain 0 name, domid and JSON config...
Done setting up Dom0
Starting xenconsoled...

except it was only the part trying to set the OOM score after starting
xenstored, and the only way that plausibly fails is if the pidfile was
bad.  And then the other print messages are clearly out of order.

I've rerun the pipeline a second time,
https://gitlab.com/xen-project/patchew/xen/-/pipelines/850230144, to see
if gitlab thinks it is a reliable or unreliable failure.


But, there's a plenty of other stuff in this log which is concerning. 
Stefano, Michal:

 * Starting networking ...awk: /etc/network/interfaces: No such file or
directory
 * ERROR: networking failed to start

The domains ought to have a interfaces file with "auto eth0", or even
nothing.  Alpine clearly isn't expecting the absence of the file at
all.  The fact the ping test passes usually means that this error isn't
as fatal as it makes out.

Next,

 * Executing: /lib/rc/sh/openrc-run.sh /lib/rc/sh/openrc-run.sh
/etc/init.d/modloop start
 * Mounting modloop  ... [ !! ]
 * ERROR: modloop failed to start

Not sure what modloop is, but this doesn't look healthy.

Next,

 * Loading modules ... *   Processing /etc/modules
modprobe: can't change directory to '/lib/modules': No such file or
directory

This probably just wants an empty dir in the filesystem.

I could go on, but I wont.  One thing that we do need however is
/var/log/xen/* pulled into the artefacts of the job, because if there
really is a real xenstored problem hiding in this series, there's no way
to debug it with the current artefacts collected.

~Andrew

