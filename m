Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CD85FDAAE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422178.668025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy9e-00075m-Jr; Thu, 13 Oct 2022 13:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422178.668025; Thu, 13 Oct 2022 13:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy9e-00072J-G8; Thu, 13 Oct 2022 13:21:42 +0000
Received: by outflank-mailman (input) for mailman id 422178;
 Thu, 13 Oct 2022 13:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/C9=2O=citrix.com=prvs=278604417=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiy9c-00072B-OB
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:21:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7393b48-4af9-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:21:39 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 09:21:36 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH0PR03MB5988.namprd03.prod.outlook.com (2603:10b6:610:e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 13:21:34 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 13:21:34 +0000
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
X-Inumbo-ID: f7393b48-4af9-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665667299;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BdEEJ4TFbjCjankn+sirz249XxLJHfUH4PwHRHJ1dE8=;
  b=Nq0HKtKFYeJjNUghGeyyyFNECApGCsF0ojsoSpuwbf2ND3nPmQNMl3M9
   aY1jBe9IwtWHDjO/dA/Mjb4WDc3ky7VsKfzWR1l+itkRtxldbGlObFRMe
   fPON04B1y7yKn3l4VBuN9aLXbPOIdNGRK6ZOXZDQQRKlorS+rsDwFpxfy
   Y=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 82283653
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:y1/mOahWdsld2XnPXcNloymQX161VxEKZh0ujC45NGQN5FlHY01je
 htvX22FbqrYNzD9Kox2YNnk8U4A6pLWzd42TQBrry89Fiob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVmPKsT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT5p+
 vk3NG0iVDusqfPozo+ZCfJOv9t2eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rWVzXilBdl6+LuQxPFNn0TPnWMqFTYaRVv8iqWfo0OEcocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUSyAyL0LuS3A+fCUANVDsHY9sj3OcpQRQ62
 1nPmMnmbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bs/7UZtNqEarwgtirHzj1m
 miOtHJn3+RVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5L2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:ITFly6mXGVwpnyqKufQ9H0Z7AWbpDfPJimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81k2dUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInpy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zUYIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6R9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF79tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcoa+d
 FVfY7hDcttAB2nhyizhBgv/DXsZAV5Iv6+eDlPhiTPuAIm3EyQzCMjtb8idzk7hdEAoqJ/lp
 X525RT5c5zp/AtHNxA7cc6ML6K4z/2MGbxGVPXB2jbP4c6HF+Ig6LLwdwOlZGXkdozvdMPpK
 g=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82283653"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tdb8cuD+XtiVo9BxclI6xu+vH66X+aW4JcutRa7HqzsjjsDf4HFyY/C2ppvoaDL3E2ZU4+1PwOnFiZj+IsH4zoV/mLFYLKZXjxbxbQSoIf1GTSSPro8QVhp4V/Grzs1KcY8LEfd4dP5h6qrQJPWbOj+aiFwf9SsKtVnB06N34zSPsTFaEumRnd78pT6HlKRabiDhsDVIc2ANamU7kVBLDUlK/QogNqR/tMccuIQ1hrlKix4zDCN9Aolp4WicsI2TfJtQqzl0+1XbAydxDJmx39pXMr5UESjObAJTA6soN4JjuJNieyBTXskCIFsvwiuLktOoxkLyVSmAomyQ3tGz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNS9IxhjXbPraLnCiQ3UlcAVBed+jkBVoJOA3z0D2CA=;
 b=QByp2i//eM5/aCEcx3Ppy3nx0rDwrLQ4rAtT/UDD9PGP9SFYBhiNhq290UbHzwlIl4UC/AdnBUVEnwwvJmIHmW390K8MjK+JYGgvxgCPdDxDatC4LN1mPjNsnOlRo3gmPF1bFjEcx/42EBk0pj7fLdSwvtGtSgySw4R38VdkZQYRMpzZhJZgSM01S/9jI/y+m6DAfwr/pPF5BSLVd+SiFOwVQKBWvS95srZYRtn2z/Fh4rlS+l0iRBpftU9SYm+zgDaD0V+D3hkFNgSRozj3WTGTfPUNgsAqKwpwU+kK9tfyj4GtzONrVNUhARvIxJAgYFKQ79o/UzduvJXeefqphQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNS9IxhjXbPraLnCiQ3UlcAVBed+jkBVoJOA3z0D2CA=;
 b=KXvl7JWuprl/IE3UXi3Tz4DvWVY2kAOWt9Zbk8RGfLGmb8ZUpbYeGEQjX2b5xvjVrwtBEaiss8AtIQZL8mCdH5irzyvvaprpRpcqIhZkG7MHk7jJS7cYuREyWemOkq0zNEWkeMy5QyK/zM4jTyWKUNPXY2Ay4Bq7geTGZO+TEjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Oct 2022 15:21:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 1/4] amd/virt_ssbd: set SSBD at vCPU context
 switch
Message-ID: <Y0gQ2P5dcUDDdGPS@Air-de-Roger>
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-2-roger.pau@citrix.com>
 <0ac3e95f-293e-d395-f69d-846f87edc0ea@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ac3e95f-293e-d395-f69d-846f87edc0ea@suse.com>
X-ClientProxiedBy: PA7P264CA0082.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:349::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH0PR03MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edcb0fc-53c8-4a6e-5d01-08daad1dd939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Je/Yr01e98GEM5lpxH41mZPNLDmgTygtW1a42XuL77VOJZ2q3+C102gZNMoXApohnJBsRYzWlUphJDv0nADQtEGnN1m4wfZqDAsxrgnGg57idceBXIm71k0K/ElTOZISFIoCRkwbyfoEVGkGwrbIOHRJiBI4A9W6ifPxBqdhOSUGZeKD/+wDsFGNPe33QcEAgWknm1PRrXMrydXkERXOeY0khqWlPhXs/S+olyzvQ11rcEL7rvBtjuyz7v/v6L1btr+bu1D73BO2B6y+1pG2u2URO+pyiB+3BK1F1QjcTxZJO5kKnYdo6l7jz18TqIm4bknat+nUTq+jquP30XfDmQGySCK0WNwmZ3fGYfY49V42G2x6y3Zz1lJ1aPDfktkEjKEeVsG1x1AxYvZGK117+cYqIaMDclgdU8K5ZD/Q3IzOh8muzf2KeZ3hOZ3m6fzFB25wrJGlFKp/wIdU5OSRojeL7cywTZ2+8j9hw6cNzyEH30v69Y2To3U9jnPCAP4rn80RQLVXPRAFwvAb65LV66BHh2TIBAzclInXUw3tvKBr5jppW6tipQfWe3+zrXc+ipgg7teF2qPMn9q/U+sIEbEFJ06nxI7b6U/fbPAtmeWumbMaiRGv+TCLTJqsrmDAXKf+Leps+Nrrfxk76+I26dif78f3/hAQl9hqggb81AOq//7GsN7HrVhiddI/164KGoxrnJs3nt2feVqXgIw9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(85182001)(186003)(9686003)(26005)(6512007)(41300700001)(53546011)(2906002)(316002)(33716001)(8936002)(66476007)(6916009)(54906003)(86362001)(66556008)(8676002)(4326008)(66946007)(6666004)(38100700002)(6506007)(82960400001)(478600001)(5660300002)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEV0bUxMZ0JxbDY4dWxIdFRoZU9PZ2IvRTU0NnJoZlBGUHVEczhxNHQrVDcr?=
 =?utf-8?B?cDROYlpuenNyNXg1NE0yZXhuQTNucWY4UUljeGlGU2kwOFA0RFhQTFhyNXVR?=
 =?utf-8?B?UVFqUWZUeGhkVTNBMGViNGUwdFVSVmV6d2VqaTZURzhqelZ6V0hJN1dpcWtn?=
 =?utf-8?B?aXBBL29YNTdWRjNQKzNkazIrMWhDNFZSN2FINGFWUVF0ZW9WM1VlUGhwcUpm?=
 =?utf-8?B?aFlwa2NWbVBiMzBEd1YybEErWjkxQlE5R2JLa0Z6cE1mNW1lZ2VTWHVJYVFt?=
 =?utf-8?B?cU9xam8ydm1QT1JrcXEzajJsRGFqVEJNbHE2b0QwanhDVnVrKzdZUlZrUVhz?=
 =?utf-8?B?Rk04WDhDL1hUS0xISU84UTNzY0U4RWRFU2o1enh0RFd0elNTSUxYckpBU3pL?=
 =?utf-8?B?N212bVVuQWd4VGxBTlZVeHR6MjJ6Zi9ubUZDS0xVOWhndnFsUk9jcmFzL1pH?=
 =?utf-8?B?QjVmSVZBL1Y4UWFhUzAwSThMQThGYWtFT3Q4bC9WcWxIWFZRVlZFZkQvTWo3?=
 =?utf-8?B?aXFaZmhNWlpZc0hXMzB6Z1NXOGJSeXJEbWVFTk9mT0dMZjQ0US8wVVBOM1c5?=
 =?utf-8?B?SWZBMk1BVzB6QmV6QXA5ZW1DNHI2c1RuNXZRRythazR6RFZyamQ4YW1tR0lq?=
 =?utf-8?B?cXhtamRGL3VUYldYaFdWSmV0SkpUYlVGbUFhOUQ1K0pmQ1hWRlltekZKQVQz?=
 =?utf-8?B?azRmMGl2SnFnQmpIQzBUTlpQcy83MXhMWi9SMmFCYW03L3JmbE94SXFEK25i?=
 =?utf-8?B?ZTFTMXF4dzVGODZqQVRjaER2YndyUkJmYXdrRkZWbVZ4Mng2eGEyVHQyQWZh?=
 =?utf-8?B?cllqTWZxRnhORzhTLzBpSWtjam0yMnB5YW43emJHRi9WekUzVFl5WlVDRWU4?=
 =?utf-8?B?ZUdqL0NiYy93TVhKamFKMGZRWG9BdDJlZEVGTXI0Qk5WNzl3MCt0YWxhczVj?=
 =?utf-8?B?eXp3Q1RoWW9hTnZlVlY4RDE5Ui9lRThZTzdnOUJlTHlYQjNHdXNUSGtNS1di?=
 =?utf-8?B?eDZxcitHczZOeG9YNGJLNkV6N2h0N0F0RFE3OGFxTzhPakdQcms2L3YwNVR3?=
 =?utf-8?B?T0FDSlN2RlNWUmQ0YVBodkttSjg0OXJHa0NBMy9jclNTM2o2MXVCRmdhb25B?=
 =?utf-8?B?b3dtbVk3d2paeE04QzhPZUR1OStXcGxCVUF4YlRtZVJXTllkMUNSNE5ZUFdI?=
 =?utf-8?B?UlBBTmplRm9ZWUNMNGNJUjRUSXd6RlRQOFVSRGRZbW01dE5oTTlGUDNlM1kw?=
 =?utf-8?B?S29uYnNGbElqeDdVdjNqMkVOSEZFenhsaUFqZEN1akE5YVY3SHJ4RXVHcjlB?=
 =?utf-8?B?bFA5OGNkQmZUYVBNR0xwN2luWW9EaXJQeEcrU1FReFdkV2tUSFVVS2RQZUNv?=
 =?utf-8?B?VDZkUEVTVEk4ZmJXaXpZeVBHa2poUU16eGY0cDlQaGNYbVR5Q3FoalM4TXZU?=
 =?utf-8?B?KzM3ZEZNZDFOZzNZMXRVcVBOd2VqenZQN0JTNDFzNTc4RkxTdjZuTWV3MmNt?=
 =?utf-8?B?clc0OUk1dFp1QVRaa1B3cURzdWNNNHdoRUJvRFpVWXRmNjRwR1N6dU5DY0Nr?=
 =?utf-8?B?SEwrN1dpUHFDdDdOZDcrZE85TkdRRmdZUXUybWFiRktkb3ZxRDdxSjRyaTdx?=
 =?utf-8?B?NjF0Unp2RjBaeDB0eTE3eWZxS3JpU1NWVzR6VTduajNRa3phWHlnNVpKQWto?=
 =?utf-8?B?YzFUQU4zYnFBZ3ZHTCtpcE1qRzdWTWhnd2I1d2VJU3BLcW5PRzZqdmF5cVAv?=
 =?utf-8?B?NE1GTE16bytNZTk1TEpIeGljdmNpMXRBcEpOaGMrQnpMejlPaTE4SzZSZE9J?=
 =?utf-8?B?TkppWWhIOVNaVUpPalc0N2JyV01VNUVvWkdJTGxhNURpTU1OYXl5RU9SSTdM?=
 =?utf-8?B?K3Y2Tms0aktOb0tLcEtWNEpuTUs5Mk55dDYvcHFobkRoQ1lDcVRrSncrVE1I?=
 =?utf-8?B?cVNmNWVIcUgyWEl6b0VpbjFrUlY2K1NmdUlCSFlPdDB4c3VmRHk3MG1EajBo?=
 =?utf-8?B?QnpEY0RnVkxOd1hSaU1wcDhpeFJSTUIxNm9KMjFsemk5MzR4MFZOak81ZHBz?=
 =?utf-8?B?ZHNzSGpGa2c3TjJCYnhHd2cyWnNPZ1BBY2tsVkdVUGtIcTBMOXp4Zy95ZjZ0?=
 =?utf-8?Q?RUkYTqLr1UYjDYkUSmeIQo1Os?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edcb0fc-53c8-4a6e-5d01-08daad1dd939
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 13:21:33.9074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PfSD+4KE+o2F/6WRlKdNnH0y3ObP6oNF1XHWuN/k/Sp6ZCcbE/INc8eAtrxvTAtLSp+Z/ReO+Jy2Q/Th5+qng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5988

On Wed, Oct 12, 2022 at 10:26:19AM +0200, Jan Beulich wrote:
> On 11.10.2022 18:02, Roger Pau Monne wrote:
> > @@ -140,6 +135,7 @@ __UNLIKELY_END(nsvm_hap)
> >           */
> >          stgi
> >  GLOBAL(svm_stgi_label)
> > +
> >          mov  %rsp,%rdi
> >          call svm_vmexit_handler
> >          jmp  .Lsvm_do_resume
> 
> Seemingly stray change?

Urg, this was a squash of initially two separate patches and I didn't
pay enough attention at the end result not introducing such spurious
changes, sorry.

> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -973,6 +973,14 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
> >  
> >      /* Resume use of ISTs now that the host TR is reinstated. */
> >      enable_each_ist(idt_tables[cpu]);
> > +
> > +    /*
> > +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
> > +     * is already cleared by svm_vmexit_spec_ctrl.
> > +     */
> > +    if ( v->domain->arch.cpuid->extd.virt_ssbd &&
> 
> With this false, can ...
> 
> > +         (v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD) )
> 
> ... this bit ever be set? IOW if the former condition actually needed here?

Hm, right, I guess it's not helpful to gate accessing the field to the
CPUID bit, as it should never be set otherwise.

> > +        amd_set_ssbd(false);
> >  }
> >  
> >  static void cf_check svm_ctxt_switch_to(struct vcpu *v)
> > @@ -1000,6 +1008,11 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
> >  
> >      if ( cpu_has_msr_tsc_aux )
> >          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> > +
> > +    /* Load SSBD if set by the guest. */
> > +    if ( v->domain->arch.cpuid->extd.virt_ssbd &&
> > +         (v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD) )
> > +        amd_set_ssbd(true);
> >  }
> 
> Same here then.
> 
> > @@ -2518,6 +2531,10 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
> >          vmcb->spec_ctrl = val;
> >          break;
> >  
> > +    case MSR_VIRT_SPEC_CTRL:
> > +        amd_set_ssbd(v->arch.msrs->virt_spec_ctrl.raw);
> 
> Would seem cheaper to pass "val & SPEC_CTRL_SSBD" here.

Yes, a couple less dereferences.

Thanks, Roger.

