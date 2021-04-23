Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447A4368FB8
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 11:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116022.221410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsOr-00039A-7R; Fri, 23 Apr 2021 09:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116022.221410; Fri, 23 Apr 2021 09:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsOr-00038k-3d; Fri, 23 Apr 2021 09:47:01 +0000
Received: by outflank-mailman (input) for mailman id 116022;
 Fri, 23 Apr 2021 09:46:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZsOp-00038d-C0
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 09:46:59 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22071e9b-9577-483b-b0bf-ce830c960dc1;
 Fri, 23 Apr 2021 09:46:58 +0000 (UTC)
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
X-Inumbo-ID: 22071e9b-9577-483b-b0bf-ce830c960dc1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619171218;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jULlK50QeX/Y8AEyYlTlLdE3vCTVfOQ8jyejnSwrpFg=;
  b=hmYyKVG/c8yNnkkBfjbm269VBgZrx48dcgu3erFFzKMvmcOXB5NwCjfO
   r74r22Dkht14EoTAh+DzF22PxeYVjGvqCwAyTDnPOotzUwt4JHpiQOwEB
   I+M9hmGuoMsnGq9RDWQ6StYDqlHabD8QRgQEhniIw8BsaBqFDzRuFrL12
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LWHFkNgVfHKhca7K3WtLTPYpg+/HsJxxiTc0mTiapKWjxkMkrNJwQEUaNM5W6tMG/yURg/uxqa
 dbqOwkiAW0mGfofI9HXwJqYPiiz8OZWOekwUOWpLOgu2X5RXRIL0TKS88+Z7LSVxSIsbgH9L8K
 VnUOiG+Yov743T3fH8yQmO4b4WfHkWnpBYc1bywwcAmNVT0mglb7Oi6bIe8goL2eK5GZzdJytW
 2fhNqmn1Qu/gTFjXkTrDuumilFVN4tvaRsVGPl+n1dOGPuNs667QYzztTRiq9TE3X+PU5vMvlg
 sxM=
X-SBRS: 5.2
X-MesageID: 42256268
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GHFBaq2DkytRRTKX5icwwAqjBSN3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrdXFebg9AGJY/Cd
 6w5tBfoSChZHQQaa2AdwM4dsLEoMDGk4+jXA4eC3ccmXKzpB6LyJq/KRiX2R8CTyhCqI1NzU
 HpmxH0j5/T0c2T5QTb0wbonvFrsfvnjuBOHcmdzvUSQw+c9zqAQKREd/m8sCsuoOepgWxa4e
 Xkhxs7Jcx85zfwUwiO0GLQ8jLt2jov9HPuoGXw6RCIwb2bNUEHIvFMio5DfhzS51BIhqAF7I
 tx03+ErJ0SNBvcnU3Glqb1fit3nUm5q2dKq590s1VjV+IlGdtshL1a1kZUHJAcJTn9+YAqHc
 J/Zfusm8p+QBe0aWvUsXJox8HpdnMvHg2eSkxHgcCN1SNK9UoJgncw9Yg6pDMt5Zg9Q55L66
 DtNblprqhHSoszYbhmDOkMbMOrAgX2MF7xGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUXtD3FRCOn7GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7CLTCDclYziMGtys9vTPHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk7odA+d1WSot/aC4Hju+DBGcyjZ4bFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfMdyXEjNBNOZmf29JW5JkGN4VKvARQo0++/Nu3JTpLtbFzWE
 N/Jbjgg56qvGXexxeM00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPUdfwWWAPR06a8/NCg
 ZQqxBW9MuMXtOt7BFnL+jiHnORjnMVqn7PZYwbgLe/6cDsfY59KI0nVqx3HQDiDAd0hg5ulW
 dGZGY/Nw/iPwKrrZ/goI0fBenZedU5qhysO9RopXXWsljZmdsiXUIBXzmlUdeehCEnQzY8vC
 w0z4YvxJ673Rq/I2o2h+o1dHlBcn6eDr59AAOZX4lMgbzwdAZsTWCFuCyCh3gICxrX3nRXol
 akATyfePnNDFYYgHxe36rw2H5fd2mWfStLGzhHmLw4MV6Dlmd40OeNaKb27nCYbUEaxPoBdB
 vfZyEJHw9oz9er9RKclTqYD086zpE2MuG1NsVlT5jjnleWbKGYn6APGPFZuKt/PNf1q+kRTK
 axfRSWID6QMZJf5yWl4lIefA96p3kvnam2hFnL7G2k0GU+BvSXClJ8XL0fK8yd6W+hZ/vg6u
 QNsfsF+c+LdkP2YZq67IuSSRhpABbau3S3QOElsoo8h9N6iJJDW73gFQLV33RG1igkJMj6lE
 kiUL12iYqxSLNHTog3QWZl5VInm9SEEVszviH3CuE4e0sxj3WzBaL835P47Z4uCFaGvg3+JB
 229DBc5e7MW0K4pPUnIpN1BWRdc04n7nt+uMuEao3LEQ2vM8VO5kCzPHP4ULhTTsG+aP8thy
 c/x9GDhOmMcSXknCjWoDtgO6pLt1+dfvnaOnP7Jcd4t/qgOVqNhaO24Mm8yBfPIAHLF3gwtM
 libkwfbsNKlz84qpY4uxLCDJDKng==
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42256268"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhA90rtXacNrOY1AthKI63v368L4AxqZQqUT+eCZsQGVIzYYoh12BLhLyJ1hRUCO4Ogn3FTF1Hrh3inaLfhYO64ySUgEFVYQHw2P84PCkQVB1xHyJmqYzSy7fEd8XY6F/3dBj72bzuwZJthAEvEOkYYLsSWF5WhG0pwPCtC6CUa0qXImUbn3BOXYAQaCr7kKaDGn6z0mM33ghURjPcxFq7TF5zGv/6RPLOo0KJ4hT90qGJ2bGhlJbhjIIKyO5ScguPkihn6NtZ8GISQmMPqxX2vVmbyRz4EPk4HRxC9JSQx7j4iPtipIcXiPsTFh4ZiXd+vqJxjuwK3ervxTmu3o5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jULlK50QeX/Y8AEyYlTlLdE3vCTVfOQ8jyejnSwrpFg=;
 b=Gi4bHxKcx0z++njHfoLZe4vkxE9x8mZMia9ngCdgAlYC96xYuaHxi96SFXTtshvrb0x3kmI9++l296+B/1ekrqPMhlg7sodHMX9sF1I57oTvFud6y6KkeqxPTcUXifxiRDiWfGC/45Syncc/Crr8g7fWqJBHqeJAPVKmV6gcyUhljUYC8TInTMXLSepkBw2MCiY6lRtUGRJ7s15V6OPFkGbUKBcrR7EtVtI1t3hcvro42YcMIWuH9siBxoRKYrxj9vmvYEpJX2pjJntwG5H3eTH8o9arzsGrByrpee88MJmWz4IOzCs7hxRWdDykCb9DQRN2Xutxi7A1+RBjvoU9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jULlK50QeX/Y8AEyYlTlLdE3vCTVfOQ8jyejnSwrpFg=;
 b=KSte+egIpT7BRaT1Drz6Foot80H0raBsws3iKQzePDnW1YeNcYzUjXCPPn6mkHPO6ksozoCLQQ/N8RZbkCNbmPvtVDPKnnZzBIT7Lz+wM63J09RRrA2/mYzDW5Z1cMO+Qns1pCRNTkovcuvFWCBDAbpoZUN1OupMIbt4JzOrJbQ=
Date: Fri, 23 Apr 2021 11:46:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/pv: fix clang build without CONFIG_PV32
Message-ID: <YIKXiRv7yIsGMqd0@Air-de-Roger>
References: <20210423094343.5850-1-roger.pau@citrix.com>
 <20210423094343.5850-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210423094343.5850-3-roger.pau@citrix.com>
X-ClientProxiedBy: PR3P191CA0025.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f71a2819-4602-420e-d95a-08d9063cba32
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55910511C39BC837713F24208F459@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KquGlHb0hL2xOFFIt77boQR5TYFA4NRSFBrfJhUieJgsnAJSTFwKIbsbX8m8vO4+X594px6kg3DhPPJEwtrReRvt6zWgBc07TPHjJVTZOyQnPvhpuomCLE5RL9fkh1U90x+AGEhJh7aR9tfGd9V6Zn2ft9NKgCZc8DtFQGU24tyodHyLvn08S3WpFu4lknOkoioaMDWsJllw1N2q94U6sEvC+lBqYErHi5WN8628/3oFFJV7t0MZ5/JuOtGIch4iijx4YP4qd+WXiH0gQ1MDTMER60X0neW8GtfaBvVfAMuqApQdFrIMFIbtIYQm/GUT8LAaXww9nn1sYcbEedKjgyCR7eOt4EsQ0/ciEK3aYCs2zYRGzbn9cFBz98/+LrcFNH3HM6vrRKqx+F2l9Rrazo1q8/XhG9GKmGO9QlVWg9jq72zt9lJKPOKFI5VkoVYc1rlR+5lrlKE44aKoQtjsyRNN4iESVbkYNBIrg8Bc5Uooj9Q+F48FNB/DtwA4FisD99DcgFMl8DDjrlbrOeUweaDdA24RlHf1Hbvv4u3FU+oOoXCs1dBi5krcCBeqWka1CDbmezSl4KKt5QIkrsOCBBiPqL1lHEmqK/oDjpOigvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(9686003)(8676002)(6486002)(6916009)(33716001)(85182001)(5660300002)(38100700002)(956004)(4326008)(26005)(66556008)(2906002)(186003)(66476007)(16526019)(54906003)(478600001)(86362001)(558084003)(66946007)(6666004)(6496006)(316002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OUFzeEtXRHJhUThoeXhiVU1Eb0hDcXlGR3NNQkZSUDdqS3d5Z1llVG9LSm5C?=
 =?utf-8?B?eE05YjFtRklHOUhrQzU1Y3dKN3ZFNTZodFVYS092SjNXbFZFbjRCQzZETW92?=
 =?utf-8?B?aDBNaUZ3OERLSTh4aWlHRVpHSmdKd0xET3VBZFR5bmZWdzBwRHozSlJKSTlp?=
 =?utf-8?B?bDlXc1o2UUtwYkltbEdlYWl4Z3NBdVhqTHF3V3R5SzhDM0JucC9RaDk4Yi8x?=
 =?utf-8?B?SDlaTEdvaWVFRHU0c2czTVNyT2tqeFEzSlp2M1VNSmhIMXlKR3N4QURuTlk1?=
 =?utf-8?B?aWxET2RKM3djNjBOMU85WXRCeUZ2Lzd0WGlvK0JjVmpFaFFWZGhjMlIwTXlI?=
 =?utf-8?B?ZmVxQjhlM3Y4NHpRS3BTRUR4bUI2RUlNclR1WTVxdmNzak5yRWVvZ3ZlOG5O?=
 =?utf-8?B?S2tXMk5nbHc1NC9VMjlTS2wzRzJ5Zm4yNHI2TWdpdG9MakcxemNIWjRaMUlP?=
 =?utf-8?B?Wi9MUTBvZjEyL2ozd0d3R0ErNmtJVjVhUDBlMndnZ0IvbVk0RkJ2L1RRc1F3?=
 =?utf-8?B?Z3hLZHlhd1lwMTB0VkZUNEJoc2RKTFlMSW43RzJUMFZRMm1zSzdlYVI0VGVs?=
 =?utf-8?B?Z2RtaHVRSHFHZC9GT2pvbE9uQnpYeTllSE82MVlHT3ZWeTFLNk83MWcvcVVo?=
 =?utf-8?B?cjZTRkNnRUJ5eHNnZDNvbXZNam8wRWRUZFpiUVV6Qzk4TjY0UmxMa2tDeEc5?=
 =?utf-8?B?cCtaK0tpZzJSOS9WSlpPbW9Eak1tUXM4TlVSekNTVjdFV3FvS2daN1RXUmJF?=
 =?utf-8?B?Zk40WS96QURRWkM1R0JGVFAxcWl1aENyWVB1akxMOVp1aUs4cTczVytNK2R3?=
 =?utf-8?B?RnVvbWJMdWcyd1k3YjJrWmtuMUVybWU0akRiU29lc1FjSDFCbEpvQ1BJZ1Bv?=
 =?utf-8?B?R0FUTERaNEpZMUpqMHZBMFJtb1BFdHdxb0pjaE5UMkJ3cGNkWFZMUDYrc293?=
 =?utf-8?B?WnhQaHVxbi9qN0NhT0RHV2t0VGgwU1hxSEd0Q1NUb3FZRFA3azRrVXlmMU5Z?=
 =?utf-8?B?TkZqODdrenlTYk44ek4xUDViWWVJQjFZbmNKRVJyR0VkSFN5UDhUYmV5UnJl?=
 =?utf-8?B?dFhEOG1ROUZEMTJRVUVQNDdRYktpTGZzTGNvYjhxM3ZDaXdLcTR1TGd3bkR6?=
 =?utf-8?B?RGhsc1gzamxwUk1RTXc0SVpCS2JJNXhuRFNQVWgxV1Q5cDVaV3hpSlI4TUcr?=
 =?utf-8?B?SFlidWFweGZPOS9CaURxNE1uU1dBNlVraFZnbVdmY0VhbDJQUjhUV1QwU1Jh?=
 =?utf-8?B?QmRPeFd5b1NRdnI2U1lrdC8rS2tJTjU2em1OMjh2RXo2RUJOQkFWQ0RObDZ0?=
 =?utf-8?B?YUlTMW5RL1BTbEFGU2lGSTdDWjZiMk01cWcvOEgxbWEvMUR6bzU2YnNqaUlE?=
 =?utf-8?B?NkFncXp5Tm1jRDBTNmsrbnVYZDN4aU9OalVuZ2JDVm5QZUgzU1FoMWFBbE44?=
 =?utf-8?B?dXkwOGxGQWJVTHYwbk9JbTVaSjcvZnFtQ0NZWm1KM3F5TUZqeDh3SStNOC9B?=
 =?utf-8?B?QW1qaVVnLzVUVm1MOXFxL3l5WVV4RW1PL2hQQTVlaGdzZ2dJVTgrTTM3VllB?=
 =?utf-8?B?Q2paRU9kbHNzb2twZHRUMXZpVmxndzNjeEFvU2YyVmdtTHZtalZ2dExybDZR?=
 =?utf-8?B?bXFDS1c3QXMxbjgzTDN4Y1crV0h0ZzBXd0pwK1J3bFNmYzNDWC84eXhROWM1?=
 =?utf-8?B?WTJSN3VaaGJRQ2lrY1E3c20rZWZNRHRpWWlITEI2ems3NnhJaUpFT1lRUGsw?=
 =?utf-8?Q?rcludJLfSWZjum4ZCMWzZ6VCnyiTCptJKZW0ULs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f71a2819-4602-420e-d95a-08d9063cba32
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:46:54.2639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofTYKOSyoOtC4FbPbDYenYNKEm8ZHOi5bBAXPFhCXt32dhNuu7rSoxYdDU2hnmvG3NRLzhrM9eDj6Roru5rJyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

On Fri, Apr 23, 2021 at 11:43:43AM +0200, Roger Pau Monne wrote:
> Clang reports the following build error without CONFIG_PV:

s/CONFIG_PV/CONFIG_PV32/ on the line above, sorry.

Thanks, Roger.

