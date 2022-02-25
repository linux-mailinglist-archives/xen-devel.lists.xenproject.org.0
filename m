Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A64A4C48A0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279380.477110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcO7-0000qW-TY; Fri, 25 Feb 2022 15:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279380.477110; Fri, 25 Feb 2022 15:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcO7-0000oh-PA; Fri, 25 Feb 2022 15:20:07 +0000
Received: by outflank-mailman (input) for mailman id 279380;
 Fri, 25 Feb 2022 15:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNcO6-0007u5-AK
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:20:06 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67f3cc4d-964e-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:20:05 +0100 (CET)
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
X-Inumbo-ID: 67f3cc4d-964e-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/zbAF9xhZs7zkz99bXimn00C1AzPUbFM+7FY5qL3xcY=;
  b=WGrON8o++jv9HwVTgqOAK7zQ5uLMZj3A29Dmwnq10s5amLbOGaAjZ/qL
   Z7Dwy7c5RxposEwAMDrVK5EpCiCQEiNTyP5npqS7BBUyANNIXhxP4hEKf
   hStQ0PYvB1uq/TFK+y7Tmz33KekP1WKPsO54EBtZKu9uUcA51NiThpi2G
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64433622
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:M4LO4K9lG7p5PuqgeB45DrUDvn6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WYXXWiFOPaDNzajeIwka43j9RtV78CGnN9gHQdopX08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw24LkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYyIWywjI6flpPg6ShIEHwJyJ6lk1qCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4SQa2FO
 ZBDAdZpRFf5MwZIPEc2NKoZm8S4rUnafSFThmvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6FqC89/NsqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmK2tW1mX6729kS+VICNJIUwOfysmYxRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r4tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbGy0bb1HRcBJG9GRF5iLJ9E4DNZWfhoBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66IM4USO8QsLFffpEmCgHJ8OUi3wSDAdollZ
 P+mnTuEVy5GWcyLMhLsLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwOzraYp
 izmAxQAoLc97FWeQTi3hrlYQOqHdb50rG4hPDxqOlCt2nM5Zp2o4rtZfJwyFYTLPsQ6pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:Bkjsuqt41w0oO1eMHN8LAOPN7skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK6yXcT2/hvAV7CZnibhILMFuBfBOTZskTd8kHFh4tgPO
 JbAtJD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AWV0gJ1XYJNu/xKDwReOApP+tcKH
 LKjfA32QZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y5o2mfvVmHp6VO91xNPdfcla9Oi4kEFjiaGgPR5t3c04klfbMkcEIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64433622"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LI+JfwG6kG1cM0I8V9nSUbmNI8+3EKaURU9uLP8NXWyN1nDJKiSfl4+adluL8+TSiUFK+YSFupcJmrbKCeJeDvrayLVHLDLLFpNBrDtZlycsBVH0pPI29XJKN7NC434/qyDGhJtposeB3UibCKfadOH5FULpaLrMb8COBWjd5XRGh4WuzVfu8sScqyBv49vnr9en0b9+p5pgJosz5WWA1FVrPrp7aE0bYwI2r3vTsk1HyvJnOJ5nEfzxXn1NBzTt57m2hkSZni4Ym2cLOMpETgDqcoYW5iePyvYgG7Lpo6l4RSVfhpjBCTm7F4XfYUFxBEqAFw0kWNZiTeQS5plAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bN0IVcvEv4wCzAJopPvVAHw1GJdIujQtv3tKwci1P7U=;
 b=OGAmlQ64PCMPhpJlw0aNAQ+nv4Mk8E/yZigVi439qLqfcsREr2JwD9cD2CcqxWbEyys9M978VI3xuNvjBbNTcAMxsX6zHmGLBtiyR14XaBqQQ8Yur4VIOFSmOqtBsiXdMHoJX4gsM3Z0dH6otY2sCYioIEKn3MGi3xZMls5HbeHVt6cK4MGvaiv54XbF5FvlwDfTcaqrsRIkvHETUBGXQ/RQDt7h0JHGdDYakT5h5xnz91Zfl2W2dsOUPHQL+pitdZT/yXrIphFW5PnCojYDqsjUYhTknPnfnA91jwVb15xJqlGl2z82xRRxJqqpLFTrr8tFBFQLO2uk2M69/1wYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN0IVcvEv4wCzAJopPvVAHw1GJdIujQtv3tKwci1P7U=;
 b=MaeN+ykj5g+q1sr+aMzbuygV2hcZQjhSErcxyuf8/8ZnWsi2bC3EHjtgBWnHrI0zfRx9bH1UaEmixuLDmpdxfMhKKaAWUcNvasc4Jav56g5phBYZMftvF/xZkycSuPkvPUpl7KLA2Sy0irgXLyKSrZuGysnU4qjjDaHe2m0N7sU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] codeql: ignore Kconfig
Date: Fri, 25 Feb 2022 16:19:31 +0100
Message-ID: <20220225151931.99848-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225151931.99848-1-roger.pau@citrix.com>
References: <20220225151931.99848-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6200ad6c-eb3c-4459-0e4b-08d9f8724999
X-MS-TrafficTypeDiagnostic: CY4PR03MB3063:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3063790E66D1AD77ECCE2E358F3E9@CY4PR03MB3063.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hV/ZRsRRt9AlIXU/qvBQV8RRRRTX5sY696JiDyng/ohz214F1lulV3xbMj59MfAiDV+XeFYs1PSiYOtHTpfaNamIm1yd155l2TD9tLCNcF4XSFAlpQCatMzgqQ4ixCEb1tOHZqylB9gkfojrYXH7HLgJ3YkoWiiEmis4jk52AfqEU+sKVR8oZEhb9R24kC1XRNhoHgVpHOLxmV4MaITWpefboxyjcLljacydvB6g7+dOIvBdPpIHhCgqd06be2nw9pVuagJxLmkbwwVNHiGl2uJaBGDXB05Ldl8jKjSWiyWQMMOUOc4Nh7VsMEUpOlFjgBH2Vg2aSmW1jgf/6glROngfWSc2Sz8BwwfrkhKFf0H+uNEO/K8b7Cfyw8HLfSPOXgKtXu/JfkyQoFOON7NxYVDNe3wNBJBkIBjpVJAHLUO4T8DbIiRfub+/V2//X+dsqQrgRIFjoGZ57cjLBzKEKgfPGrvQj1UwRxBk3koxRuqcnz/5pORFcJ+zYnAKMfZ0fOZor4/aTXNE+SWjD+IXPOzl9aeFYjTfJjvj9qf3i8LL+efS/MWXYjWu7NV7OYxj/Q49Ifijm2+dLuf+B7xE+D6fUAUotffMupQNd3nBHqa5aviXRUKsCHWJ3OqpuDGP26C5a3WHZSAskLG1wCTfXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(6512007)(6486002)(26005)(8676002)(66476007)(5660300002)(6666004)(4326008)(6506007)(6916009)(316002)(66946007)(86362001)(54906003)(83380400001)(186003)(1076003)(2616005)(82960400001)(4744005)(36756003)(38100700002)(2906002)(508600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXZ3RHI3cEtTbHFocnBxcnpTZ0RZR1kvSzRRK3Fkd0ptdjlwVGlDR3Z1R0hB?=
 =?utf-8?B?YTZwODllTXRYZjQxeWJXNVRuaG51aCtVNHRuMTNESnd2OUJlYzRzSXJtYVJQ?=
 =?utf-8?B?L0trS3hiaTMyU3BVVTRtVWxWaG9GbUdtRXFzZnAxc1JvbjVIZ1pIcisrektX?=
 =?utf-8?B?eUNNNnl5eld6Vjgzb3FQSm9TZExaSDNJTjFNWGxOMVNHODNWY0VIM3huZXdo?=
 =?utf-8?B?YXBGRXpyWFE5TmthMzhXY1ZyQ2d2OU9FTnBxMk1qc0pmUWtWdWhram5YL3Ry?=
 =?utf-8?B?T0ViVmdvY09hUWRNVUd1WmIvUU9sczBrb1BkOTVNdytTa083RkV0VUdmekJY?=
 =?utf-8?B?NktyeS92blJCTURNT1N5Qk9pVEh1aktydG01MXhVNjN1ZkJVSDVscHYyaUZ6?=
 =?utf-8?B?ZHBkT1Y3ZnlSQmFzQ3V2UThlTG84RzliTHBkRTVNcUNwUTZrMWtHYkNYNi9J?=
 =?utf-8?B?S0ZJUVNxN3d3NkZVczY1WTFMVzZ4aGZtTXg3QUtmSkVZbWhtUVNvQTd1S3VK?=
 =?utf-8?B?VjJ6WUo5TldwSEo1cFJ3ZzhLc283b1hrSFhlenBxTWg1bk10L3liQ2daQ210?=
 =?utf-8?B?TWlNRGtsQ2FtMGh6MVRqS1pRVGxSVERUcWFWelpyU2RXY3phcWpOeTUwOHlq?=
 =?utf-8?B?b2Rrb0lxNFNDczVBbk9KcFlEZWNlMGhldFQ1aHdMR1dhMjdDdVpQM2ZKVjdI?=
 =?utf-8?B?WGtHQlBPNzhDaFdFWmF5ZXRRbHg3alpCaEVJQTJrcldWNkYrbW1nZVQxbEJi?=
 =?utf-8?B?c2x4OEhUUXNYa0hjeDE2NEJReEMyNFdiVFdNU3dQZk9zdVZPSzBLZVZaelpV?=
 =?utf-8?B?WVpxaFBNSTh3TE9xWUJUNkIwVUltdm5EWEQrbk0wNEMzdFo2YjQwVUsreFpR?=
 =?utf-8?B?bmJ1S3MrbE5Balo0clREUFUrMWZRcmczWGpibWxYQi81UnVVL1RPSERIdk9L?=
 =?utf-8?B?aGRkZ3hOckxHM0pSek9iWXFxYjFJQ1ZQWDhsTjJjTVhNNkpEY0tFUWJLNXMv?=
 =?utf-8?B?NHcybkdIREZ0TUxjRE8rMG8va21hcjRyRDZzVXUzNnlmeVRBUkU5Vm1jSm55?=
 =?utf-8?B?UUVBT3VKY0Z0MW0rY04yMFE2dzJFVUhtWDhHVVR1VUFxUW9BelM5NkREZUo3?=
 =?utf-8?B?MTBwVFZNMVVjbWk3MHluVnlaS2lQZmI1Vk5HMzFnOTJkZ204VExLNmtqemN0?=
 =?utf-8?B?RGJrNytaZEFySllURUJ2dUVxNjUzV2tGZGQvNkI1bXJSMmpZaUdVbXdpNGVz?=
 =?utf-8?B?Sy9xM2FzMzlpZHR0WnlISFpHVzdiZ2JjcVU2YzlXcjF5QUl0WDRhNVo3clU0?=
 =?utf-8?B?WEQ3YVJDeG5KeGVnRm0rR2F4K2tlWHp5TVV6Q21SbDFkbzhqZ0lCdGpRUUxU?=
 =?utf-8?B?bE1McDlmNVg4d3EyWDhDb2U5dk9aaHhsVHJRaTZsUUZMQjI4bG5mVHMyZUh0?=
 =?utf-8?B?SGJING1lanlwRjFuYzBqZWVvWm54d2VWVTI4cURrekZXSEZxa0NIeW4xNlh5?=
 =?utf-8?B?V3UvV3pINWF4eGVoZlVjV3NQSDRoa1dOdHU2QWV4bm1USTVjZHBiQ3B4THVE?=
 =?utf-8?B?L081dzBSaFBtM1lWQlNqd25mQnR0REhEZWFseVdITjN5anhhS3pBU3R2NEVm?=
 =?utf-8?B?SUkxdlJ1TE5QandzZkNuY0xIOENBNEpFYjdmd3VXRGljS28zQURySUlPVmtG?=
 =?utf-8?B?QUlzRkJVUnByWDBZajZ6UjQ3bDliVStyb2FZODBlZFdmSTBMV0d1dm5MbDdw?=
 =?utf-8?B?NFFST1RlaXZFT2gwdTJBOFhaOHlUNkhZY1dnVVA1bzVJcmtvUkYrUHMweisx?=
 =?utf-8?B?ZVJleDhTYnBZeXJ3Um1yQTJPWko4ZnNvdkEzeDlmWDhaSW1qdUI2alV2S3Yr?=
 =?utf-8?B?RjFFUytra0RrMzhBM1MxRDBXOW1qSzhjaEZ6YW82YmoycEVaUWxKSWNoTFls?=
 =?utf-8?B?djRkSEJYL3dIWElIVVhKaXB6VTJTTm51VUZsRWQ0a2U4YzMrckQzcVBtblI4?=
 =?utf-8?B?ajlyaFpKZVdvdnNEZlA4bDVNSXVIckhxM25xUUVDbXp3Vy9nK2IxSGx0NnU5?=
 =?utf-8?B?SzNKYnJRV2dQYThYVXVlSlJiQys5M0VXai9aMWpDZnphN081ZFZTUHkvbGhJ?=
 =?utf-8?B?UE50OXJPR0tQNENPMEplc21odnRIT3pNbzMzaVdZVlZOd0tKdFplWklMTFpX?=
 =?utf-8?Q?dkQCYazby7NgUxSP+TGmbDc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6200ad6c-eb3c-4459-0e4b-08d9f8724999
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:19:59.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdBCA8tZWVeFkTEQac7cHRqkDy9gOsAp63EGHxbjjKsxwe0zDprXrjeXfiZK6nZcehpyg8t3sMI3IxUen8NcuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3063
X-OriginatorOrg: citrix.com

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .github/codeql/codeql-config.yml | 2 ++
 .github/workflows/codeql.yml     | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 .github/codeql/codeql-config.yml

diff --git a/.github/codeql/codeql-config.yml b/.github/codeql/codeql-config.yml
new file mode 100644
index 0000000000..3648e8e39b
--- /dev/null
+++ b/.github/codeql/codeql-config.yml
@@ -0,0 +1,2 @@
+paths-ignore:
+  - xen/tools/kconfig
diff --git a/.github/workflows/codeql.yml b/.github/workflows/codeql.yml
index 5bfe478983..2e2dfeaee1 100644
--- a/.github/workflows/codeql.yml
+++ b/.github/workflows/codeql.yml
@@ -42,6 +42,7 @@ jobs:
 
     - uses: github/codeql-action/init@v1
       with:
+        config-file: ./.github/codeql/codeql-config.yml
         languages: ${{matrix.language}}
         queries: security-and-quality
 
-- 
2.34.1


