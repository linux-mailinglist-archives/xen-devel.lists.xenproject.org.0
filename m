Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375E96F4023
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:28:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528403.821497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmId-0002J6-H4; Tue, 02 May 2023 09:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528403.821497; Tue, 02 May 2023 09:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmId-0002GX-ED; Tue, 02 May 2023 09:27:55 +0000
Received: by outflank-mailman (input) for mailman id 528403;
 Tue, 02 May 2023 09:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJpR=AX=citrix.com=prvs=4790f2855=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ptmIb-0002GR-Np
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:27:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b821f0e-e8cb-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 11:27:52 +0200 (CEST)
Received: from mail-dm3nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 05:27:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6769.namprd03.prod.outlook.com (2603:10b6:510:120::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Tue, 2 May
 2023 09:27:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 09:27:46 +0000
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
X-Inumbo-ID: 9b821f0e-e8cb-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683019671;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=riX/EATnG8fjIwzTkKAbOEAU7FIgdSiaCVyzPoBYrYI=;
  b=UU2T2QvkPfu/0GNClU7IZXrhXDseTXNPn/Qr0I3MjvORSxlazoczz/HK
   77dkZ+1FekrIPPoo1+ZeVYfebR97Dm2oU/gZDJvnTL9nRKgAM2dgGhg3A
   ltH2OSB9CNQYsp8/fkIREmtMMV2VkOR4sbbCW1jxTcldP+x2apkacdN8j
   w=;
X-IronPort-RemoteIP: 104.47.56.48
X-IronPort-MID: 107956025
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dvnP2qivJMuHsnZ+3QUtyDLPX161+xEKZh0ujC45NGQN5FlHY01je
 htvCG7QOKyDZGL9cotzO4njoBhTuseAxoBnSFRlqSxnHi8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QeEzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQJB2wDMSjbg9m354yqQdFLm8lkCNPSadZ3VnFIlVk1DN4AaLWbGeDmwIQd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluS9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOLpq6Ay2gD7Kmo7CwMudV/q+OKDhHG+fIldK
 x0T5jFphP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiisywWl7gVy8kR2M2T8UjchjOwprDAVgMv+hjMRWWh8x94Y4i+IYev7DDz5PJNLo+fQkOG+
 mYNn8yT7ucmBpWKiSDLS+IIdJmr7vCJKizBgnZgGpAg83Km/HvLQGxLyDR3JUMsPsNffzbsO
 BXXoVkJuM8VO2a2Z6hqZY73E94t0aXrCdXiULbTc8ZKZZ9yMgSA+UmCeHKt4owkq2B0+YlXB
 HtRWZ/E4aoyYUi/8AeLeg==
IronPort-HdrOrdr: A9a23:QkKfhqg/PDQayhHe/l/tuaPn2nBQX1B13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQJVoMkmsjqKdgLNhdYtKOTOLhILGFvAH0WKP+Vzd8mjFh5dgPM
 RbAuND4b/LfD9HZK/BiWHWferIguP3lpxA7t2urEuFODsaDp2ImD0JaDpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlMawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbonthrcZrau5R+7f63+4kowwbX+0aVjUNaKv6/VQUO0a+SAZAR4Z
 vxSlkbToFOAjjqDxuISFPWqnTdOXAVmjXfIBaj8ATeScCVfkNHN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3am+a/hGrDvAnZMZq59ms1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgn/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9MKOM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaCqDgDKFC66
 gpfGkoxVLaIXied/Fm9Kc7gyzwfA==
X-Talos-CUID: 9a23:QJuI6W1UvQq8eHKVaLElNLxfC+95fCLllHPrImiGGG1Rb6CYDnuKwfYx
X-Talos-MUID: 9a23:tR1l1gjU39DPLBthcqksAMMpN9lQw6D/UVs3n6oGnJKGNX13JyzapWHi
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="107956025"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3fd5wyjhZpZtnTaw8zyv1w9IYxEXpbBA1F7qVmT2VphG69kl2ZpcbcQ2IHV9K1RFeuUltrDBDxA6QXzVqzbk3ekKekrP3zvY/x2ipVWfMwL7IZCL7i7LJ/lXkfH8dwLEMXgtvUNzCTa0nF36NLMIdosFbLmps0GuD6qD0C4Wxi8qdGvh7LF+vitvPR3SSRvrV8pu3pR3zOVUJvTBl56rFbTRRcrCBfjC70OclCOadziPTmD1Yy2py2cpdANllhhOhNzFXdnzQ4m9QcdglyHyk4vwLaCilqFpcoDJBRD0LBwfrDlIkOXWIh5ih0u36Zm59zPsERfS/rqyyOkU/ysuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riX/EATnG8fjIwzTkKAbOEAU7FIgdSiaCVyzPoBYrYI=;
 b=bpDd6HgEGwVkXT09d0zvxUYmMktK/s48ccWi9cFQenZyaNk9421fOLdpxwKVnWxixA7jAHD4N47IlbWI4GLjAwsOFWQnXlpQwEXATy31UC93iJHOtljrYTSxbw3OErhsMZxr0mWGE9LOrRSzdEofHk68oM4/2gOUriT/BKdwszNqTq3Lc1PaW2R7w34ytMlZPh/yk8Co4OwWal4FJdbT01gTrA1dgiet6UUsH1SwDk22+WhxGLCMJjrMuXdNCzJ3Ripx5ozdmnkRq9pFLlWfDxo6hYPeC7+ooYc8N334c/P5tRocmpnQwbIN9Az4fdRY432RSBX7jAA3Pxxj+2WirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riX/EATnG8fjIwzTkKAbOEAU7FIgdSiaCVyzPoBYrYI=;
 b=iyJllSRnSb6hIKtZLYS9/0lRcIiAsdp+T9FUKvatub9VUBBir4C6laYQTNk+X47WvvJ23L/qRRtT+BilddDTkiHkXB/qpFyaEqWMunM0pYYxWXq5ebxFSK8RPSoZU+yXLMl7TaQkBHLxMzAGgdIvzMrSqbjS4qNmYEgeJ/cDHOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <afc999f3-fbe0-3b52-2f8a-b8b5a36eda87@citrix.com>
Date: Tue, 2 May 2023 10:27:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
In-Reply-To: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0186.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a625af4-d1f2-400f-3203-08db4aef7cfb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PQ+fdx9BLui81JXByME9Hcxz3ybzz5ksKeT8Y3G9GiSvZPSCQYl0QO399qgu2L70dMB2TYXS9+crtzfxYUPSaDqMlHuiuNbeOjQAApEg7xSZ0s1LaecyP9gzax03TYqYM2xV97EdusCyEi0qEnY8Gx2sBh4nH5KnCzb3+uJeinJz7CThOpNRK4mOi/6UtROXNe81qL5SBQ/NsydIdCHccQ6wmZB7fCdBVUT2x4Hg9QUNG8wIm6+1wYgONHg0AjCI8vswl1/+calxlIq8UgmScygJKkjES4C1LbK6Ngf+gH8TmzgV8GZNsVwsE475HH0UjlEvmdISFpmNUf59qbYpwlXVP0dnRFNJ7dXgYOvHTbtK1msCvDIGCF97JrW9x9Cf6XqU2sHI+Zq7BSJE1ObS/gOcVC/eYTIXokcRyxS95cxpEWDCoweZ/VjgWt8YFUt++CyyExBKRjZk1zXDNIYrKaOVp0vIpyQGjQJZ3OtN7QBMihqKrKl0F/UEIVGZ/yWe8+pN7WEMo5vhpzh2hxUYUZt+f0sC+Oi/Fmr3Lg6vZes5JG8T+eDmCubvw6/wNmOClPgmCvavaqZ3nr1QPjBTMkOQl5lusf6qsZ9spnv5B0JmhWlkWj8hmPIRVBiLK/kFmpPn9hgNQc/bKWnP4cZ3fQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199021)(38100700002)(82960400001)(2906002)(83380400001)(31696002)(2616005)(86362001)(26005)(4744005)(6512007)(6506007)(186003)(53546011)(6486002)(31686004)(6666004)(66556008)(66476007)(36756003)(110136005)(478600001)(66946007)(5660300002)(41300700001)(54906003)(316002)(4326008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnhLclJwcFozc0IrTHEyZElDUzMreXlsVVFoQWt1ZVh5a2lKQnFhcXNxcXlK?=
 =?utf-8?B?NkFobHFIVlBJc25pT2IwRzd6d28rbE5zZGNad2F4UEdDS1VadmRGWDcxc096?=
 =?utf-8?B?SWRDVjAvS3JlaUwwMnAxNmlZNVliSlpRUytrbjVWREZaamhCenlNbFpoVXY1?=
 =?utf-8?B?cU9XOVJXVDh2dkVVRzRyY3ZPdDlyZ2dvUlZLb2JaVU00M2NjMXd1UTZ4RmpZ?=
 =?utf-8?B?NHk5WFJZM3NjOW05NjJySmlmd3NjS1ZnQzhnL05BWU1vNGJId0VkT3Uwb3RD?=
 =?utf-8?B?UllhNHJDbHFEbnBDaW1NVjhMcmV1RTR6TENBZ1FiOGVDTEltWUtoQ0luM1Zw?=
 =?utf-8?B?ZHFON1pvbGtVTVd3dTFXT05SbjRianZtSzBNbDA2ZXpqdzBSbC8wblVSblln?=
 =?utf-8?B?QWxHY3VTclZqQTR5S21VelZEeUVPeFI5RXdZU3I1NE80RUdIMXk4TUphWVBK?=
 =?utf-8?B?NGNBQTdIM3liQjlsTDFSblkzWm83eEJPNitISmU1RkdhMTh6MWw2bVVKSHpB?=
 =?utf-8?B?RklHZEtubW9PQXAvTDBUUndJb1FPeG5yUHdtV0x3MEp0VlRabXovVTFyNCtI?=
 =?utf-8?B?MzE5bWJodDZwLzdUZk9JSFV5SDNRbDh5OENFNHJVYm5QSGZmb2JreXVMeTdY?=
 =?utf-8?B?ZkI3MXJsL0lDK25NRzJKVlNWYUJveFo0dVRaMlh5TlcxRE9NUDF0OGZ5Qnhn?=
 =?utf-8?B?VHdob09XUXdFbmNpM09TOXlvVDdFdXlhd216NnNnTVEwMjFEYnBpV1dxVTFz?=
 =?utf-8?B?VXVocDVuSU1BVm5rUHFkYVNNbnJrLzFENmljZTIxSGh4YWRldVd3YU5yZXg4?=
 =?utf-8?B?YW8rbkJNOUVETzYvRlN5aE1SdTV0UU1yZkN4TDRzR010RXpiTkQ4M2pwQ0s1?=
 =?utf-8?B?Qk1ialVNV3BKaGlSUjVjajI0YXorNlVLWmVoZlJFL25JdzVQbWN6aHdnQ1Vw?=
 =?utf-8?B?VldqU1lDTmJMbHpSczBoNFRPRWxtWmZRTDlOdHFLbXA5dkl1VUg0MzEveXVh?=
 =?utf-8?B?cTFoMGJBZEd2VnNCbHovZEU1cHM2ejVTZlI3YlV5a3FjOURTMmkwRWV4dnJI?=
 =?utf-8?B?d0lBbnhWMTN0OHZ3T2tKNjF5V0l0ZzJrTit4bVFOV2MxY29VTmlmd2Q1NVBN?=
 =?utf-8?B?NjgybnZBN0NkVkh2LzFDWFE0eHFhM2VzQ0xXdk95STlPSk9xRjFnZVN2bEZh?=
 =?utf-8?B?U3p4Vk9CRUN6blYvckdGTUNVRWM1YTRnbEVnNDJKSFYyZUZaamdLOU9ndWxy?=
 =?utf-8?B?RWpSMHROTlcxUlZnQWJGWUJXdC9hL2RYbnJIdCtIanM0STg2U04xQVhjb0tv?=
 =?utf-8?B?dkRiWXdaUzNtckN2OFg0SitMNDZYbXB5NVgrekoxQXJISEQ3TWF4U1lwOHFK?=
 =?utf-8?B?ZFNWWUdWaDY4MVJ0NXFVYWdVdEQzVzdOMS9rY216NFl5U1NMckozTHRIdjVF?=
 =?utf-8?B?NGZmTWh2TkxMUUlSNjR2YTVzNldxMVNzL3ZYajJRc1FVMEVZaGt4UlphTSt1?=
 =?utf-8?B?cVFQYkRaZlJBSTBYVGtqeFc1dWJxcVl5YmNNaStlcGF1bUFvWlBrcGJyclJq?=
 =?utf-8?B?eUZhbHBXcHRjczdPazM2U2ZGd09KdmdDakFDbGF0OGZUaEw1R2JCZ1UyeXlm?=
 =?utf-8?B?NlNMSkdEakpyNTh6aWlnQVdETFRIOXUxM0pMdWd2Sy9kb01lOUJSMmRFSGdz?=
 =?utf-8?B?NDROcWE5VTlrU040UkgvbHhySjZkRHJkMzIzN2gyVW91bytZUWFtb3VQVlJt?=
 =?utf-8?B?ZEduT1I3VjMrQzZXS1pNWVgyZ0EwaDNtSEVSNFNzMVlSVkZCWE5oZ1ZtRmEr?=
 =?utf-8?B?S25jU3RlZEttZkYyQmo5VUlYN29sSnYyZ096MUp6cVpLTnJYTVBZbFNmQzRF?=
 =?utf-8?B?YnBDMWF0MVczRDFkdjVjT0tWcDRwcndlZGFMVkdMNnpLVTJpQ09ibDUyZkQx?=
 =?utf-8?B?cllJWGNOWkpDUGs5WWQ5RXBVNk5qWmowV3A5b25OSTYzK2l2d1huQy9QbndM?=
 =?utf-8?B?dWMrbmNuVFovbHlaMUFDejVnZ1lTNHVUSkVZYVZlV0N5OWVDV2FSN2pCbldj?=
 =?utf-8?B?MlRaV3d3aTMzakxjQXB3OVZLV212UVZjWWhMOUpqdjBqaGJZdkF4enlNc3JK?=
 =?utf-8?B?TWt1VFFibG1IZkRHa3ZOREl5U1JSc3JyMlZ5SGVkd3ZNSzNjcEdyNmp1WE1r?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?ZlBvSTIwWjlpc2JhM0JxR08yVjMwS21WS29JZjZhMUJPYWd0eURMZnhPK0Fw?=
 =?utf-8?B?aGgvY21HaG56bjRJS21uSktzNkpEM2VIYTBOekpBUFZHMkpGWW96QWtGSUpF?=
 =?utf-8?B?cnB3TVAvZWpleFFWMDQyRnU2V2t1eHdaSHZDUm15Mmh2Q250WThlaUdHUExa?=
 =?utf-8?B?ZkNDNGZ5VnlJRUw5Tlk1ZFNGUGlucDQ5MjA2WWhYS3NFRk82OFFkZDYrNW5s?=
 =?utf-8?B?azVDWFVXdXZvR1FVK3U1UUNKeDRFN1ZvYmdERzg2QWxON2MraE1RNTJkQkpk?=
 =?utf-8?B?MkUyaHA1OFQ0UkdvemdoaUFtSERaeU9MejVvU1BCK0hwQk4xOWlPNGk2Y3RF?=
 =?utf-8?B?VncwRVlLbGtmMkpscURVendrdFFub3JFZEl3NC9RT01NZ1g5SWh5MDVwTVhy?=
 =?utf-8?B?bDl3OTR5ZXY2RWRwNXhPeFE1K09SZ0hNV2pLa2dITktiNmJiUmxVUzR3dUJB?=
 =?utf-8?B?TEZyMEo0bFhpSVBrODFxQVplM056Z3IxQjNmdk16T1lZV1ZTUmtGUmY3OXJn?=
 =?utf-8?B?ekNsVzZsKzFmUENhM0ppVVN4VzFsSWJtbVZLbVFlMnNzZDNuUFpLWXVXUlRy?=
 =?utf-8?B?bVJlbHdWaHp4NnVONExHMHAxT1Q4NGlaeFpoa29wWlRCd3VDSlZueWNaYTZF?=
 =?utf-8?B?NVpnckkyb1lkdXp3ZnVqdWtza1VPdDE0TGh6WFJGWENwUDUzRGZVdk9GUFBy?=
 =?utf-8?B?eEtqbmNPd0xoVFpPcjFkUGF1TE9rZzN5UXRqVXhLTnU2UEhjQUtWanZpSjRG?=
 =?utf-8?B?TGY2THNMMWg0bEo2dExCak1wMEFzbjlYdGNzZXB4N2VINFRuVWcrM1AyRFlC?=
 =?utf-8?B?S0hsUHdBTmxob2JsT2c4dGZNWG4rRG44MVV3SXgrUkV2NnBmUGpYYnQ4TlpC?=
 =?utf-8?B?cit2bFJEUkU1VGpia2tQbnRTQTh3NzV2UGpqZ3lic0xBQjZ5Y0svbzhidEht?=
 =?utf-8?B?ZzBNendhUGUxMjl4b2w4NGtER3M5RG95Q040R2dCNGtDQzNFU3llYkJyTlBx?=
 =?utf-8?B?TEpFUzhsSzJRUXp1djhVbXVrVWhrSzhVRHMxZThGd2F0MGdkYXN6QTRyYVkr?=
 =?utf-8?B?TkVTb0poQldzQkVnV0J2SUtFMi9Ta3FMUzZQWTFCTmNvUUNycDZ1VjRGVzh2?=
 =?utf-8?B?N0VRYUdCQWhnVmNiZ3pWc3pTcWhHVDk4VnBEV0RPQXBNRXQ5OGdjK2JHbElr?=
 =?utf-8?B?TmtsMnJPcGZ0NUtqZXMvTWoxRXgrUEFXNVgrd3BCbjJIc09JUnZ0VDZTRHgx?=
 =?utf-8?B?NEE2bk5XRFhyWEdnbld1RlgvQngyanUraHNqT05sUUYzNS9lQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a625af4-d1f2-400f-3203-08db4aef7cfb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 09:27:46.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IljGmG+AiW9XRvjX5Iq6TUmJ5AbtW4DokiYURa+DBPB1+e/ei4Pw9g4ClcdeyZQzpwmDEHXMgqcJcQmRxhlwJYbsjzS2Rpm3vdCKe8cWw5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6769

On 02/05/2023 8:17 am, Jan Beulich wrote:
> The hook being able to deny access to data for certain domains means
> that no caller can assume to have a system-wide picture when holding the
> results.
>
> Wouldn't it make sense to permit the function to merely "count" domains?
> While racy in general (including in its present, "normal" mode of
> operation), within a tool stack this could be used as long as creation
> of new domains is suppressed between obtaining the count and then using
> it.

This would not be the first example of the XSM hooks being tantamount to
useless.  I doubt it will be the last either.

With the rest of Alejandro's series in place, all requests for a single
domid's worth of info use the domctl, and all requests for all domains
use the systctl.


As a result, we can retrofit some sanity and change the meaning of the
XSM hook here for the sysctl, to mean "can see a systemwide view" (or
not).  This moves the check out of the loop, and fixes the behaviour.

~Andrew

