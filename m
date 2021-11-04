Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D964450FB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 10:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221333.382996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miYrY-0002YX-Ki; Thu, 04 Nov 2021 09:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221333.382996; Thu, 04 Nov 2021 09:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miYrY-0002Wi-Gq; Thu, 04 Nov 2021 09:16:48 +0000
Received: by outflank-mailman (input) for mailman id 221333;
 Thu, 04 Nov 2021 09:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6ik=PX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1miYrX-0002Wc-5E
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 09:16:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed202a25-3d4f-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 10:16:45 +0100 (CET)
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
X-Inumbo-ID: ed202a25-3d4f-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636017405;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=e25DeakF1GciaaMyvi/2bSR/EOOvXC4O+Nh5jNUWAgs=;
  b=P4dD1t5cXXGWwA7ZbO9tGKnbq6E/bEfnhY//nyqnDKY7lrl78q9CZD+/
   kFRbHUDwXHsfw9njABq4xJs3GqkDFXv9JUl2tp6zxtvZ0cqYjP/sgFh9e
   KwapusRG68AOTX0I3ZRQmtGyrtWYwdSeShkOMKi2v4EP51V2GG+eurGyZ
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TWL5OE9mckwiKtQruVEuRmkk75DKgDWxHgrrcT1qM6Zgs790vravq9lSgrzNvwdzRlbIvIxSsV
 q0YgtNZ6qpBpi/TkoPizzjgehXGfKsfCQjqCoj07rp5vKOGd7KqsRjKBYoCVrrAhqYl5fRICWu
 okjXNrGa6MXesLrDSVOSDPiXAkFHnwNCKEN28Se6Hj6Dh7XmCkPUZLAK/RNx9DvBJL+uLkZxFU
 xkEZ7+hSmExK/MtexSngBTecfs5kyYRuD3UwuaHtLeTuB7zeJZ187WTwTFFY6Gth5ctlK3UDX5
 eVCdNzeDX+RocU8DqzKEaxa3
X-SBRS: 5.1
X-MesageID: 57052522
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:y2Hd56P4mspPS5PvrR31kcFynXyQoLVcMsEvi/4bfWQNrUp0hWdSy
 GUcXj2GOvzcMWb8Lt0nbtni90IO7ZHRzNdlTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eo/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozeAjo9Tk
 dltj7ybcydyJLfPosI9QQYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iVvYICgW1q7ixINbXBZ
 9M4amJ0UDjnaCdNBUlHN6Bgl9790xETdBUH8QnI9MLb+VP78gt117T8NcvPTfaDT85Vg0Wwq
 3rP+iLyBRRyHNCW1zet6H+nge7L2yThV+o6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIvsqoa5EGtVsP6XRCzvDiDpBF0c9hfCeoh8ymW17HZpQ2eAwAsUTppeNEg8sgsSlQC1
 FWEgtfoDjxHq6CORDSW8bL8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nZtR+FK+4iPXlFDe2x
 CqFxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C3VV3P6zFp1RLSFTLaIskLB7sxmDJSGGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsIGexO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bMgAgBc2B2yMnT3
 Kt3l+72XR727ow9nVKLqx81i+ND+8zH7Tq7qWrH5xqmy6GCQ3WeVK0INlCDBshgsvjZ8VuIq
 48PbZPbo/m6bAEYSnOHmWL0BQpbRUXX+Lis85AHHgJ9ClM+cI3eNxMh6ex4INE090ikvuzJ4
 mu8SidlJKnX3hX6xfGxQik7MtvHBM8nxVpiZHBEFQv4ihALPNf0hI9CJsRfQFXS3LE6pRKCZ
 6JeIJvo7zUmYmmvxgnxmrGn89AyKk/23F3TV8dnCRBmF6Ndq8Xy0oaMViPk9TUUDzrxss07o
 ra60RjcT4ZFTANnZPs6otr1p79olXRCyu90QWXSJdxfJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrssBFdeEkna8a2yaXvQ8F28zNISS+2PZz3cCj/5of3we
 eVPwvjgG/Qbh1IW4ZFkGrNmwPtmtdvirrNX1Cp+G3DPYwj5A79sOCDej8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxNw2vc9/U4Jkn+9RRbxrvfXBUAJQSIhQxcMKBxbNEvz
 9A+tZNE8Ae4kBcrbIqL13gG62SWI3UceKw7rZVGUpTzgw8mx1weM5zRDij6vMOGZ9lWaxR4J
 zaVgOzJhqhGx1qEeH02TCCf0e1YjJUImRZL0F5deAjZxoub3qc6jE9L7DA6bgVJ1REWget8N
 19iO1BxOajTrSxjg9JOXjz0FgxMbPFDFpcdF7fdeLXlcnSV
IronPort-HdrOrdr: A9a23:AueUqKl/cEBi8FtMwLbHXDf1MtPpDfPIimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8vgZQpENRGtldBm9Ce3mm+yZNNW977PQCZf
 6hDp0tnUvdRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA8ciYhV9MIOA4we7rGNoXze2O/DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,208,1631592000"; 
   d="scan'208";a="57052522"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHxwfaTxYyAEvhminN5EECqSzMDiwNhNRNK8ibJOsbKrhb7vA8W+QTfVAysA0tDpitp49wlXqJSDTZVbyO3TdfTZtQ8nJVkyxrNLajV7/kuapdvGOl33addY49MRWST/bKNYVazDlZjKIyRtPP6UuWyAFdAjJvzDjHxszS3ld57Vm4yNLbMxag1ly8IRxwwtVwMLnbRW2Mbe0gDLM6uSfp2xwBKaC2vmtVJx2bhj2pQZ6D/aCoYiLY0i22gL/aO4WqRdrEtnkE8I2YItToBDdWUT89jrJJ1LT1Q68M6lqRgluy1lZFccqmME+0D4rtvyAhtyJlHpBQZ4oHQeJWbVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKKk0XoB4XQUp49SgpGlaWSDRxe1hJkXB8hf87pfg0Y=;
 b=Yudn4HsE3uhSJ2lhvOsF16Q4dlj741AAqnq2ZuUHmjoApCSfC7NXsy3VrLcYbFTliJP7pw/HcyQ3UZUiUp+jQcoPnAKzKpViXGmy23AsnL1GJdT7l2ac4E5I9aqCi/fIbIVEWksMifAjZLHYlWNrO3fwmTcY7lCkr0gZ5tGcAEBVr2Q7c6G2/MmPPQc8ViRWPIYrH8SrOLjp41fvjwI7UK1M0JjKhnwmjiON4zJSQmBTfZPIea28t+VLo6bDEoi0gMM5E5Pv5v98Ih37cBBVo7PuDyz+PFy2lS7dAgv67Wj7BIBGWpTnW3EKd6lw0juRawt5sdSyFeq6dJpgRT7W5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKKk0XoB4XQUp49SgpGlaWSDRxe1hJkXB8hf87pfg0Y=;
 b=rka75OOC7tQwckUBYggpyLr6xsUBq/Uiu4JhQIDsGF+t+zk3l2W570caQzQrapMgId77fjjvZasqRUORpNv3lAzNWt0N0rq+ul6Y3Wsh3rQhpPNfwYUMAlT0k1qsRs91eGNXqE7HuPYFS/mRW+lAHUD8JURVANE1eRCrbntFOIc=
Date: Thu, 4 Nov 2021 10:16:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16 v5] gnttab: allow setting max version per-domain
Message-ID: <YYOk8fK5uGeJEBP9@Air-de-Roger>
References: <20211103145719.96162-1-roger.pau@citrix.com>
 <e50141eb-f776-4b8d-024d-709614143ce7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e50141eb-f776-4b8d-024d-709614143ce7@suse.com>
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34dfe88b-fa49-4549-89cf-08d99f73cf2a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4841:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4841EF58012D4C5F03CAE14D8F8D9@DM6PR03MB4841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GNBhhdIgtEl+hyVjNmNBFlidVDFzo7rWtLaIkVlVhb1EbLDFGHhDtjn7p/924IPADmWG9n23pO+zhyGmqtAAzKEu3Hh9J8M+8AaakSkpmOmtuQ48sN+bIf8FnZ0j6EguMQ7h1X43D4c+4XB9gzVLkQW1Uy0dv/Xp4sRPaqERFIekDobHOXuUHzh1RHXKVbeMZ1HD2umlm90UYf0AXHNZqNQWa2gsBnRVX8GYlxhAOU2MRTmLOgdCvnf+eqah3GiE6slHCOwRvAXHeZQ0Tulla9yWWXF3tA6QOv+AV/RfHHSiFVTPvpZQgTF3RXPZMUUTyoXlLs45UvFNXgzS4h2DPMraPi7CnGl1Ja7cluOmV1dkN3gyjz4AMHPiA/W7dEzG1EHFqcAEz6OGPDoGDCj1XukTihX7FUzCnc2gFvLWrYBR82sF880CcXeYxpaVIiKoNztPzckJo1SKtSm6yKeAU+rpSd4ADTkOloC1uO1UY6K147Msjl4J1mJQ6fYRhQoMP7Bx2bcgZjnmEbOpCF30/cdrCHtlCduv9btJrNsLC14bVAaAZ8EwtRYCtTQYG//phfyJoxISdDhDRqOquddGX8PUN/8TXXZJAOviVCJk9Mple56iWNlYusPNMeCmqfZT67atBLkwZyLEPy9C4BeY1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(33716001)(6916009)(66476007)(54906003)(2906002)(83380400001)(86362001)(316002)(66946007)(66556008)(4326008)(82960400001)(85182001)(956004)(8676002)(9686003)(5660300002)(6486002)(6666004)(508600001)(38100700002)(8936002)(6496006)(53546011)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzJBWUZoWVkvOFpLSXBaRENGNmNqNkxwNGNDNDRSM3J2eVlRbTMwemZObWhC?=
 =?utf-8?B?OW50Y0dpcFNkRi9mUXRURVRQcFZBWXdMb0I3eHRoL3lRbmNVVVh3cmMvVXgx?=
 =?utf-8?B?dU5LanVMb3cyTnRGQ0JpSis0SFVJeThzRmdKY25GbVlZejVBNFh3TU5OeWdy?=
 =?utf-8?B?LzNwNWI0WXVvRkUxR2JaWjAvMWtqeWhvL1ZlK1JBVlFXOENhTWVaU0VqMXlr?=
 =?utf-8?B?blo0VVZMVzQrTm00TmZ2YUZVblhzY2phTk5UaXQ1UEhjVk9UZ0pEWDZ1eSs3?=
 =?utf-8?B?R3JmeEFzR3ZMMU1TWW9iYm1yM2tjc3hmT0hrK05aK3JnVktqYXFoNUJrdE5S?=
 =?utf-8?B?MTFHdWIzSFZacytZUlFZa2hHS0NPdjA4Q1BBckpPWXdPcXE2MWpMbFhwMnht?=
 =?utf-8?B?K2Q3WG5TVUQvRXIzU2VoZzhzWXdPQW1pbjNBYnFGK09zS28rYUptU2FvOGFj?=
 =?utf-8?B?dnJrWFVKY0ttUWEyS1FEYWVSLzVYdGw3Sk00QXZEYkV6MVk3TFNRQmVHUjZU?=
 =?utf-8?B?ZEk5b3Y1MmpGUXdsTTVHSUowQXRtMFp1bnhzcWpxOFd3R29PM3hJeWdyWFpn?=
 =?utf-8?B?Rk1ZRjg3N0lJUnM0MytucmI3TUx1Wm5EU0YwUlkrYmk2cW0xeHYzaytRWGEw?=
 =?utf-8?B?cG9sZ2VDbEM5MUdLWkVadzRFNXN2NmlNS0J3R1FrOEp2MG1iMHR0amFMNW4r?=
 =?utf-8?B?bVMyeEtJSDYrYWY4aXFENStzd1oyeEhaY2dhS0FRK0s2MGdmUE1FOTZoVUdI?=
 =?utf-8?B?clBZWVRVb3N2cU10S0lKU1BMeUpHYWVuU1d5L3NDUlNBUlVWOW9zaW1ZMVpp?=
 =?utf-8?B?b2NlS0FCa2xNN0ljczZCMDVQczdoY2Yxa3RJb0N1b3FDT3Q1Qy9WcE1DeUc3?=
 =?utf-8?B?UzJEL005N0xzTVNIQWkvbXV1eXllWTVXdzZBY1NtUG0xRG9GWXg0SnpSL3Nz?=
 =?utf-8?B?Y3o3MDhTSVByY3E2NjZNT2F5N3FqSDdXZ2M0WFRzaFpVcGV2M1hZdXo5VkpD?=
 =?utf-8?B?WHN1c2lnYnZpMUZodG9TTEdmdzdUVC9jamdOVjJEMXcyM0Y2OEgyelYxTlVO?=
 =?utf-8?B?cUluMUVjY0VndkhabHVDczRzWnV6ajkzOFhlaGQwV2tmYlpIUUFVL1RpZmF6?=
 =?utf-8?B?Q0RPbmw0Q2JLakhMRi9qcmNQTTVaS096eTFtcFphVlhuNnJVckpQYkovUzFz?=
 =?utf-8?B?RE1WYllGbEphejF3VmZUS0FCQytoTmQxOVJnSE1tK0E3MElnVThnTko1Zktn?=
 =?utf-8?B?NkVrbTdlbGw5UkRSUS9hdWFMa2VFWVV0SzZ4ZnRNV2I3R2xZc0FVMmkxYVdJ?=
 =?utf-8?B?SnYvVkMvc0lwSU5GU3k3ZFZ5VEUxZEwydWJmNDVOSEF6ZHczdHJlTWhVaXVU?=
 =?utf-8?B?eDQ4SS9oaFJoT2hRMVhid0E0a2UzbTVXNHBNTEU0VUdjRGh3bG1TQ2FtdHRo?=
 =?utf-8?B?YlRMRXpacG1MbGhxYkJGdHk0UW5ZaGs3UHJGbCtxekZDNFZveVZWWlJpUmlh?=
 =?utf-8?B?ZUJMWUIwUXpYSVFDejhuanNUQ0x6UHFRUGdBb3pvU2R3M0pRZTRVQytveVNF?=
 =?utf-8?B?Z3lwNXE2ck5qaG9rTUF6UEpMeW1rUE43cUVHdllpZUFJZlA5M0xBK3pwaFNC?=
 =?utf-8?B?L2J3WWQ0cFJ6c0drZTFHaitKc0lFUUpOQ0M0UDl0bDV4NmdIUmtRM210ckRp?=
 =?utf-8?B?Y3pYZ3dqTXBKRHBDM0Z1OC9MMWUwMkJFanRCcG41RUFteWFDZXhuZGx4ZUVl?=
 =?utf-8?B?b0ZtZGFNeisxaG5wRDRzem1pc1V3bTYrdGdZTDAzYmdPN3I3aEpOdExNN1Fa?=
 =?utf-8?B?MVE4MXpWT3o3WmZ4VzJMQkNVL3YxVFh4QVp5UWpiVDE5Nkd5eWE3MGtvU2VR?=
 =?utf-8?B?cGduNjMxYzVQc1R1NFUzM2ZHbWNxUUk2YVd3eFE0ZFNINERUQ01FTTVDeHVT?=
 =?utf-8?B?VnlDZFN4UTJlQ1N5TmxzOFZuREZuTDFGMENnK0Mvd20rWjRMb3F3RVA2ekVm?=
 =?utf-8?B?clUrMUc2cSsxWm9YanJXVU40WWROcDlISU93aisycTlhYXo0TWtobENjNytu?=
 =?utf-8?B?QVczVnZZRmpRNlVzT1pOMXBNdGFYb0RkMVVCZ2M1dDNXN3NuVXF2WmNLZmxS?=
 =?utf-8?B?TWt1bGVtZkIzSXRuUW5zVmszeFpNeWJGWlFmSDV2U2J0RVNTMDlRQ3BmUGQr?=
 =?utf-8?Q?2hEoslQ0/8O3rPSKNsLwK9U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dfe88b-fa49-4549-89cf-08d99f73cf2a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 09:16:39.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElIZDM8y2SlNgfwdL1M6kEAkXKQLy1qpVLiP8QFoXkf1pgfPnTuZgNiM10bZhiWuCxc5Nt7Awc5+UNtCPK9o3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4841
X-OriginatorOrg: citrix.com

On Thu, Nov 04, 2021 at 09:55:03AM +0100, Jan Beulich wrote:
> On 03.11.2021 15:57, Roger Pau Monne wrote:
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -454,6 +454,28 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
> >          libxl_defbool_setdefault(&b_info->nested_hvm,               false);
> >      }
> >  
> > +    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
> > +        libxl_physinfo info;
> > +
> > +        rc = libxl_get_physinfo(CTX, &info);
> > +        if (rc) {
> > +            LOG(ERROR, "failed to get hypervisor info");
> > +            return rc;
> > +        }
> > +
> > +        if (info.cap_gnttab_v2)
> > +            b_info->max_grant_version = 2;
> > +        else if (info.cap_gnttab_v1)
> > +            b_info->max_grant_version = 1;
> > +        else
> > +            /* No grant table support reported */
> > +            b_info->max_grant_version = 0;
> > +    } else if (b_info->max_grant_version & ~XEN_DOMCTL_GRANT_version_mask) {
> 
> Aren't you introducing a dependency of a stable library on an unstable
> interface here? I'm surprised this even builds, as I didn't expect
> libxl sources to include domctl.h in the first place.

libxl API is stable, but not it's ABI, and libxl strictly depends and
uses domctl. See for example libxl__domain_make and it's usage of
xen_domctl_createdomain.

I think the usage here of XEN_DOMCTL_GRANT_version_mask is fine.

> > @@ -219,6 +220,13 @@ static void parse_global_config(const char *configfile,
> >      else if (e != ESRCH)
> >          exit(1);
> >  
> > +    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
> > +                                  INT_MAX, &l, 1);
> > +    if (!e)
> > +        max_grant_version = l;
> > +    else if (e != ESRCH)
> > +        exit(1);
> 
> Would be kind of nice if out-of-range values were detected and
> reported right here, rather than causing puzzling errors at domain
> creation. But I have no idea whether doing so would be inconsistent
> with the processing of other global settings.

Hm, it could be done but doesn't seem to be common. AFAICT
parse_global_config just reads the values from the config file,
whether those values are sane doesn't seem to be implemented there.

> > @@ -1917,11 +1918,26 @@ active_alloc_failed:
> >  }
> >  
> >  int grant_table_init(struct domain *d, int max_grant_frames,
> > -                     int max_maptrack_frames)
> > +                     int max_maptrack_frames, unsigned int options)
> >  {
> >      struct grant_table *gt;
> > +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
> >      int ret = -ENOMEM;
> >  
> > +    if ( !max_grant_version )
> > +    {
> > +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
> > +                d);
> > +        return -EINVAL;
> > +    }
> 
> Wouldn't 0 rather be the most natural way to request no gnttab at all
> for a domain? (Arguably making things work that way could be left to
> a future change.)

Indeed, but that's not part of this change. I will post an updated
version of the grant disabling patch separately, as I don't think
that's 4.16 material.

> > +    if ( max_grant_version > opt_gnttab_max_version )
> > +    {
> > +        dprintk(XENLOG_INFO,
> > +                "%pd: requested grant version (%u) greater than supported (%u)\n",
> > +                d, max_grant_version, opt_gnttab_max_version);
> > +        return -EINVAL;
> > +    }
> > +
> >      /* Default to maximum value if no value was specified */
> >      if ( max_grant_frames < 0 )
> >          max_grant_frames = opt_max_grant_frames;
> 
> Neither here nor in domain_create() you check that the other bits of
> "options" are zero.

Right, will add.

> > @@ -69,7 +69,8 @@ int gnttab_acquire_resource(
> >  
> >  static inline int grant_table_init(struct domain *d,
> >                                     int max_grant_frames,
> > -                                   int max_maptrack_frames)
> > +                                   int max_maptrack_frames,
> > +                                   unsigned int options)
> >  {
> >      return 0;
> >  }
> 
> While arbitrary table size requests may be okay to ignore here, I'm
> unsure about the max-version: Requesting v3 is surely an error in any
> event; I'd even be inclined to suggest requesting v1 or v2 is as
> well. Adding such a check here looks like it would be compatible with
> all the other adjustments you're making.

I think if the grant table is disabled at build time we should only
accept version 0 as valid here.

Thanks, Roger.

