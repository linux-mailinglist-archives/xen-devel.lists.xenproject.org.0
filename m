Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15633D019
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 09:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98224.186257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM5OT-0002TL-UJ; Tue, 16 Mar 2021 08:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98224.186257; Tue, 16 Mar 2021 08:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM5OT-0002Sw-Pp; Tue, 16 Mar 2021 08:49:37 +0000
Received: by outflank-mailman (input) for mailman id 98224;
 Tue, 16 Mar 2021 08:49:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sz1a=IO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lM5OR-0002Sr-Jw
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 08:49:35 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9678c398-dd82-42a4-81f7-aaf8c851609c;
 Tue, 16 Mar 2021 08:49:34 +0000 (UTC)
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
X-Inumbo-ID: 9678c398-dd82-42a4-81f7-aaf8c851609c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615884574;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mBbFwb/KuX2+Y3vs3c/wXzZRoZx5HgEYfOjFVqwiukw=;
  b=c2tLsxov1Pd8DEfr9lWBZDa1ZD7lS+v0nSSMNKWFZkwwHJycw2rXnWRi
   AtYz+5e7jh+kBSPeVdNdiVLyjz814DltYAtX4nQU9BpWgInQGDJGA2Kx4
   wC5s/pNx2ny6lubzk5ZBV4pMPgmS3bp0Q3f3vPjqaOyB8ttfAlKrKJb6m
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QtGgo7M/W94/eKqoszkiTa9+QPQlMCTCM023F+aPh3DkNGC0k3PKcA7RXzB2k1l0/Emsb72wlZ
 BVfIMVy5FScgxuOGc4hRdlaRjMEo+6J9Nzx9fEGiVPLbhwrOo3xjW9lW3nDmP+tXaFtz+WZHMy
 x6PBKcQ/hrakyifnR8Za3nsr2ata/tSuz86vBWkZnwVyFRslL0yYffjNAZrA252cHB4VLcUuuB
 zWAo4k/3YUQkeV36Oo8xYxV3LZaX5Wj2qLCKc0ZjDXlWPbCcU9fSRttWWqBwsDiv9wMwsskceu
 dmE=
X-SBRS: 5.2
X-MesageID: 39540860
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tjnme6w90dgo5ZtTXqUZKrPxsO4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf9LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7LfEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2ojehlIxqov9n
 WArhzh6syYwoqG4zL/90uW1ZRZn9P91sBObfbjtuE5Iijh4zzYBrhJdKaFuFkO0YSSwXYs1O
 LBuhIxe/l0gkmhAl2dhTvI903e3C0163nkoGXo8UfLhcDiXjo1B45gqOtiA2LkwnEttt19z6
 5Htljx3/E8bWKi7VbAzuPFWB1wmk2/rWBKq59qs1VlXZYDc7gUlIQD/SpuYeY9NRjn44MqGv
 QGNrC72N9qdzqhHhTkl1gq6tmtUnMvJwyBU0gPt+eEugIm4kxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNSdspcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 j8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbcBGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl9OoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdOXDXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 lDCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEW4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9kbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IESb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQRppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjFNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHMvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7TEBrIT8cSnyqbqXYuNHMq9D0Kkfb01Abk62b99nglGvbWKElnQbZeA9z01RmRe9+4lL
 FCyfQytq+MF0+0TPis46TedSRCJRPeunTedZBglblk+YYJ8IJuFJzaWwbS3H5J3B8CPN75/X
 luNZhT0fTkAMtTZMQcdCJSw0oxmPmOJEUttBbqAuVWRyBbs1bre/eI6aHPs7whHwmooxbxI0
 CW90Rmjrz4dhrG8b4REKQrJ2tKLGA69XR55euHM6ndEh+jee0G3F20NBaGAfVgYZnAPbUbtR
 Bh5d6U28eRairjwQjV+QJBHZgmyRfQfeqCRCSWGeBJ9NSmOVODxouSifTD8wvfeH+ccEQXhY
 pMaEoKSN9M4wNSyrEK7g==
X-IronPort-AV: E=Sophos;i="5.81,251,1610427600"; 
   d="scan'208";a="39540860"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqqUpDzF4+VBJbIdmSfoWggLY7QJOfb9khIY19KtTvdnhp3XsDdIwsn/O4vyUKBIwl/y8OBtf/nUjHscKsdpgWZT9N8yE1vxZ+8lRGQgoL62dVma1V4w73xCjyXu4raqBVp0INnyj70NeFNbmoR01rSkcdi5vb0D3U39oOyep0RgsKsf/riWg9eA3R9niVq60Oy6c6FxH9ONm7VjRe6K5ZsUeV7CYFvSw6jumDbHMhmP9YzmX8hD3q09H3A0bXdq0EAYXf+cnI83vC4RZB0qNYW6txyxgw83PPyc8AGLp3NcYz54uWuPAoIffUjSaGSkdh9DmSkchqO+ILsDw4Qemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlasv4Jn1OoVRsj0rAUhjQMBr2L+njGmzqACO3Ed0yY=;
 b=AqhaQJfIiqUBjO1tV28eYMEG8yIP3DQd5Qj793XOaYnaFPim3r5LhdlTjTK1Kj5xHmDj5zsGxlc148AsZY/MN3x4Jrx/fDoVJ5MdDmYhEewfI1u3BMJmMJhZDDRG45xjsHGA0e/7Yulw3vlqgDDX+4YvbM0mAcL0yjQ7gjDNZA8uxLiVgXEpfM33r1Evw3l+UUFiC7TnTSZw14vVICA75ZLp82H4B3MSarULdgRxPG2TJ+Sq2I2LcXqnvJdK6yy8Vvpe2M9bVlq3HBBbG133iD+rpgpRrr8XrFQi/qxlmghxlcHucFYk9lvDbEPejfRMbRzt1fBwPJUOQBs5A8EmsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlasv4Jn1OoVRsj0rAUhjQMBr2L+njGmzqACO3Ed0yY=;
 b=uNMcCRKZi3SCQV5I/hLotk1tPjYcAeSpYVzpIuIoVTvE3zURNBlfZjbuOusVeQm6FrpFYmcwqLSPv50sGt3nA9hS5RgKJle6OxENQV5L2MzxuVbRM2q8NNqzBgTcsG3FccCX5G8oquW/i+9s9c3zv2QuZqYgZ02N64tUY6II0v8=
Date: Tue, 16 Mar 2021 09:49:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <committers@xenproject.org>,
	<Bertrand.Marquis@arm.com>, <cardoe@cardoe.com>, <fam@euphon.net>
Subject: Re: patchew - gitlab-ci notifications during the Xen 4.16 cycle
Message-ID: <YFBxEz2tNAQg1pE5@Air-de-Roger>
References: <alpine.DEB.2.21.2103121236430.18926@sstabellini-ThinkPad-T480s>
 <YEx8hW+2StdaUpH8@Air-de-Roger>
 <alpine.DEB.2.21.2103151303551.5325@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2103151303551.5325@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: MR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69ff6a47-f112-4e28-8c9f-08d8e85869dc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4763:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4763838594216B0D2610093D8F6B9@DM6PR03MB4763.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wpqvMpao8t/lhNRJcqAGdTWomge/2ugndrDIhUBjXnnPP7WoBEa9wQe4FwvnCVW8R4dnEwhdHUI0BA5f6C3aG/JmEr6xbV413sdUK0L1+d7n6Kl1Sw/4j1aqDvCcBvH2N3bmGN33g9zaWudKcPmQBbt7FpfhD8cHCkNpmk9MTn7ktH0GkjEW/k/SY97GGGCDEwK8vFpld2w7/2+72afvIgvco0SrOR6+EDoM07/GIeZs46a2gusqn6QeEN1A3aqkHIngCSDu6hA7gJjexuzzNYR+O2ZMe5iAFh52kohshJlKaLtGihNhcn5Qk/S8iHK2e99mBSRlPgiWqnL25FO4mpFQaNKSinRzEJvp0hdSyYjfst+hgZsISmf9h4u8Al+JXRQe8NfQyQAvfZQX6LZsa4BZklQG+Ye7GZ+lcvTLg0WqJQ0sxVPUaNVmPr2kzsGYQAit8hIaOt3mBvusPCpFnYgCr12zNdzZtX2Lxfj3GCeHbJrRGLbmAM0mvLeXXWmV80j3N+D5H9ayCn4Bo0Pi2N8vx1OECDlFXqodZBAApaP+o9mZpr9kVgsoBRkf/Pkamz16fvf8tPB+UhoXfD7OrL9eiIU+e+y73yb8vroWyc4UwMrW543Fqny+g+3nXIzPEkNOcHLuOrWuJWZFAYzFIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(346002)(136003)(376002)(396003)(39860400002)(15650500001)(86362001)(33716001)(6666004)(5660300002)(316002)(2906002)(66556008)(6916009)(83380400001)(8676002)(6496006)(66946007)(66476007)(6486002)(9686003)(966005)(26005)(956004)(4326008)(16526019)(478600001)(85182001)(186003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TkpydDZiZ2tsZEsrWnJJUTU3RUY3L0R0eU5mUjZhR205aVJWc3ppaFprT0FZ?=
 =?utf-8?B?bDJURHZ0RndkNDZoZVRLcFMvcXNoYzRaUi84SjhHc3dxRi8rd2JlMVFpem1i?=
 =?utf-8?B?c05oYXRqSWQzU3JNbkpiRVBSdnJLQVdFV2ZSNk9hR3Azc0VQZTBtb1RoL0dX?=
 =?utf-8?B?NXZYMGZLVlZwdFhkc21sV041ZGtuUkg1eGJTYmcwZ1BwSmtiR3RlclIvZVdu?=
 =?utf-8?B?TzVWMm5EYnNvOVBVR1dlc05kSWNXTTJkTUYzRzJGaSs3U0ZMSVdEWXRLUkFx?=
 =?utf-8?B?d2tnUXlxVEhvdytBWFJISmlOWFBlY0N6R0FIaDUwc3N0dlhQODJOcVprWGhy?=
 =?utf-8?B?eDVmZkk2T0RISmY5SDdyd25wSUpZU2ZFSDlnSFdHaldTUk1iVWoxaFlCaHFy?=
 =?utf-8?B?Y1FIK2xWK1E4S1J1MnZ3d3NvRzhYcllZcTdIVVAxUi9sQ2lXNWNWekpVQnBk?=
 =?utf-8?B?WFBEaFFGWnExVmZSMTZkaHRiZU1UcXY2RUxuNEY5OW9DeVJoaW5VOWcyZkNV?=
 =?utf-8?B?Rm14TVhNU0FGc00ydklwYXFMMk8wbGpQaThEa05ONUZZMis1bDdERFpSQXBm?=
 =?utf-8?B?cTBGbzlqWndSZUpncXhpZVNKdFdmQy9JU2xONmZzNCtMbWVBb2RzWUdOVXdt?=
 =?utf-8?B?U3NCbXJxdU5tZmdyZXlpVU1Id21RY05ibWYzR3p3Z3Rla0wrbk45bVBONmV4?=
 =?utf-8?B?SVNZcXJSeUtWZmNsb3BycDN3U2dZeS9lV2xlQ1gwbjFmMXRsVVhGVGc4VWNq?=
 =?utf-8?B?Rys3dkY1UTBxOVcvNkJOK0drQzYvSFQ5RjNnV2ovZlVZTzFoS0Y5ejZXUCtI?=
 =?utf-8?B?Y3RkdlR6dVlpSDZQUVZLclV6ZmZWb0J0S1dyNkxiRWl3Q0x5SHNmc1gvQXRv?=
 =?utf-8?B?UXg1dlVLbVZPM29yTG0rZzJjRndFVnJFMTc4U0JwK2w5ZXVhVWVQUG1jQStj?=
 =?utf-8?B?bTFXa0pra1dPZklRTFA4V0h4SG43b0Z3RWZwL0lmdHNIYWw3Y2t2OExkcVR2?=
 =?utf-8?B?UEQ0ZjFCR0Mrd0J3R0RQaUFDRFU1RXZRUTJocmF6NDZ0RkhLMDRaVm1aS2pG?=
 =?utf-8?B?N1JIbVY5OWVVNnRRYmVVakxZTEFlVXd0OVBXMC9YUWNleGpoT05WMThHNkY0?=
 =?utf-8?B?T1lLY0dnSmRxdldxUUFzZDRvK1c2cVc1KzVZTU12cXZYa0dUZkR5V1BHUmZK?=
 =?utf-8?B?cjJRQVE5dytjeXI3UFFRdnZDM1JzWTErbW9LZExSL1VWTmsvYjRPV21IOER3?=
 =?utf-8?B?QWNuVURwcDdpUzdUOHgzYkY2L3N3MzJVQXc2dXhjc0ZEcjFQWlJJNlUvcWpF?=
 =?utf-8?B?TlQxR0J4TU04cEdvVHdXc3MxWGEyRlFETGNnZ3VrcDRJejRmTGJNV0JySkxL?=
 =?utf-8?B?d0NoeWdBQ3g1NzQvNmx4cmQ0bnVmNS9YU0ovUDRST1hEelpXQ2E4WDh5UXlj?=
 =?utf-8?B?RXp4RGdkYXMvemt2Vnp4TjRRZVg3R0hHWmh4ZHY5eUVPRTBxSjRDWGo2am1m?=
 =?utf-8?B?Q3lCdHFIeFFnYW4xT0ZBLzdHVk4yTTRBUnJRRWtoVDRPdlJaRkwwRTdpa2I2?=
 =?utf-8?B?QnpjV2RkcEZ1QTFpMjlTSFQ5NDFkczJrUTM1UnEyYWJFSkticGJrZ2hPREQ1?=
 =?utf-8?B?bDg1dkgvL2JXb2hIb2hNeG1INXB2S094UUFSNEYxV0k4d1RlVWFUSUxNNnZF?=
 =?utf-8?B?VElHN2swT3VKTHg1bWhUVDZiSTdZSXhSc3ErVFgxQnJ5cnlSWTFla3pTZXBx?=
 =?utf-8?Q?7i8jpJOmOBWDR7vLRB0xjK0Jb06CUxBZGn0zt3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ff6a47-f112-4e28-8c9f-08d8e85869dc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 08:49:30.6460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEATiLi/Xu15q/EdZgIf5UMp+vn9bm+Aa0LLb3ES+2reiO5Hy8YM05Eb4wXBar63REFyXlWQxE53o6kur/8KDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4763
X-OriginatorOrg: citrix.com

On Mon, Mar 15, 2021 at 01:05:08PM -0700, Stefano Stabellini wrote:
> On Sat, 13 Mar 2021, Roger Pau Monné wrote:
> > On Fri, Mar 12, 2021 at 12:55:38PM -0800, Stefano Stabellini wrote:
> > > Hi all,
> > > 
> > > During the last 6 months we have been working on improving the Xen
> > > Project gitlab-ci and patchew infrastructure.
> > > 
> > > You can see the results from gitlab-ci tests on the staging branch here:
> > > 
> > > https://gitlab.com/xen-project/xen/-/pipelines
> > > https://gitlab.com/xen-project/xen/-/pipelines/269678673
> > > 
> > > In addition, and more interestingly, now we have patchew integration.
> > > Patchew picks up patch series sent to xen-devel by any contributor and
> > > commits them to branches under this repository:
> > > 
> > > https://gitlab.com/xen-project/patchew/xen
> > > 
> > > Then, gitlab-ci tests start automatically. Patchew waits for the results
> > > and send a notification email. You can see patchew pipelines here:
> > > 
> > > https://gitlab.com/xen-project/patchew/xen/-/pipelines
> > > 
> > > All this typically happens before patches are even reviewed. Today the
> > > patchew notification emails are only sent to us in the Gitlab-CI working
> > > group. But the good news is that we think the results got to the point
> > > where they are reliable enough that it would be good to share them with
> > > the community.
> > 
> > I'm not opposed to that, but we seem to have some random git clone
> > failures during builds (at least on the x86 side), that are more
> > frequent that expected. At least recently I had trouble getting a full
> > gitlab CI pipeline run that didn't hit one of those.
> > 
> > I will try to figure out what's going on by adding some more debug to
> > git to see if I can get more verbose information from git on exactly
> > what's failing.
> 
> Yeah we brifly talked about those during the last gitlab-ci meeting.
> The current theory is that they might be an infrastructure issue and
> we ask Doug to have a look too.
> 
> Your idea to add more debug info to git is excellent.

I've just realized that all the failures seem to happen on the -bobcat
runner, which is maintained by the Xen Project itself. The -dingo
runner seems to be fine. AFAIK they both run on Rackspace
infrastructure, so maybe there's some tweaking to be done?

Maybe the machines used by the XenProject runner have some kind of
network limitation?

Thanks, Roger.

